import { readFileSync, readdirSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { validatePost } from './content-validation.mjs';

const productionOrigin = 'https://ai-news-blog-cg8.pages.dev';
const projectRoot = resolve(dirname(fileURLToPath(import.meta.url)), '..');

function publicationTimestamp(value, name, field) {
  // Hugo uses UTC when this site's frontmatter omits a timezone. Do not let the
  // monitor host's local timezone change whether an article is considered future.
  const input = typeof value === 'string' && /^\d{4}-\d{2}-\d{2}(?:T|$)/.test(value) ? value : '';
  const normalized = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}(?::\d{2}(?:\.\d+)?)?$/.test(input) ? `${input}Z` : input;
  const timestamp = Date.parse(normalized);
  const [year, month, day] = input.slice(0, 10).split('-').map(Number);
  if (!Number.isFinite(timestamp) || year < 1 || month < 1 || month > 12 || day < 1 || day > new Date(Date.UTC(year, month, 0)).getUTCDate()) {
    throw new Error(`${name}: invalid ${field}; cannot determine the expected published article`);
  }
  return timestamp;
}

export function resolveExpectedArticle({ expectedArticle, contentDirectory = resolve(projectRoot, 'content/posts'), now = new Date() } = {}) {
  if (expectedArticle) return expectedArticle;
  const timestamp = new Date(now).getTime();
  if (!Number.isFinite(timestamp)) throw new Error('invalid monitor reference time');
  const candidates = [];
  for (const entry of readdirSync(contentDirectory, { withFileTypes: true })) {
    if (!entry.isFile() || !entry.name.endsWith('.md') || entry.name === '_index.md') continue;
    const { metadata } = validatePost(readFileSync(resolve(contentDirectory, entry.name), 'utf8'), entry.name);
    if (!metadata) throw new Error(`${entry.name}: cannot read article metadata`);
    if (metadata.draft === true) continue;
    if (metadata.draft !== false) throw new Error(`${entry.name}: draft must be a boolean`);
    const date = publicationTimestamp(metadata.date, entry.name, 'date');
    const publishDate = publicationTimestamp(metadata.publishDate ?? metadata.publishdate ?? metadata.date, entry.name, 'publishDate');
    const expiryValue = metadata.expiryDate ?? metadata.expirydate;
    const expiryDate = expiryValue === undefined ? Infinity : publicationTimestamp(expiryValue, entry.name, 'expiryDate');
    if (publishDate > timestamp || expiryDate < timestamp) continue;
    if (typeof metadata.slug !== 'string' || !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(metadata.slug)) {
      throw new Error(`${entry.name}: invalid slug; cannot determine the expected article URL`);
    }
    candidates.push({ date, path: `/posts/${metadata.slug}/`, name: entry.name });
  }
  // Code-point ordering is stable across platforms and locales when timestamps tie.
  const compare = (left, right) => left < right ? -1 : left > right ? 1 : 0;
  candidates.sort((a, b) => b.date - a.date || compare(a.path, b.path) || compare(a.name, b.name));
  if (!candidates.length) throw new Error(`no published article found in ${contentDirectory} at ${new Date(timestamp).toISOString()}`);
  return candidates[0].path;
}

const pathOf = value => decodeURI(new URL(value, productionOrigin).pathname);
const decodeAttribute = value => value.replace(/&(?:amp|quot|apos|lt|gt|#\d+|#x[\da-f]+);/gi, entity => {
  const name = entity.slice(1, -1).toLowerCase();
  if (name[0] !== '#') return { amp: '&', quot: '"', apos: "'", lt: '<', gt: '>' }[name];
  const code = name[1] === 'x' ? parseInt(name.slice(2), 16) : parseInt(name.slice(1), 10);
  return code > 0 && code <= 0x10ffff && !(code >= 0xd800 && code <= 0xdfff) ? String.fromCodePoint(code) : '\ufffd';
});

// Inspect actual start tags, including Hugo's minified unquoted attributes. Ignore
// markup-shaped text inside comments and script/style bodies rather than counting it.
export function htmlTags(html) {
  const markup = html.replace(/<!--[\s\S]*?-->/g, '')
    .replace(/(<(script|style)\b(?:"[^"]*"|'[^']*'|[^'">])*?>)[\s\S]*?<\/\2\s*>/gi, '$1');
  return [...markup.matchAll(/<([a-z][\w:-]*)\b((?:"[^"]*"|'[^']*'|[^'">])*)>/gi)].map(match => {
    const attributes = Object.create(null);
    for (const attribute of match[2].matchAll(/([^\s"'<>\/=]+)(?:\s*=\s*(?:"([^"]*)"|'([^']*)'|([^\s"'=<>`]+)))?/g)) {
      const name = attribute[1].toLowerCase();
      if (!Object.hasOwn(attributes, name)) attributes[name] = decodeAttribute(attribute[2] ?? attribute[3] ?? attribute[4] ?? '');
    }
    return { name: match[1].toLowerCase(), attributes };
  });
}
const hasPath = (html, path) => htmlTags(html).some(({ name, attributes }) => {
  if (name !== 'a' || !attributes.href) return false;
  try { return new URL(attributes.href, productionOrigin).origin === productionOrigin && pathOf(attributes.href) === pathOf(path); }
  catch { return false; }
});
const linksToAssets = html => htmlTags(html).flatMap(({ name, attributes }) => {
  const value = name === 'script' ? attributes.src : name === 'link' && attributes.rel?.toLowerCase().split(/\s+/).includes('stylesheet') ? attributes.href : null;
  if (!value) return [];
  try { return new URL(value, productionOrigin).origin === productionOrigin ? [value] : []; }
  catch { return []; }
});
const blocksIndexing = value => /(?:^|[\s,;:])(?:noindex|none)(?:$|[\s,;])/i.test(value || '');

export function parseSearchIndex(text) {
  const index = JSON.parse(text);
  if (!Array.isArray(index) || !index.length) throw new Error('search index must be a nonempty array');
  const paths = new Set();
  for (const item of index) {
    if (!item || typeof item.title !== 'string' || !item.title.trim() || typeof item.content !== 'string') throw new Error('search index item has invalid title/content');
    if (typeof item.permalink !== 'string' || !item.permalink.trim()) throw new Error('search index item has an invalid permalink');
    const url = new URL(item.permalink, productionOrigin);
    if (url.origin !== productionOrigin || !url.pathname.startsWith('/')) throw new Error('search index item has an unexpected origin');
    if (paths.has(url.pathname)) throw new Error('search index has duplicate permalinks');
    paths.add(url.pathname);
  }
  return index;
}

export async function checkSite({ baseUrl = productionOrigin, expectedArticle, expectedVersion, fetcher = fetch } = {}) {
  const base = new URL(baseUrl);
  const failures = [];
  const responses = new Map();
  async function read(path) {
    const requestUrl = new URL(path, base);
    // Preview and local acceptance must fetch their own assets, not silently hit production.
    if (requestUrl.origin === productionOrigin) requestUrl.host = base.host;
    requestUrl.protocol = base.protocol;
    try {
      const response = await fetcher(requestUrl.href, { signal: AbortSignal.timeout(20_000), headers: { 'user-agent': 'ai-news-blog-health-check/2.0' } });
      const body = await response.text();
      const result = { status: response.status, body, headers: response.headers };
      responses.set(path, result);
      if (response.status !== 200) failures.push(`${path}: HTTP ${response.status}, expected 200`);
      const metaNoindex = /text\/html/i.test(response.headers.get('content-type') || '') && htmlTags(body).some(({ name, attributes }) =>
        name === 'meta' && ['robots', 'googlebot', 'bingbot'].includes(attributes.name?.toLowerCase()) && blocksIndexing(attributes.content));
      if (base.origin === productionOrigin && (blocksIndexing(response.headers.get('x-robots-tag')) || metaNoindex)) {
        failures.push(`${path}: production response blocks search indexing`);
      }
      return result;
    } catch (error) { failures.push(`${path}: ${error.message}`); return null; }
  }
  const [home, search, data, sitemap, daily] = await Promise.all(['/', '/search/', '/index.json', '/sitemap.xml', '/categories/%E6%97%A5%E6%8A%A5/'].map(read));
  if (home && !home.body.includes('AI 热点追踪')) failures.push('homepage title marker missing');
  const requiredHeaders = {
    'content-security-policy': /default-src 'self'.*object-src 'none'.*frame-ancestors 'none'/,
    'strict-transport-security': /max-age=31536000/,
    'x-content-type-options': /^nosniff$/,
    'x-frame-options': /^DENY$/,
    'referrer-policy': /^strict-origin-when-cross-origin$/,
    'permissions-policy': /camera=\(\).*geolocation=\(\).*microphone=\(\)/
  };
  if (home) for (const [key, rule] of Object.entries(requiredHeaders)) if (!rule.test(home.headers.get(key) || '')) failures.push(`homepage security header missing/invalid: ${key}`);
  if (home && /script-src[^;]*'unsafe-inline'/.test(home.headers.get('content-security-policy') || '')) failures.push('script CSP permits unsafe-inline');
  if (home && expectedVersion && !htmlTags(home.body).some(({ name, attributes }) => name === 'meta' && attributes.name === 'generator' && attributes.content === `Hugo ${expectedVersion}`)) failures.push(`expected Hugo ${expectedVersion} generator`);
  if (search && !htmlTags(search.body).some(({ name, attributes }) => name === 'input' && attributes.id === 'searchInput')) failures.push('search input missing');
  if (sitemap && !/<urlset\b/.test(sitemap.body)) failures.push('sitemap is not a URL set');
  let index = [];
  try { if (data) index = parseSearchIndex(data.body); }
  catch (error) { failures.push(`index.json: ${error.message}`); }
  const latest = index.filter(item => pathOf(item.permalink).startsWith('/posts/'))
    .sort((a, b) => String(b.date || '').localeCompare(String(a.date || '')))[0];
  const target = expectedArticle || (latest && pathOf(latest.permalink));
  if (!target) failures.push('no article available for consistency check');
  if (target) {
    if (!index.some(item => pathOf(item.permalink) === pathOf(target))) failures.push('expected article missing from search index');
    if (home && !hasPath(home.body, target)) failures.push('expected article missing from homepage');
    const targetItem = index.find(item => pathOf(item.permalink) === pathOf(target));
    if ((targetItem?.category === '日报' || /\/ai-hot-\d/.test(target)) && daily && !hasPath(daily.body, target)) failures.push('expected daily article missing from category listing');
    if (sitemap && !sitemap.body.includes(new URL(target, productionOrigin).href)) failures.push('expected article missing from sitemap');
    const article = await read(target);
    if (article && (!htmlTags(article.body).some(({ attributes }) => attributes.class?.split(/\s+/).includes('post-content')) || !article.body.includes('ZestJT'))) failures.push('expected article content or author missing');
  }
  const assets = [...new Set([...(home ? linksToAssets(home.body) : []), ...(search ? linksToAssets(search.body) : [])])];
  if (!assets.some(asset => /\.css(?:\?|$)/.test(asset)) || !assets.some(asset => /search[^/]*\.js/.test(asset))) failures.push('required stylesheet or search script reference missing');
  await Promise.all(assets.map(async asset => {
    const response = await read(asset);
    if (response) {
      const type = response.headers.get('content-type') || '';
      if (/\.css(?:\?|$)/.test(asset) ? !/text\/css/.test(type) : !/(?:javascript|ecmascript)/.test(type)) failures.push(`${asset}: incorrect content type`);
      if (!response.body.trim()) failures.push(`${asset}: empty asset`);
    }
  }));
  return { passed: failures.length === 0, failures, indexItems: index.length, expectedArticle: target, checkedResources: responses.size };
}

if (process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href) {
  const args = process.argv.slice(2);
  const option = name => { const index = args.indexOf(name); return index < 0 ? undefined : args[index + 1]; };
  const version = readFileSync(resolve(projectRoot, '.hugo-version'), 'utf8').trim();
  const expectedArticle = resolveExpectedArticle({ expectedArticle: option('--expected-article') });
  const result = await checkSite({ baseUrl: option('--base-url'), expectedArticle, expectedVersion: version });
  console.log(JSON.stringify(result, null, 2));
  if (!result.passed) process.exitCode = 1;
}
