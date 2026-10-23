import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, writeFileSync, unlinkSync, rmdirSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { checkSite, htmlTags, resolveExpectedArticle } from './site-health.mjs';

function contentFixture(t, entries) {
  const directory = mkdtempSync(join(tmpdir(), 'ai-news-health-test-'));
  t.after(() => {
    for (const name of Object.keys(entries)) unlinkSync(join(directory, name));
    rmdirSync(directory);
  });
  for (const [name, metadata] of Object.entries(entries)) {
    writeFileSync(join(directory, name), `---\ntitle: Test\ndescription: Test\ntags: [AI]\ncategories: [日报]\ndraft: false\n${metadata}\n---\n## News\n[Source](https://example.com/source)\n`);
  }
  return directory;
}

const origin = 'https://ai-news-blog-cg8.pages.dev';
const article = '/posts/ai-hot-2026-10-24/';
const headers = {
  'content-security-policy': "default-src 'self'; script-src 'self'; object-src 'none'; frame-ancestors 'none'",
  'strict-transport-security': 'max-age=31536000', 'x-content-type-options': 'nosniff',
  'x-frame-options': 'DENY', 'referrer-policy': 'strict-origin-when-cross-origin',
  'permissions-policy': 'camera=(), geolocation=(), microphone=()'
};
const home = `AI 热点追踪 <meta name="generator" content="Hugo 0.162.0"><a href="${article}">最新日报</a><link rel="stylesheet" href="/assets/site.css">`;
function fixture(overrides = {}, extraHeaders = {}) {
  const routes = {
    '/': home,
    '/search/': '<input id="searchInput"><script src="/assets/search.hash.js"></script>',
    '/index.json': JSON.stringify([{ title: '最新日报', content: '正文', permalink: origin + article, date: '2026-10-24', category: '日报' }]),
    '/sitemap.xml': `<urlset><url><loc>${origin}${article}</loc></url></urlset>`,
    '/categories/%E6%97%A5%E6%8A%A5/': `<a href="${article}">日报</a>`,
    [article]: '<article class="post-content">作者 ZestJT</article>',
    '/assets/site.css': 'body {color: black}',
    '/assets/search.hash.js': '/* search bundle */',
    ...overrides
  };
  return async url => {
    const path = new URL(url).pathname;
    const body = routes[path];
    return new Response(body ?? 'missing', { status: body === undefined ? 404 : 200, headers: { ...headers, ...extraHeaders, 'content-type': path.endsWith('.css') ? 'text/css' : path.endsWith('.js') ? 'application/javascript' : 'text/html' } });
  };
}
const options = { expectedArticle: article, expectedVersion: '0.162.0' };
test('checks target article, index, listing, sitemap and actual assets', async () => {
  assert.equal((await checkSite({ ...options, fetcher: fixture() })).passed, true);
});
test('broken JSON and omitted target article are actionable failures', async () => {
  for (const body of ['not json', '[]', JSON.stringify([{ title: 'old', content: 'old', permalink: origin + '/posts/old/' }])]) {
    const result = await checkSite({ ...options, fetcher: fixture({ '/index.json': body }) });
    assert.equal(result.passed, false);
    assert.ok(result.failures.some(message => /index|article missing/.test(message)));
  }
});
test('stale homepage, missing category article and missing assets fail separately', async () => {
  for (const [path, value, reason] of [
    ['/', home.replace(article, '/posts/old/'), /homepage/],
    ['/categories/%E6%97%A5%E6%8A%A5/', 'old listing', /category/],
    ['/assets/search.hash.js', undefined, /HTTP 404/],
    [article, '<h1>Not found</h1>', /content or author/]
  ]) {
    const result = await checkSite({ ...options, fetcher: fixture({ [path]: value }) });
    assert.ok(result.failures.some(message => reason.test(message)), JSON.stringify(result));
  }
});

test('accepts real minified attributes and fetches the preview assets on the preview origin', async () => {
  const fetcher = fixture({
    '/': `AI 热点追踪 <meta name=generator content='Hugo 0.162.0'><a href=${article}>日报</a><link rel='preload stylesheet' href=/assets/site.css>`,
    '/search/': '<input disabled id=searchInput><script defer src=/assets/search.hash.js></script>',
    '/categories/%E6%97%A5%E6%8A%A5/': `<a href=${origin}${article}>日报</a>`,
    [article]: '<article class=post-content>作者 ZestJT</article>'
  });
  const fetched = [];
  const result = await checkSite({ ...options, baseUrl: 'https://preview.example.test', fetcher: async url => {
    fetched.push(url);
    return fetcher(url);
  } });
  assert.deepEqual(result.failures, []);
  assert.equal(fetched.length, 8);
  assert.ok(fetched.every(url => new URL(url).origin === 'https://preview.example.test'));
  assert.ok(fetched.includes('https://preview.example.test/assets/search.hash.js'));
});

test('commented markup, script strings and unrelated attributes do not satisfy page checks', async () => {
  const result = await checkSite({ ...options, fetcher: fixture({
    '/': `AI 热点追踪 Hugo 0.162.0 <!-- ${home} --> <script>const fake = '<a href="${article}">fake</a>'</script>`,
    '/search/': '<div data-id="searchInput">id="searchInput"</div><script>const fake = \'<input id="searchInput">\';</script>'
  }) });
  for (const reason of [/generator/, /search input/, /homepage/, /stylesheet or search script/]) {
    assert.ok(result.failures.some(message => reason.test(message)), JSON.stringify(result));
  }
});

test('an external link with the right path does not count as a local article link', async () => {
  const result = await checkSite({ ...options, fetcher: fixture({ '/': home.replace(`href="${article}"`, `href="https://unrelated.example${article}"`) }) });
  assert.ok(result.failures.some(message => /homepage/.test(message)));
});

test('production noindex is a failure while preview noindex is allowed', async () => {
  for (const fetcher of [fixture({}, { 'x-robots-tag': 'noindex' }), fixture({ '/': home + '<meta name=robots content="noindex, follow">' })]) {
    const production = await checkSite({ ...options, fetcher });
    assert.ok(production.failures.some(message => /blocks search indexing/.test(message)));
    const preview = await checkSite({ ...options, baseUrl: 'https://preview.example.test', fetcher });
    assert.deepEqual(preview.failures, []);
  }
});

test('attribute parsing handles whitespace, quotes, booleans and URL entities', () => {
  const [tag] = htmlTags('<script DEFER SRC = "/assets/search.js?v=1&amp;mode=fast" data-note=example></script>');
  assert.equal(tag.name, 'script');
  assert.equal(tag.attributes.src, '/assets/search.js?v=1&mode=fast');
  assert.equal(tag.attributes.defer, '');
  assert.equal(tag.attributes['data-note'], 'example');
});

test('accepts relative and production permalinks while rejecting external index origins', async () => {
  for (const permalink of [article, origin + article]) {
    const index = JSON.stringify([{ title: '最新日报', content: '正文', permalink, date: '2026-10-24', category: '日报' }]);
    const result = await checkSite({ ...options, fetcher: fixture({ '/index.json': index }) });
    assert.deepEqual(result.failures, []);
  }
  for (const permalink of [`https://unrelated.example${article}`, `//unrelated.example${article}`, '', null]) {
    const index = JSON.stringify([{ title: '最新日报', content: '正文', permalink }]);
    const result = await checkSite({ ...options, fetcher: fixture({ '/index.json': index }) });
    assert.ok(result.failures.some(message => /^index.json:/.test(message)), JSON.stringify(result));
  }
});

test('checkout expectation detects a completely self-consistent but stale deployment', async t => {
  const contentDirectory = contentFixture(t, {
    'old.md': 'date: 2026-10-23T08:00:00+08:00\nslug: ai-hot-2026-10-23',
    'new.md': 'date: 2026-10-24T08:00:00+08:00\nslug: ai-hot-2026-10-24'
  });
  const oldArticle = '/posts/ai-hot-2026-10-23/';
  const fetcher = fixture({
    '/': home.replaceAll(article, oldArticle),
    '/index.json': JSON.stringify([{ title: '旧日报', content: '旧正文', permalink: oldArticle, date: '2026-10-23', category: '日报' }]),
    '/sitemap.xml': `<urlset><url><loc>${origin}${oldArticle}</loc></url></urlset>`,
    '/categories/%E6%97%A5%E6%8A%A5/': `<a href=${oldArticle}>旧日报</a>`,
    [oldArticle]: '<article class=post-content>作者 ZestJT</article>',
    [article]: undefined
  });
  assert.equal((await checkSite({ expectedVersion: options.expectedVersion, fetcher })).passed, true);
  const expectedArticle = resolveExpectedArticle({ contentDirectory, now: '2026-10-24T12:00:00Z' });
  const result = await checkSite({ ...options, expectedArticle, fetcher });
  assert.equal(result.expectedArticle, article);
  assert.equal(result.passed, false);
  for (const reason of [/search index/, /homepage/, /category listing/, /sitemap/, /HTTP 404/]) {
    assert.ok(result.failures.some(message => reason.test(message)), JSON.stringify(result));
  }
});

test('checkout expectation excludes drafts, future publications and expired articles', t => {
  const contentDirectory = contentFixture(t, {
    'published.md': 'date: 2026-10-24T08:00:00+08:00\nslug: published',
    'draft.md': 'date: 2026-10-25\nslug: draft',
    'future.md': 'date: 2026-10-25\nslug: future',
    'scheduled.md': 'date: 2026-10-24T11:00:00Z\npublishDate: 2026-10-25\nslug: scheduled',
    'expired.md': 'date: 2026-10-24T11:00:00Z\nexpiryDate: 2026-10-24T11:30:00Z\nslug: expired'
  });
  // Change the existing key, so YAML duplicate-key validation remains meaningful.
  writeFileSync(join(contentDirectory, 'draft.md'), '---\ndraft: true\ndate: 2026-10-24T11:00:00Z\nslug: draft\n---\nDraft');
  assert.equal(resolveExpectedArticle({ contentDirectory, now: '2026-10-24T12:00:00Z' }), '/posts/published/');
});

test('equal timestamps use a stable slug order and timezone-free dates follow UTC', t => {
  const contentDirectory = contentFixture(t, {
    'a-file.md': 'date: 2026-10-24T08:00:00+08:00\nslug: z-last',
    'z-file.md': 'date: 2026-10-24T00:00:00\nslug: a-first'
  });
  assert.equal(resolveExpectedArticle({ contentDirectory, now: '2026-10-24T00:00:00Z' }), '/posts/a-first/');
});

test('explicit expectation overrides the checkout; no eligible local article fails closed', t => {
  assert.equal(resolveExpectedArticle({ expectedArticle: '/posts/manual/', contentDirectory: 'does-not-exist' }), '/posts/manual/');
  const contentDirectory = contentFixture(t, { 'future.md': 'date: 2030-01-01\nslug: future' });
  assert.throws(() => resolveExpectedArticle({ contentDirectory, now: '2026-10-24T12:00:00Z' }), /no published article found/);
});
