import test from 'node:test';
import assert from 'node:assert/strict';
import { assertHugoVersion, assertCloudflareVersion, buildSite } from './build-site.mjs';

test('accepts the pinned Extended release on Windows and Linux', () => {
  for (const platform of ['windows/amd64', 'linux/amd64']) {
    assert.doesNotThrow(() => assertHugoVersion(`hugo v0.162.0-076dfe13+extended ${platform}`, '0.162.0'));
  }
});

test('rejects the production drift and a standard build', () => {
  for (const version of ['hugo v0.147.7+extended linux/amd64', 'hugo v0.162.0 linux/amd64', 'v0.162.0', 'hugo v0.162.01+extended linux/amd64', 'hugo v0.162.0-rc.1+extended linux/amd64', 'hugo v0.162.0+extendedfoo linux/amd64']) {
    assert.throws(() => assertHugoVersion(version, '0.162.0'), /required/);
  }
});

test('rejects malformed pins and unknown build flags before running Hugo', () => {
  assert.throws(() => assertHugoVersion('hugo v0.162.0+extended', 'latest'), /Invalid version/);
  assert.throws(() => buildSite(['--unexpected']), /Usage/);
});

test('requires the pin in both effective Wrangler environments', () => {
  assert.doesNotThrow(() => assertCloudflareVersion({ vars: { HUGO_VERSION: '0.162.0' } }, '0.162.0'));
  for (const config of [
    {},
    { vars: { HUGO_VERSION: '0.147.7' } },
    { vars: { HUGO_VERSION: '0.162.0' }, env: { preview: { vars: {} } } },
    { vars: { HUGO_VERSION: '0.162.0' }, env: { production: { vars: { HUGO_VERSION: '0.147.7' } } } }
  ]) assert.throws(() => assertCloudflareVersion(config, '0.162.0'), /must match/);
});
