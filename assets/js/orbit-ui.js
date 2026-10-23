import * as params from '@params';

const savePreference = (key, value) => {
    try { localStorage.setItem(key, String(value)); } catch { /* Storage is optional. */ }
};

const menu = document.getElementById('menu');
if (menu) {
    try { menu.scrollLeft = Number(localStorage.getItem('menu-scroll-position')) || 0; } catch { /* Storage is optional. */ }
    menu.addEventListener('scroll', () => savePreference('menu-scroll-position', menu.scrollLeft), { passive: true });
}

document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener('click', (event) => {
        if (event.defaultPrevented || event.button !== 0 || event.ctrlKey || event.metaKey || event.shiftKey || event.altKey) return;
        let id;
        try { id = decodeURIComponent(anchor.getAttribute('href').slice(1)); } catch { return; }
        const target = document.getElementById(id);
        if (!target) return;
        event.preventDefault();
        const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        target.scrollIntoView({ behavior: reduceMotion ? 'auto' : 'smooth' });
        if (!target.hasAttribute('tabindex')) target.setAttribute('tabindex', '-1');
        target.focus({ preventScroll: true });
        const url = new URL(window.location.href);
        url.hash = id === 'top' ? '' : id;
        if (id === 'top') history.replaceState(null, '', url);
        else history.pushState(null, '', url);
    });
});

const topLink = document.getElementById('top-link');
if (topLink) {
    const updateTopLink = () => topLink.classList.toggle('hidden', window.scrollY <= window.innerHeight);
    document.addEventListener('scroll', updateTopLink, { passive: true });
    window.addEventListener('resize', updateTopLink);
    updateTopLink();
}

document.getElementById('theme-toggle')?.addEventListener('click', () => {
    const root = document.documentElement;
    root.dataset.theme = root.dataset.theme === 'dark' ? 'light' : 'dark';
    savePreference('pref-theme', root.dataset.theme);
});

if (params.enableCodeCopy) {
    document.querySelectorAll('pre > code').forEach((code) => {
        // Chroma's table layout has a separate code node containing line numbers.
        if (code.closest('table.lntable') && code.closest('td')?.cellIndex === 0) return;
        const button = document.createElement('button');
        button.className = 'copy-code';
        button.type = 'button';
        button.textContent = params.copyLabel;
        button.addEventListener('click', async () => {
            let copied = false;
            try {
                if (navigator.clipboard?.writeText) {
                    await navigator.clipboard.writeText(code.textContent);
                    copied = true;
                } else {
                    const range = document.createRange();
                    range.selectNodeContents(code);
                    const selection = window.getSelection();
                    selection.removeAllRanges();
                    selection.addRange(range);
                    try { copied = document.execCommand('copy'); }
                    finally { selection.removeAllRanges(); }
                }
            } catch { /* Report denied clipboard access without claiming success. */ }
            button.textContent = copied ? params.copiedLabel : '复制失败，请手动选择文本';
            window.setTimeout(() => { button.textContent = params.copyLabel; }, 2000);
        });
        (code.closest('.highlight') || code.parentElement).appendChild(button);
    });
}
