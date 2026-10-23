import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { resolve, extname, sep } from 'node:path';

const root = resolve(process.argv[2] || '.validation-public');
const port = Number(process.argv[3] || 4173);
const headerText = await readFile(resolve(root, '_headers'), 'utf8');
const headers = Object.fromEntries(headerText.split(/\r?\n/).filter(line => /^\s+[^:]+:/.test(line))
  .map(line => { const split = line.indexOf(':'); return [line.slice(0, split).trim(), line.slice(split + 1).trim()]; }));
// This server binds only HTTP loopback. WebKit upgrades even loopback resource
// requests when this directive is present; TLS upgrades are checked on the HTTPS
// preview/production deployment. Keep every script/style/source restriction here.
for (const name of Object.keys(headers)) {
  if (name.toLowerCase() === 'content-security-policy') {
    headers[name] = headers[name].split(';').filter(directive => directive.trim() !== 'upgrade-insecure-requests').join(';');
  }
}
const types = { '.html': 'text/html; charset=utf-8', '.css': 'text/css', '.js': 'application/javascript', '.json': 'application/json', '.xml': 'application/xml', '.svg': 'image/svg+xml', '.png': 'image/png', '.webp': 'image/webp', '.jpg': 'image/jpeg', '.ico': 'image/x-icon', '.txt': 'text/plain' };
const server = createServer(async (request, response) => {
  try {
    const path = decodeURIComponent(new URL(request.url, 'http://localhost').pathname);
    let filename = resolve(root, '.' + path);
    if (filename !== root && !filename.startsWith(root + sep)) { response.writeHead(403); response.end(); return; }
    if ((await stat(filename)).isDirectory()) filename = resolve(filename, 'index.html');
    const body = await readFile(filename);
    response.writeHead(200, { ...headers, 'Content-Type': types[extname(filename)] || 'application/octet-stream', 'Cache-Control': 'no-store' });
    response.end(body);
  } catch {
    response.writeHead(404, { ...headers, 'Content-Type': 'text/html' });
    response.end('<h1>404</h1>');
  }
});
server.listen(port, '127.0.0.1', () => console.log(`Validation server: http://127.0.0.1:${port}`));
