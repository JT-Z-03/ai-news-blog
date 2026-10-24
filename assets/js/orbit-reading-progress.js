const progress = document.querySelector('.orbit-article [role="progressbar"]');
const article = document.querySelector('.orbit-article__body');
if (progress && article) {
    const bar = progress.firstElementChild;
    const label = progress.lastElementChild;
    let framePending = false;
    let lastHidden = progress.hidden;
    let lastValue = progress.getAttribute('aria-valuenow');
    let lastTransform = bar.style.transform;
    let lastLabel = label.textContent;
    const update = () => {
        framePending = false;
        const start = article.getBoundingClientRect().top + window.scrollY;
        const distance = Math.max(article.offsetHeight - window.innerHeight, 0);
        const percent = distance === 0 ? 100 : Math.min(100, Math.max(0, ((window.scrollY - start) / distance) * 100));
        const rounded = Math.round(percent);
        const hidden = distance === 0;
        const value = String(rounded);
        const transform = `scaleX(${percent / 100})`;
        const text = `阅读进度 ${rounded}%`;
        if (hidden !== lastHidden) progress.hidden = lastHidden = hidden;
        if (value !== lastValue) progress.setAttribute('aria-valuenow', lastValue = value);
        if (transform !== lastTransform) bar.style.transform = lastTransform = transform;
        if (text !== lastLabel) label.textContent = lastLabel = text;
    };
    const schedule = () => {
        if (!framePending) {
            framePending = true;
            window.requestAnimationFrame(update);
        }
    };
    update();
    document.addEventListener('scroll', schedule, { passive: true });
    window.addEventListener('resize', schedule);
    window.addEventListener('load', schedule);
    if ('ResizeObserver' in window) new ResizeObserver(schedule).observe(article);
}
