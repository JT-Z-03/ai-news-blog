import { readFileSync, writeFileSync } from 'node:fs';
import { runInNewContext } from 'node:vm';
import { performance } from 'node:perf_hooks';
import { gzipSync } from 'node:zlib';
import { cpus, platform } from 'node:os';
import { createSearchIndex, INDEX_BUDGET_BYTES } from '../assets/js/search-core.mjs';

const Fuse = runInNewContext(readFileSync(new URL('../themes/hugo-PaperMod/assets/js/fuse.basic.min.js', import.meta.url), 'utf8') + '\nFuse;');
const [indexPath, outputPath] = process.argv.slice(2);
if (!indexPath) throw new Error('Usage: node scripts/benchmark-search.mjs PATH_TO_INDEX_JSON [REPORT_JSON]');
const raw = readFileSync(indexPath);
const corpus = JSON.parse(raw);
if (!Array.isArray(corpus) || !corpus.length) throw new Error('The benchmark requires a non-empty built search index.');
const queries = ['OpenAI', '智能体', 'DeepSeek', '模型', 'zzznomatchtoken123'];
const measurements = [];
for (const count of [corpus.length, 500, 1000]) {
    const data = Array.from({ length: count }, (_, i) => ({ ...corpus[i % corpus.length], permalink: `/posts/benchmark-${i}/` }));
    const encoded = Buffer.from(JSON.stringify(data));
    const started = performance.now();
    const index = createSearchIndex(data, Fuse, 'https://benchmark.invalid/search/');
    index.search(queries[0]);
    const coldMs = performance.now() - started;
    const samples = [];
    for (let repeat = 0; repeat < 5; repeat++) {
        for (const query of queries) {
            const before = performance.now();
            index.search(query);
            samples.push(performance.now() - before);
        }
    }
    samples.sort((a, b) => a - b);
    measurements.push({ articles: count, rawBytes: encoded.length, gzipBytes: gzipSync(encoded).length,
        withinProductionBudget: encoded.length <= INDEX_BUDGET_BYTES,
        coldIndexAndFirstSearchMs: +coldMs.toFixed(2), queryMedianMs: +samples[Math.floor(samples.length / 2)].toFixed(2),
        queryP95Ms: +samples[Math.ceil(samples.length * 0.95) - 1].toFixed(2), samples: samples.length });
}
const report = { measuredAt: new Date().toISOString(), runtime: process.version, platform: platform(), cpu: cpus()[0]?.model,
    method: 'Full current article bodies repeated with unique URLs for 500/1000-entry simulations. Desktop Node CPU only; excludes network, DOM, rendering and mobile throttling.',
    sourceArticles: corpus.length, sourceRawBytes: raw.length, sourceGzipBytes: gzipSync(raw).length, productionBudgetBytes: INDEX_BUDGET_BYTES, queries, measurements };
if (outputPath) writeFileSync(outputPath, JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify(report, null, 2));
