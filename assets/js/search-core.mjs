export const RESULT_LIMIT = 30;
export const QUERY_LIMIT = 64;
export const INDEX_BUDGET_BYTES = 2 * 1024 * 1024;
export const CATEGORIES = { all: '', daily: '日报', analysis: '深度分析' };

export const normalizeQuery = (value = '') => String(value).slice(0, QUERY_LIMIT).trim();
export const normalizeType = (value) => Object.hasOwn(CATEGORIES, value) ? value : 'all';
export const isComposing = (event, composing = false) => composing || event.isComposing || event.keyCode === 229;

export function readSearchState(url) {
    const params = new URL(url).searchParams;
    return { query: normalizeQuery(params.get('q') || ''), type: normalizeType(params.get('type')) };
}

export function searchStateUrl(url, { query, type }) {
    const result = new URL(url);
    query = normalizeQuery(query);
    type = normalizeType(type);
    if (query) result.searchParams.set('q', query);
    else result.searchParams.delete('q');
    if (type !== 'all') result.searchParams.set('type', type);
    else result.searchParams.delete('type');
    return result;
}

export function safeResultUrl(value, baseUrl, siteBaseUrl = baseUrl) {
    try {
        const base = new URL(baseUrl);
        const url = new URL(value, base);
        const site = new URL(siteBaseUrl);
        return ['http:', 'https:'].includes(url.protocol) && [base.origin, site.origin].includes(url.origin)
            ? `${url.pathname}${url.search}${url.hash}` : null;
    } catch { return null; }
}

export function createSearchIndex(data, Fuse, baseUrl, options = {}, siteBaseUrl = baseUrl) {
    if (!Array.isArray(data)) throw new Error('Search index must be an array');
    const entries = data.filter((item) => item && typeof item.title === 'string' &&
        typeof item.content === 'string' && typeof item.permalink === 'string')
        .map((item) => ({ ...item, permalink: safeResultUrl(item.permalink, baseUrl, siteBaseUrl) }))
        .filter((item) => item.permalink)
        .map((item) => ({ item, title: item.title.toLocaleLowerCase(), content: item.content.toLocaleLowerCase() }));
    const indexes = new Map();
    const settings = {
        threshold: options?.threshold ?? 0.4,
        ignoreLocation: true,
        includeMatches: true,
        keys: ['title']
    };
    return {
        search(query, type = 'all') {
            query = normalizeQuery(query);
            type = normalizeType(type);
            if (!query) return { results: [], more: false };
            const subset = type === 'all' ? entries : entries.filter(({ item }) => item.category === CATEGORIES[type]);
            const terms = query.toLocaleLowerCase().split(/\s+/);
            const literal = subset.filter((entry) => terms.every((term) => entry.title.includes(term) || entry.content.includes(term)))
                .map((entry) => ({ item: entry.item, score: terms.filter((term) => !entry.title.includes(term)).length }));
            if (literal.length) {
                literal.sort((a, b) => a.score - b.score || String(b.item.date || '').localeCompare(String(a.item.date || '')));
                return { results: literal.slice(0, RESULT_LIMIT), more: literal.length > RESULT_LIMIT };
            }
            // Preserve title typo tolerance without fuzzy-scanning every full article on each keystroke.
            if (!indexes.has(type)) indexes.set(type, new Fuse(subset.map(({ item }) => item), settings));
            const found = indexes.get(type).search(query, { limit: RESULT_LIMIT + 1 });
            return { results: found.slice(0, RESULT_LIMIT), more: found.length > RESULT_LIMIT };
        }
    };
}

export function resultSnippet(content, query, matches = []) {
    const text = String(content).replace(/\s+/g, ' ').trim();
    query = normalizeQuery(query);
    const lower = text.toLocaleLowerCase();
    const matchedTerm = [query, ...query.split(/\s+/)].find((term) => term && lower.includes(term.toLocaleLowerCase()));
    const hit = matchedTerm ? lower.indexOf(matchedTerm.toLocaleLowerCase()) : -1;
    const fuzzyPosition = matches.find((match) => match.key === 'content')?.indices?.[0]?.[0] ?? 0;
    const position = hit >= 0 ? hit : fuzzyPosition;
    const start = Math.max(0, position - 45);
    const end = Math.min(text.length, start + 150);
    const parts = [];
    if (start > 0) parts.push({ text: '…' });
    if (hit >= 0) {
        parts.push({ text: text.slice(start, hit) }, { text: text.slice(hit, hit + matchedTerm.length), marked: true },
            { text: text.slice(hit + matchedTerm.length, end) });
    } else parts.push({ text: text.slice(start, end) });
    if (end < text.length) parts.push({ text: '…' });
    return parts;
}
