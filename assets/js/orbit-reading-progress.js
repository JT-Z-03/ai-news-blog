const progress = document.querySelector('.orbit-article [role="progressbar"]');
const article = document.querySelector('.orbit-article__body');
if (progress && article) {
    const bar = progress.firstElementChild;
    const label = progress.lastElementChild;
    let framePending = false;
    const update = () => {
        framePending = false;
        const start = article.getBoundingClientRect().top + window.scrollY;
        const distance = Math.max(article.offsetHeight - window.innerHeight, 0);
        const percent = distance === 0 ? 100 : Math.min(100, Math.max(0, ((window.scrollY - start) / distance) * 100));
        const rounded = Math.round(percent);
        progress.hidden = distance === 0;
        progress.setAttribute('aria-valuenow', String(rounded));
        bar.style.transform = `scaleX(${percent / 100})`;
        label.textContent = `阅读进度 ${rounded}%`;
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