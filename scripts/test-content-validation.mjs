import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, writeFileSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { validatePost, validateContentDirectory } from './content-validation.mjs';

const valid = `---
title: "日报"
date: 2026-10-24T08:00:00+08:00
draft: false
tags: [AI]
categories: [日报]
slug: daily-fixture
description: 测试说明
author: ZestJT
---
## 产品
### 第一条消息
内容。[原文](https://example.com/one)
### 第二条消息
内容。[原文][source]

[source]: https://example.com/two
`;

test('parses YAML and reference links, ignoring fenced headings', () => {
  assert.deepEqual(validatePost(valid + '\n```md\n# code sample\n```').errors, []);
});
test('rejects empty fields, malformed dates, scalar taxonomies, duplicate keys and wrong author', () => {
  for (const [from, to] of [
    ['title: "日报"', 'title: "  "'], ['description: 测试说明', 'description: null'],
    ['2026-10-24T08:00:00+08:00', 'not-a-date'], ['2026-10-24T08:00:00+08:00', '2026-02-30T08:00:00+08:00'], ['draft: false', 'draft: "false"'],
    ['tags: [AI]', 'tags: AI'], ['categories: [日报]', 'categories: []'],
    ['author: ZestJT', 'author: Someone'], ['slug: daily-fixture', 'slug: daily-fixture\nslug: duplicate']
  ]) assert.ok(validatePost(valid.replace(from, to)).errors.length, `${from} must be rejected`);
});
test('a source elsewhere cannot hide a missing source in one daily entry', () => {
  const result = validatePost(valid.replace('内容。[原文][source]', '只有无来源的文字。'));
  assert.equal(result.errors.length, 1);
  assert.match(result.errors[0], /第二条消息.*no HTTP/);
});
test('images and URLs in code are not counted as news sources', () => {
  const result = validatePost(valid.replace('[原文](https://example.com/one)', '![图](https://example.com/image.png) `https://example.com`'));
  assert.ok(result.errors.some(error => /第一条消息/.test(error)));
});
test('checks leaf news headings even when an article mixes h2 and h3 entries', () => {
  const mixed = valid.replace('## 产品\n### 第一条消息\n内容。[原文](https://example.com/one)', '## 第一条消息\n无来源\n## 产品');
  assert.ok(validatePost(mixed).errors.some(error => /第一条消息.*no HTTP/.test(error)));
});
test('checks blockquote and plain publication bylines without treating research prose as a signature', () => {
  for (const byline of ['> / 作者，WrongName', '作者：WrongName', '*AI 热点日报 · 作者 WrongName*']) {
    assert.ok(validatePost(valid + '\n' + byline).errors.some(error => /byline/.test(error)));
  }
  assert.deepEqual(validatePost(valid + '\n> / 作者，ZestJT\n\n论文作者认为该方法需要更多验证。').errors, []);
});
test('accepts an explicit empty category but does not exempt a news claim next to it', () => {
  const empty = '\n## 模型\n\n*（6月1日数据无本分类条目）*\n';
  assert.deepEqual(validatePost(valid + empty).errors, []);
  assert.ok(validatePost(valid + empty + '\n另有一条没有来源的产品发布。').errors.length);
});
test('rejects duplicate slugs across separate articles', () => {
  const directory = mkdtempSync(join(tmpdir(), 'ai-news-content-test-'));
  try {
    writeFileSync(join(directory, 'one.md'), valid);
    writeFileSync(join(directory, 'two.md'), valid);
    assert.ok(validateContentDirectory(directory).errors.some(error => /duplicate slug/.test(error)));
  } finally { rmSync(directory, { recursive: true, force: true }); }
});
