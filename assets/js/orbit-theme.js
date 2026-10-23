import * as params from '@params';

// Apply the saved theme before first paint without inline script execution.
let theme = params.defaultTheme;
if (!params.disableThemeToggle) {
    try {
        const saved = localStorage.getItem('pref-theme');
        if (saved === 'light' || saved === 'dark') theme = saved;
    } catch { /* Storage policies must not prevent rendering. */ }
}
if (theme !== 'light' && theme !== 'dark') {
    theme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}
document.documentElement.dataset.theme = theme;