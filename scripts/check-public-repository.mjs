import { execFileSync } from 'node:child_process';
import { resolve } from 'node:path';
import { pathToFileURL } from 'node:url';

// Keep this list explicit: adding a public root or maintenance document requires review.
const rootFiles = new Set([
  '.gitignore', '.gitmodules', '.hugo-version', '.npmrc', '.env.example', '.env.sample',
  'AGENTS.md', 'LICENSE', 'README.md', 'SECURITY.md', 'hugo.toml',
  'package.json', 'package-lock.json', 'playwright.config.mjs', 'wrangler.jsonc'
]);
const publicDirectories = new Set(['.github', 'assets', 'content', 'data', 'layouts', 'scripts', 'static', 'tests']);
const forbiddenSegments = new Set([
  '.git', '.wrangler', '.runtime', '.project-records', '.codex', '.worktrees',
  'node_modules', '__pycache__', 'test-results', 'playwright-report', '.validation-public',
  '.vscode', '.idea', 'coverage'
]);
const secretPatterns = [
  ['private-key', /-----BEGIN (?:(?:RSA |EC |DSA |OPENSSH |ENCRYPTED )?PRIVATE KEY|PGP PRIVATE KEY BLOCK)-----/],
  ['github-token', /\bgh[pousr]_[A-Za-z0-9]{36,}\b|\bgithub_pat_[A-Za-z0-9_]{70,}\b/],
  ['openai-project-token', /\bsk-(?:proj|svcacct)-[A-Za-z0-9_-]{60,}\b/]
];
const usage = 'Usage: node scripts/check-public-repository.mjs [--staged | --ref <commit>]';

function git(cwd, args, input) {
  try {
    return execFileSync('git', args, {
      cwd, input, stdio: ['pipe', 'pipe', 'pipe'], maxBuffer: 64 * 1024 * 1024,
      env: { ...process.env, GIT_NO_REPLACE_OBJECTS: '1', GIT_OPTIONAL_LOCKS: '0', GIT_NO_LAZY_FETCH: '1' }
    });
  } catch {
    // Git diagnostics may include user-controlled data. Do not echo command output.
    throw new Error('Unable to read the requested Git index or commit.');
  }
}

function parseOptions(args) {
  if (args.length === 0) return { mode: 'index' };
  if (args.length === 1 && args[0] === '--staged') return { mode: 'staged' };
  if (args.length === 2 && args[0] === '--ref' && args[1] && !args[1].startsWith('-')) {
    return { mode: 'ref', ref: args[1] };
  }
  throw new Error(usage);
}

function entriesFor(cwd, options) {
  if (options.mode === 'ref') {
    const commit = git(cwd, ['rev-parse', '--verify', '--end-of-options', `${options.ref}^{commit}`]).toString('utf8').trim();
    return git(cwd, ['ls-tree', '-r', '-z', commit]).toString('utf8').split('\0').filter(Boolean).map(record => {
      const tab = record.indexOf('\t');
      const [mode, type, oid] = record.slice(0, tab).split(' ');
      return { path: record.slice(tab + 1), mode, type, oid, stage: '0' };
    });
  }
  const selected = options.mode === 'staged'
    ? new Set(git(cwd, ['diff', '--cached', '--no-ext-diff', '--name-only', '--diff-filter=ACMRTU', '-z']).toString('utf8').split('\0').filter(Boolean))
    : null;
  return git(cwd, ['ls-files', '--stage', '-z']).toString('utf8').split('\0').filter(Boolean).map(record => {
    const tab = record.indexOf('\t');
    const [mode, oid, stage] = record.slice(0, tab).split(' ');
    return { path: record.slice(tab + 1), mode, oid, stage };
  }).filter(entry => !selected || selected.has(entry.path));
}

function pathProblem(entry) {
  const { path, mode, stage } = entry;
  if (stage !== '0') return 'unmerged-index-entry';
  if (path === 'themes/hugo-PaperMod') return mode === '160000' ? null : 'theme-must-be-a-gitlink';
  if (!['100644', '100755'].includes(mode)) return 'unsupported-file-mode';
  const segments = path.split('/');
  const name = segments.at(-1);
  const lowerName = name.toLowerCase();
  if (segments.some(segment => forbiddenSegments.has(segment.toLowerCase()))) return 'local-state-or-generated-file';
  if (/^\.env(?:\.|$)/i.test(name) && !['.env.example', '.env.sample'].includes(name)) return 'environment-file';
  if (/\.(?:pem|key|p12|pfx|jks|keystore)$/i.test(name) ||
      /^(?:id_(?:rsa|dsa|ecdsa|ed25519)|credentials(?:\.[^.]+)?|secrets(?:\.[^.]+)?|service-account[^/]*\.json)$/i.test(name)) {
    return 'credential-file';
  }
  if (/\.(?:log|pyc|pyo|swp|swo)$/i.test(name) || ['.ds_store', 'thumbs.db', '.hugo_build.lock'].includes(lowerName) ||
      path === 'assets/jsconfig.json') return 'generated-file';
  if (rootFiles.has(path) || path === 'docs/theme-overrides.md') return null;
  if (segments.length > 1 && publicDirectories.has(segments[0])) return null;
  return 'path-outside-public-scope';
}

function scanBlobs(cwd, entries) {
  const byOid = new Map();
  for (const entry of entries) {
    if (!byOid.has(entry.oid)) byOid.set(entry.oid, []);
    byOid.get(entry.oid).push(entry.path);
  }
  if (!byOid.size) return [];
  const data = git(cwd, ['cat-file', '--batch'], `${[...byOid.keys()].join('\n')}\n`);
  const violations = [];
  let offset = 0;
  for (const [oid, paths] of byOid) {
    const end = data.indexOf(10, offset);
    const header = data.subarray(offset, end).toString('ascii');
    const match = header.match(/^([a-f0-9]+) blob (\d+)$/);
    if (end < 0 || !match || match[1] !== oid) throw new Error('Unable to read a checked Git blob.');
    const size = Number(match[2]);
    const start = end + 1;
    if (!Number.isSafeInteger(size) || start + size >= data.length || data[start + size] !== 10) {
      throw new Error('Incomplete Git blob response.');
    }
    const content = data.subarray(start, start + size).toString('utf8');
    for (const [reason, pattern] of secretPatterns) {
      if (pattern.test(content)) for (const path of paths) violations.push({ path, reason });
    }
    offset = start + size + 1;
  }
  return violations;
}

export function checkPublicRepository(args = [], cwd = process.cwd()) {
  const options = parseOptions(args);
  const root = git(cwd, ['rev-parse', '--show-toplevel']).toString('utf8').trim();
  const entries = entriesFor(root, options);
  const violations = [];
  const blobs = [];
  for (const entry of entries) {
    const reason = pathProblem(entry);
    if (reason) violations.push({ path: entry.path, reason });
    else if (entry.mode !== '160000') blobs.push(entry);
  }
  violations.push(...scanBlobs(root, blobs));
  return { mode: options.mode, checked: entries.length, violations };
}

if (process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href) {
  try {
    const result = checkPublicRepository(process.argv.slice(2));
    for (const { path, reason } of result.violations) {
      // JSON quoting also prevents control characters in filenames from changing terminal output.
      console.error(`Public repository check: ${JSON.stringify(path)} [${reason}]`);
    }
    if (result.violations.length) process.exitCode = 1;
    else console.log(`Public repository check passed (${result.mode}; ${result.checked} entries).`);
  } catch (error) {
    console.error(error.message === usage ? usage : 'Public repository check failed: unable to inspect the requested Git state.');
    process.exitCode = 1;
  }
}
