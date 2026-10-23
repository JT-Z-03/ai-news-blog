import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { runInNewContext } from 'node:vm';
import { createSearchIndex, isComposing, normalizeQuery, readSearchState, resultSnippet, safeResultUrl, searchStateUrl, RESULT_LIMIT } from '../assets/js/search-core.mjs';

const Fuse = runInNewContext(readFileSync(new URL('../themes/hugo-PaperMod/assets/js/fuse.basic.min.js', import.meta.url), 'utf8') + '\nFuse;');
const base = 'https://example.test/search/';
const article = (i, category = '日报', content = '人工智能 新闻') => ({
    title: `文章 ${i}`, category, content, date: '2026-10-24', permalink: `/posts/item-${i}/`
});

test('full-text search recalls a term far beyond the opening excerpt', () => {
    const entry = article(1, '深度分析', `${'这里是很长的前文。'.repeat(500)}只有文末出现的量子纠错`);
    const result = createSearchIndex([entry], Fuse, base).search('量子纠错');
    assert.equal(result.results[0].item.permalink, '/posts/item-1/');
    assert.match(resultSnippet(entry.content, '量子纠错').map((part) => part.text).join(''), /量子纠错/);
});

test('multiple literal terms match the full body and title typos retain a fallback', () => {
    const entry = { ...article(1, '深度分析', 'OpenAI 发布模型，支持智能体。'), title: 'DeepSeek 发布' };
    const index = createSearchIndex([entry], Fuse, base);
    assert.equal(index.search('OpenAI 智能体').results.length, 1);
    assert.equal(index.search('  openai   智能体  ').results.length, 1);
    assert.equal(createSearchIndex([entry], Fuse, base, null).search('openai').results.length, 1);
    assert.equal(index.search('DeapSeek').results.length, 1);
    assert.equal(index.search('不存在的术语').results.length, 0);
});

test('type filtering precedes result limiting, and truncation is reported honestly', () => {
    const data = Array.from({ length: 80 }, (_, i) => article(i));
    data.push(article(90, '深度分析'));
    const index = createSearchIndex(data, Fuse, base);
    assert.equal(index.search('人工智能').results.length, RESULT_LIMIT);
    assert.equal(index.search('人工智能').more, true);
    assert.equal(index.search('人工智能', 'analysis').results.length, 1);
    assert.equal(index.search('人工智能', 'analysis').results[0].item.category, '深度分析');
    assert.equal(index.search('人工智能', 'analysis').more, false);
    assert.deepEqual(index.search('  '), { results: [], more: false });
});

test('state restores a shareable Chinese query and type without losing unrelated URL state', () => {
    const url = searchStateUrl(`${base}?source=nav#results`, { query: ' 智能体 ', type: 'analysis' });
    assert.deepEqual(readSearchState(url), { query: '智能体', type: 'analysis' });
    assert.equal(url.searchParams.get('source'), 'nav');
    assert.equal(url.hash, '#results');
    const cleared = searchStateUrl(url, { query: '', type: 'all' });
    assert.equal(cleared.searchParams.has('q'), false);
    assert.equal(cleared.searchParams.has('type'), false);
    assert.deepEqual(readSearchState(`${base}?q=test&type=__proto__`), { query: 'test', type: 'all' });
    assert.equal(normalizeQuery('中'.repeat(1000)).length, 64);
});

test('IME guards protect composition state, isComposing events, and legacy keyCode 229', () => {
    assert.equal(Boolean(isComposing({ key: 'Escape' }, true)), true);
    assert.equal(Boolean(isComposing({ key: 'ArrowDown', isComposing: true })), true);
    assert.equal(Boolean(isComposing({ key: 'Escape', keyCode: 229 })), true);
    assert.equal(Boolean(isComposing({ key: 'ArrowDown', isComposing: false, keyCode: 40 })), false);
});

test('result links reject executable and foreign URLs while allowing local navigation', () => {
    for (const value of ['javascript:alert(1)', 'data:text/html,test', '//evil.test/path', 'https://evil.test/path']) {
        assert.equal(safeResultUrl(value, base), null);
    }
    assert.equal(safeResultUrl('/posts/中文/#section', base), '/posts/%E4%B8%AD%E6%96%87/#section');
    const invalid = { ...article(0), permalink: 'javascript:alert(1)' };
    assert.equal(createSearchIndex([null, {}, invalid, article(1)], Fuse, base).search('人工智能').results.length, 1);
    assert.throws(() => createSearchIndex({}, Fuse, base), /array/);
});

test('a production absolute index works on preview origins without accepting third-party links', () => {
    const production = 'https://ai-news-blog-cg8.pages.dev/';
    const preview = 'https://preview-123.pages.dev/search/';
    const index = createSearchIndex([
        { ...article(1), permalink: `${production}posts/production-link/` },
        { ...article(2), permalink: 'https://untrusted.invalid/posts/foreign/' }
    ], Fuse, preview, null, production);
    const result = index.search('人工智能');
    assert.equal(result.results.length, 1);
    assert.equal(result.results[0].item.permalink, '/posts/production-link/');
    assert.equal(new URL(result.results[0].item.permalink, preview).origin, new URL(preview).origin);
});

test('snippets preserve untrusted input as text and place the exact match in a bounded excerpt', () => {
    const content = `${'背景'.repeat(200)} <img src=x onerror=alert(1)> 模型蒸馏 ${'后文'.repeat(200)}`;
    const parts = resultSnippet(content, '模型蒸馏');
    assert.equal(parts.filter((part) => part.marked).map((part) => part.text).join(''), '模型蒸馏');
    assert.ok(parts.map((part) => part.text).join('').length <= 152);
    assert.match(parts.map((part) => part.text).join(''), /<img src=x onerror=alert\(1\)>/);
    assert.ok(parts[0].text === '…');
    assert.equal(resultSnippet('标题的正文', '其他')[0].text, '标题的正文');
});
