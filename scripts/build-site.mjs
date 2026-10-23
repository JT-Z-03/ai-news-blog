import { existsSync, readFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath, pathToFileURL } from 'node:url';

const projectRoot = resolve(dirname(fileURLToPath(import.meta.url)), '..');

export function assertHugoVersion(output, expected) {
  if (!/^\d+\.\d+\.\d+$/.test(expected)) {
    throw new Error('Invalid version in .hugo-version; expected major.minor.patch.');
  }
  const match = output.match(/^hugo v([^\s+]+)((?:\+[^\s+]+)*)\s/m);
  const release = match?.[1].replace(/-[0-9a-f]{7,40}$/, '');
  if (!match || release !== expected || !match[2].split('+').includes('extended')) {
    throw new Error(`Hugo Extended ${expected} required; found: ${output.trim()}`);
  }
}

export function buildSite(args = process.argv.slice(2)) {
  if (args.length && (args.length !== 2 || args[0] !== '--destination' || !args[1])) {
    throw new Error('Usage: node scripts/build-site.mjs [--destination PATH]');
  }
  const expected = readFileSync(resolve(projectRoot, '.hugo-version'), 'utf8').trim();
  const localBinary = resolve(projectRoot, process.platform === 'win32' ? 'hugo.exe' : 'hugo');
  const binary = process.env.HUGO_BINARY || (existsSync(localBinary) ? localBinary : 'hugo');
  const version = spawnSync(binary, ['version'], { cwd: projectRoot, encoding: 'utf8' });
  if (version.error) throw version.error;
  if (version.status !== 0) throw new Error(`Hugo version check failed (${version.status}).`);
  assertHugoVersion(version.stdout, expected);
  console.log(`Build toolchain verified: Hugo Extended ${expected}`);
  const command = ['--gc', '--minify', '--printPathWarnings', '--environment', 'production'];
  if (args.length) {
    // Caller-owned destinations are not cleaned. Validation supplies a fresh temporary path.
    command.push('--destination', resolve(projectRoot, args[1]));
  } else {
    // Preserve the existing deployment workflow: remove routes deleted from the source.
    command.push('--destination', resolve(projectRoot, 'public'), '--cleanDestinationDir');
  }
  const result = spawnSync(binary, command, { cwd: projectRoot, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) throw new Error(`Hugo build failed (${result.status ?? result.signal}).`);
}

if (process.argv[1] && import.meta.url === pathToFileURL(resolve(process.argv[1])).href) {
  try {
    buildSite();
  } catch (error) {
    console.error(error.message);
    process.exitCode = 1;
  }
}
