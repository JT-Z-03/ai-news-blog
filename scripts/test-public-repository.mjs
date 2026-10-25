import test from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { mkdtempSync, mkdirSync, writeFileSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { basename, dirname, join, resolve, sep } from 'node:path';
import { fileURLToPath } from 'node:url';
import { checkPublicRepository } from './check-public-repository.mjs';

const script = fileURLToPath(new URL('./check-public-repository.mjs', import.meta.url));
function git(root, ...args) {
  return execFileSync('git', args, { cwd: root, encoding: 'utf8', stdio: ['pipe', 'pipe', 'pipe'] }).trim();
}
function fixture(t) {
  const parent = resolve(tmpdir()) + sep;
  const root = mkdtempSync(join(parent, 'ai-news-public-boundary-'));
  t.after(() => {
    assert.ok(resolve(root).startsWith(parent));
    assert.match(basename(root), /^ai-news-public-boundary-/);
    rmSync(root, { recursive: true, force: true });
  });
  git(root, 'init', '--quiet');
  git(root, 'config', 'user.name', 'Fixture');
  git(root, 'config', 'user.email', 'fixture@example.invalid');
  git(root, 'config', 'core.autocrlf', 'false');
  git(root, 'config', 'core.hooksPath', join(root, 'disabled-hooks'));
  git(root, 'config', 'commit.gpgsign', 'false');
  return root;
}
function put(root, path, content = 'fixture\n', stage = true) {
  const file = join(root, path);
  mkdirSync(dirname(file), { recursive: true });
  writeFileSync(file, content);
  if (stage) git(root, 'add', '--', path);
}
function commit(root) {
  git(root, 'commit', '--quiet', '-m', 'fixture');
  return git(root, 'rev-parse', 'HEAD');
}
function reasons(root, args = []) {
  return checkPublicRepository(args, root).violations.map(item => item.reason);
}

test('accepts public site files, reviewed environment examples, and the theme gitlink', t => {
  const root = fixture(t);
  for (const path of ['README.md', '.github/workflows/test.yml', 'content/posts/中文 空格.md',
    'assets/images/chart.svg', 'layouts/partials/head.html', 'scripts/check.mjs', 'tests/site.spec.mjs',
    'data/topics.yaml', 'static/_headers', 'docs/theme-overrides.md', '.env.example', '.env.sample']) put(root, path);
  // A gitlink pins a commit; the object and the submodule working directory need not exist locally.
  git(root, 'update-index', '--add', '--cacheinfo', `160000,${'1'.repeat(40)},themes/hugo-PaperMod`);
  assert.deepEqual(reasons(root), []);
  assert.equal(checkPublicRepository([], root).checked, 13);
});

test('rejects internal paths, nested artifacts, environment variants, and credential files', t => {
  const root = fixture(t);
  for (const path of ['design-qa.md', 'docs/证据/record.json', '改动日志/记录.md', 'unexpected.txt',
    '.codex/hooks.json', 'content/.env.production.local', 'scripts/node_modules/pkg/index.js',
    'tests/coverage/result.json', 'assets/jsconfig.json', 'static/client.key', 'scripts/credentials.json']) put(root, path);
  const result = checkPublicRepository([], root);
  assert.equal(result.violations.length, 11);
  for (const reason of ['path-outside-public-scope', 'local-state-or-generated-file', 'environment-file', 'generated-file', 'credential-file']) {
    assert.ok(result.violations.some(item => item.reason === reason), reason);
  }
});

test('reads staged blob bytes instead of trusting an unstaged working copy', t => {
  const root = fixture(t);
  const token = ['gh', 'p_'].join('') + 'A'.repeat(36);
  put(root, 'README.md', 'safe\n');
  put(root, 'README.md', token, false);
  assert.deepEqual(reasons(root), []);
  git(root, 'add', '--', 'README.md');
  put(root, 'README.md', 'safe again\n', false);
  assert.deepEqual(reasons(root), ['github-token']);
  const output = spawnSync(process.execPath, [script], { cwd: root, encoding: 'utf8' });
  assert.equal(output.status, 1);
  assert.match(output.stderr, /README\.md.*github-token/);
  assert.ok(!`${output.stdout}${output.stderr}`.includes(token));
});

test('staged mode allows unrelated legacy files but checks additions and rename destinations', t => {
  const root = fixture(t);
  put(root, 'design-qa.md');
  put(root, 'content/post.md');
  commit(root);
  put(root, 'content/new.md');
  assert.deepEqual(reasons(root, ['--staged']), []);
  assert.deepEqual(reasons(root), ['path-outside-public-scope']);
  git(root, 'mv', '--', 'content/post.md', 'private-notes.md');
  assert.deepEqual(checkPublicRepository(['--staged'], root).violations.map(item => item.path), ['private-notes.md']);
  git(root, 'rm', '--cached', '--', 'private-notes.md', 'design-qa.md');
  assert.deepEqual(reasons(root, ['--staged']), []);
});

test('ref mode checks the requested commit tree independently of index and later history', t => {
  const root = fixture(t);
  put(root, 'design-qa.md');
  put(root, 'README.md');
  const old = commit(root);
  git(root, 'rm', '--', 'design-qa.md');
  const clean = commit(root);
  put(root, 'docs/任务/local.md');
  assert.deepEqual(reasons(root, ['--ref', clean]), []);
  assert.deepEqual(reasons(root, ['--ref', old]), ['path-outside-public-scope']);
  assert.deepEqual(reasons(root), ['path-outside-public-scope']);
});

test('staged mode rejects file type changes and unresolved index conflicts', t => {
  const root = fixture(t);
  put(root, 'content/link.md');
  put(root, 'content/conflict.md');
  commit(root);
  const blob = git(root, 'rev-parse', ':content/link.md');
  git(root, 'update-index', '--cacheinfo', `120000,${blob},content/link.md`);
  const path = 'content/conflict.md';
  const records = [`0 ${'0'.repeat(40)}\t${path}`,
    ...[1, 2, 3].map(stage => `100644 ${blob} ${stage}\t${path}`)].join('\n') + '\n';
  execFileSync('git', ['update-index', '--index-info'], {
    cwd: root, input: records, stdio: ['pipe', 'pipe', 'pipe']
  });
  const violations = checkPublicRepository(['--staged'], root).violations;
  assert.ok(violations.some(item => item.path === 'content/link.md' && item.reason === 'unsupported-file-mode'));
  assert.equal(violations.filter(item => item.path === path && item.reason === 'unmerged-index-entry').length, 3);
});

test('rejects symlinks and unapproved submodules without following their contents', t => {
  const root = fixture(t);
  put(root, 'README.md');
  const blob = git(root, 'rev-parse', ':README.md');
  git(root, 'update-index', '--add', '--cacheinfo', `120000,${blob},content/link.md`);
  git(root, 'update-index', '--add', '--cacheinfo', `160000,${'1'.repeat(40)},assets/dependency`);
  put(root, 'themes/hugo-PaperMod', 'not a gitlink\n');
  assert.deepEqual(reasons(root).sort(), ['theme-must-be-a-gitlink', 'unsupported-file-mode', 'unsupported-file-mode'].sort());
});

test('detects synthetic high-confidence credentials without storing credential examples in source', t => {
  const root = fixture(t);
  put(root, 'content/token.md', ['github', '_pat_'].join('') + 'B'.repeat(80));
  put(root, 'content/service.md', ['sk', '-proj-'].join('') + 'C'.repeat(80));
  put(root, 'static/private.txt', ['-----BEGIN', 'PRIVATE KEY-----'].join(' '));
  assert.deepEqual(reasons(root).sort(), ['github-token', 'openai-project-token', 'private-key'].sort());
});

test('rejects invalid modes and unresolved refs without echoing ref arguments', t => {
  const root = fixture(t);
  for (const args of [['--unknown'], ['--ref'], ['--staged', '--ref', 'HEAD'], ['--ref', '--help']]) {
    assert.throws(() => checkPublicRepository(args, root), /Usage/);
  }
  const marker = 'unresolved-private-reference';
  const output = spawnSync(process.execPath, [script, '--ref', marker], { cwd: root, encoding: 'utf8' });
  assert.equal(output.status, 1);
  assert.ok(!output.stderr.includes(marker));
});
