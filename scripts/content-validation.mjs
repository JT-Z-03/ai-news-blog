import { readFileSync, readdirSync } from 'node:fs';
import { resolve, dirname } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { parseDocument } from 'yaml';
import MarkdownIt from 'markdown-it';

const markdown = new MarkdownIt({ linkify: true });
const nonempty = value => typeof value === 'string' && value.trim().length > 0;
const validDate = value => {
  if (!nonempty(value) || !/^\d{4}-\d{2}-\d{2}(?:T|$)/.test(value) || !Number.isFinite(Date.parse(value))) return false;
  const [year, month, day] = value.slice(0, 10).split('-').map(Number);
  return year > 0 && month >= 1 && month <= 12 && day >= 1 && day <= new Date(Date.UTC(year, month, 0)).getUTCDate();
};
const sourceLink = tokens => tokens.some(token =>
  (token.type === 'link_open' && /^https?:\/\//i.test(token.attrGet('href') || '')) ||
  (token.children && sourceLink(token.children)));

export function validatePost(text, name = 'article.md') {
  const errors = [];
  const fail = message => errors.push(`${name}: ${message}`);
  const match = text.replace(/^\uFEFF/, '').match(/^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)([\s\S]*)$/);
  if (!match) return { errors: [`${name}: expected YAML frontmatter delimited by ---`], metadata: null };
  const document = parseDocument(match[1], { uniqueKeys: true });
  if (document.errors.length) return { errors: document.errors.map(error => `${name}: ${error.message}`), metadata: null };
  let metadata;
  try { metadata = document.toJS({ maxAliasCount: 30 }); }
  catch (error) { return { errors: [`${name}: ${error.message}`], metadata: null }; }
  if (!metadata || typeof metadata !== 'object' || Array.isArray(metadata)) return { errors: [`${name}: frontmatter must be a mapping`], metadata: null };
  for (const key of ['title', 'description', 'slug']) {
    if (!nonempty(metadata[key])) fail(`frontmatter '${key}' must be a nonempty string`);
  }
  if (nonempty(metadata.slug) && !/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(metadata.slug)) fail('slug must use lowercase letters, digits and hyphens');
  if (!validDate(metadata.date)) fail('date must be a valid ISO date');
  if (typeof metadata.draft !== 'boolean') fail('draft must be a boolean');
  for (const key of ['tags', 'categories']) {
    if (!Array.isArray(metadata[key]) || !metadata[key].length || !metadata[key].every(nonempty)) fail(`${key} must be a nonempty list of nonempty strings`);
  }
  for (const key of ['author', 'authors', 'publisher']) {
    if (Object.hasOwn(metadata, key)) {
      const names = Array.isArray(metadata[key]) ? metadata[key] : [metadata[key]];
      if (!names.length || names.some(name => name !== 'ZestJT')) fail(`${key} must be ZestJT`);
    }
  }
  const body = match[2];
  const tokens = markdown.parse(body, {});
  if (tokens.some(token => token.type === 'heading_open' && token.tag === 'h1')) fail('body must not repeat the page title as an H1');
  if (!sourceLink(tokens)) fail('no usable HTTP(S) source link found in body');
  // Publication signatures, not mentions of the authors of a paper.
  for (const line of body.split(/\r?\n/)) {
    const direct = line.match(/^[\s>*_\/-]*(?:作者|发布人|撰稿人)(?:\s*[，,:：]\s*|\s+)([^\s，,。·|*_]+)/);
    const footer = /^\s*\*/.test(line) && /(?:日报|深度分析)/.test(line)
      ? line.match(/作者(?:\s*[，,:：]\s*|\s+)([^\s，,。·|*_]+)/) : null;
    const byline = direct || footer;
    if (byline && byline[1] !== 'ZestJT') fail('publication byline must be ZestJT');
  }
  if (metadata.categories?.includes('日报')) {
    const entries = [];
    for (let i = 0; i < tokens.length; i++) {
      if (tokens[i].type !== 'heading_open' || !['h2', 'h3'].includes(tokens[i].tag)) continue;
      const level = Number(tokens[i].tag.slice(1));
      const title = tokens[i + 1]?.content || 'untitled';
      let end = i + 3;
      while (end < tokens.length && !(tokens[end].type === 'heading_open' && Number(tokens[end].tag.slice(1)) <= level)) end++;
      if (tokens.slice(i + 3, end).some(token => token.type === 'heading_open' && token.tag === 'h3')) continue;
      const paragraphs = tokens.slice(i + 3, end).filter(token => token.type === 'inline');
      const onlyText = paragraphs.length === 1 ? paragraphs[0].children?.filter(token => token.type === 'text').map(token => token.content).join('') : '';
      // A legacy empty-category declaration is not a news item. No arbitrary text is exempted.
      if (level === 2 && /^[（(]\d{1,2}月\d{1,2}日数据无本分类条目[）)]$/.test(onlyText)) continue;
      entries.push(title);
      if (!sourceLink(tokens.slice(i + 3, end))) fail(`daily entry "${title}" has no HTTP(S) source link`);
    }
    if (!entries.length) fail('daily article must contain news entries under headings');
  }
  return { errors, metadata };
}

export function validateContentDirectory(directory) {
  const errors = [];
  const slugs = new Map();
  const files = readdirSync(directory).filter(name => name.endsWith('.md')).sort();
  for (const name of files) {
    const result = validatePost(readFileSync(resolve(directory, name), 'utf8'), name);
    errors.push(...result.errors);
    const slug = result.metadata?.slug;
    if (nonempty(slug)) {
      const key = slug.trim().normalize('NFC').toLowerCase();
      if (slugs.has(key)) errors.push(`${name}: duplicate slug '${slug}' also used by ${slugs.get(key)}`);
      else slugs.set(key, name);
    }
  }
  return { files: files.length, errors };
}

if (process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href) {
  const directory = process.argv[2] || resolve(dirname(fileURLToPath(import.meta.url)), '../content/posts');
  const result = validateContentDirectory(directory);
  if (result.errors.length) { console.error(result.errors.join('\n')); process.exitCode = 1; }
  else console.log(`Content validation passed: ${result.files} articles, structured metadata and per-entry sources.`);
}
