import * as params from '@params';
import { createSearchIndex, isComposing, normalizeQuery, readSearchState, resultSnippet, searchStateUrl, RESULT_LIMIT } from './search-core.mjs';

function initSearch() {
    const resList = document.getElementById('searchResults');
    const sInput = document.getElementById('searchInput');
    const searchBox = document.getElementById('searchbox');
    const status = document.getElementById('searchStatus');
    const typeSelect = document.getElementById('searchType');
    const retry = document.getElementById('searchRetry');
    if (!resList || !sInput || !searchBox || !status || !typeSelect || !retry) return;

    let index;
    let composing = false;
    let timeout;
    const messages = {
        initial: '输入关键词开始搜索。',
        loading: '正在加载搜索索引…',
        empty: '没有找到匹配结果。',
        failure: '搜索暂时不可用，请稍后重试。'
    };
    const setStatus = (state, count = 0, more = false) => {
        status.dataset.state = state;
        status.textContent = state === 'results'
            ? `${count} 条搜索结果。${more ? `仅显示前 ${RESULT_LIMIT} 条，可增加关键词或筛选文章类型。` : ''}`
            : messages[state];
    };
    const restoreState = () => {
        const state = readSearchState(window.location.href);
        sInput.value = state.query;
        typeSelect.value = state.type;
    };
    const renderResults = ({ results, more }, query) => {
        const fragment = document.createDocumentFragment();
        for (const result of results) {
            const { item } = result;
            const li = document.createElement('li');
            const heading = document.createElement('h2');
            heading.className = 'orbit-search__title';
            const link = document.createElement('a');
            link.className = 'entry-link';
            link.href = item.permalink;
            link.textContent = item.title;
            heading.append(link);
            const metadata = document.createElement('p');
            metadata.className = 'orbit-search__meta';
            if (/^\d{4}-\d{2}-\d{2}$/.test(item.date || '')) {
                const date = document.createElement('time');
                date.dateTime = item.date;
                date.textContent = item.date;
                metadata.append(date, document.createTextNode(' · '));
            }
            metadata.append(document.createTextNode(item.category || '页面'));
            const snippet = document.createElement('p');
            snippet.className = 'entry-content orbit-search__snippet';
            for (const part of resultSnippet(item.content, query, result.matches)) {
                if (part.marked) {
                    const mark = document.createElement('mark');
                    mark.textContent = part.text;
                    snippet.append(mark);
                } else snippet.append(document.createTextNode(part.text));
            }
            li.append(heading, metadata, snippet);
            fragment.append(li);
        }
        resList.replaceChildren(fragment);
        setStatus(results.length ? 'results' : (query ? 'empty' : 'initial'), results.length, more);
    };
    const performSearch = () => {
        if (!index || composing) return;
        const query = normalizeQuery(sInput.value);
        const url = searchStateUrl(window.location.href, { query, type: typeSelect.value });
        window.history.replaceState(window.history.state, '', url);
        renderResults(index.search(query, typeSelect.value), query);
    };
    const scheduleSearch = () => {
        clearTimeout(timeout);
        timeout = window.setTimeout(performSearch, 150);
    };
    const loadIndex = async () => {
        setStatus('loading');
        retry.hidden = true;
        sInput.disabled = typeSelect.disabled = true;
        try {
            const response = await fetch(searchBox.dataset.indexUrl || '../index.json');
            if (!response.ok) throw new Error(`Search index load failed: ${response.status}`);
            index = createSearchIndex(await response.json(), Fuse, window.location.href, params.fuseOpts, params.siteBaseURL || window.location.href);
            sInput.disabled = typeSelect.disabled = false;
            performSearch();
        } catch (error) {
            setStatus('failure');
            retry.hidden = false;
            console.error(error);
        }
    };
    restoreState();
    sInput.addEventListener('compositionstart', () => { composing = true; clearTimeout(timeout); });
    sInput.addEventListener('compositionend', () => { composing = false; scheduleSearch(); });
    sInput.addEventListener('input', (event) => {
        if (isComposing(event, composing)) { clearTimeout(timeout); return; }
        scheduleSearch();
    });
    sInput.addEventListener('search', () => { if (!composing) { clearTimeout(timeout); performSearch(); } });
    typeSelect.addEventListener('change', () => { clearTimeout(timeout); performSearch(); });
    retry.addEventListener('click', loadIndex);
    window.addEventListener('popstate', () => { clearTimeout(timeout); restoreState(); performSearch(); });
    document.addEventListener('keydown', (event) => {
        const active = document.activeElement;
        if (!searchBox.contains(active) || isComposing(event, composing)) return;
        if (event.key === 'Escape') {
            event.preventDefault();
            clearTimeout(timeout);
            sInput.value = '';
            performSearch();
            sInput.focus();
            return;
        }
        const links = [...resList.querySelectorAll('.entry-link')];
        const position = links.indexOf(active);
        if (!links.length || (active !== sInput && position < 0)) return;
        if (event.key === 'ArrowDown') {
            event.preventDefault();
            links[Math.min(position + 1, links.length - 1)].focus();
        } else if (event.key === 'ArrowUp' && position >= 0) {
            event.preventDefault();
            (position === 0 ? sInput : links[position - 1]).focus();
        }
    });
    loadIndex();
}

if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initSearch, { once: true });
else initSearch();
