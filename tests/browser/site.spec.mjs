import { test, expect } from '@playwright/test';

const articlePath = '/posts/deepseek-v4-agent-platform/';
async function expectNoOverflow(page) {
  const dimensions = await page.evaluate(() => ({ page: document.documentElement.scrollWidth, viewport: document.documentElement.clientWidth }));
  expect(dimensions.page).toBeLessThanOrEqual(dimensions.viewport + 1);
}

for (const width of [320, 390, 768, 1024, 1440]) {
  test(`reading and navigation fit ${width}px`, async ({ page }, testInfo) => {
    await page.setViewportSize({ width, height: 900 });
    for (const path of ['/', '/search/', articlePath]) {
      await page.goto(path);
      await expect(page.locator('h1')).toBeVisible();
      await expectNoOverflow(page);
      await expect(page.getByRole('button', { name: /主题/ })).toBeVisible();
      await expect(page.locator(`nav [aria-current="${path === articlePath ? 'location' : 'page'}"]`)).toHaveCount(1);
      if (path === articlePath) {
        await expect(page.locator('nav [aria-current="location"]')).toHaveAttribute('href', /categories\//);
        const images = page.locator('.post-content img');
        expect(await images.count()).toBeGreaterThan(0);
        for (const image of await images.all()) {
          expect(Number(await image.getAttribute('width'))).toBeGreaterThan(0);
          expect(Number(await image.getAttribute('height'))).toBeGreaterThan(0);
        }
        await page.locator('.orbit-toc summary').click();
        const target = page.locator('.orbit-toc a').first();
        await target.click();
        await expect.poll(() => page.evaluate(() => document.activeElement?.tagName)).toMatch(/^H[2-4]$/);
      }
    }
    await page.goto('/');
    await page.screenshot({ path: testInfo.outputPath(`home-${width}.png`), fullPage: true });
  });
}

test('keyboard skip, dark theme, responsive images and 200% text scaling', async ({ page }, testInfo) => {
  await page.setViewportSize({ width: 390, height: 844 });
  await page.goto('/');
  await page.keyboard.press('Tab');
  await expect(page.getByRole('link', { name: '跳到正文' })).toBeFocused();
  await page.keyboard.press('Enter');
  await expect(page.locator('#main-content')).toBeFocused();
  const images = page.locator('.orbit-home img');
  expect(await images.count()).toBe(3);
  for (const img of await images.all()) expect(await img.getAttribute('srcset')).toContain('400w');
  await expect.poll(() => images.first().evaluate(img => img.complete && img.naturalWidth > 0)).toBeTruthy();
  expect(await images.first().evaluate(img => img.naturalWidth)).toBeLessThan(1600);
  const toggle = page.getByRole('button', { name: /主题/ });
  const previous = await page.locator('html').getAttribute('data-theme');
  await toggle.click();
  await expect(page.locator('html')).not.toHaveAttribute('data-theme', previous);
  await page.reload();
  await expect(page.locator('html')).not.toHaveAttribute('data-theme', previous);
  await page.emulateMedia({ colorScheme: 'dark', reducedMotion: 'reduce' });
  await page.evaluate(async () => {
    document.documentElement.style.fontSize = '200%';
    await new Promise(resolve => requestAnimationFrame(() => requestAnimationFrame(resolve)));
  });
  await expectNoOverflow(page);
  await page.screenshot({ path: testInfo.outputPath('dark-text-200-percent.png'), fullPage: true });
});

test('search supports query restoration, metadata, filters and composition-safe keys', async ({ page }) => {
  await page.goto('/search/?q=Claude&type=daily');
  const input = page.locator('#searchInput');
  await expect(input).toBeEnabled();
  await expect(input).toHaveValue('Claude');
  await expect(page.locator('#searchType')).toHaveValue('daily');
  await expect(page.locator('#searchResults li').first()).toBeVisible();
  expect(await page.locator('#searchResults li').count()).toBeLessThanOrEqual(30);
  await expect(page.locator('#searchResults time').first()).toBeVisible();
  await input.focus();
  await input.dispatchEvent('compositionstart');
  const prevented = await input.evaluate(element => !element.dispatchEvent(new KeyboardEvent('keydown', { key: 'ArrowDown', isComposing: true, bubbles: true, cancelable: true })));
  expect(prevented).toBeFalsy();
  await expect(input).toBeFocused();
  await input.dispatchEvent('compositionend');
  await page.getByRole('button', { name: /主题/ }).focus();
  await page.keyboard.press('Escape');
  await expect(input).toHaveValue('Claude');
  await page.locator('#searchType').selectOption('analysis');
  await expect(page).toHaveURL(/type=analysis/);
  await expect(page.locator('#searchResults li').first()).toBeVisible();
  const destination = await page.locator('#searchResults a').first().getAttribute('href');
  await page.locator('#searchResults a').first().click();
  await expect(page).toHaveURL(new RegExp(new URL(destination, page.url()).pathname));
  await page.goBack();
  await expect(input).toHaveValue('Claude');
  await expect(page.locator('#searchType')).toHaveValue('analysis');
});

test('strict CSP blocks unauthorized inline code while article controls work', async ({ page }) => {
  const errors = [];
  page.on('pageerror', error => errors.push(error.message));
  const response = await page.goto(articlePath);
  const csp = response.headers()['content-security-policy'];
  expect(csp).toBeTruthy();
  expect(csp.match(/script-src[^;]+/)[0]).not.toContain('unsafe-inline');
  await page.evaluate(() => {
    const script = document.createElement('script');
    script.textContent = 'window.__unauthorizedInlineRan = true';
    document.body.append(script);
  });
  expect(await page.evaluate(() => window.__unauthorizedInlineRan)).toBeUndefined();
  await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight));
  await expect.poll(async () => Number(await page.locator('[role="progressbar"]').getAttribute('aria-valuenow'))).toBeGreaterThan(90);
  await page.locator('#top-link').click();
  await expect.poll(() => page.evaluate(() => window.scrollY)).toBeLessThan(5);
  expect(errors).toEqual([]);
});

test('navigation remains on the current preview or production origin', async ({ page }) => {
  await page.goto('/');
  const origin = new URL(page.url()).origin;
  await page.locator('#menu a').filter({ hasText: '搜索' }).click();
  await expect(page).toHaveURL(`${origin}/search/`);
  await page.locator('.logo a').first().click();
  await expect(page).toHaveURL(`${origin}/`);
});

test('footer discovery, topic reading and month archives work on mobile and desktop', async ({ page }, testInfo) => {
  for (const width of [320, 1440]) {
    await page.setViewportSize({ width, height: 900 });
    await page.goto('/');
    const footer = page.getByRole('navigation', { name: '订阅与内容导航' });
    await footer.getByRole('link', { name: '主题导航' }).click();
    await expect(page).toHaveURL(/\/topics\/$/);
    await expectNoOverflow(page);
    const topic = page.getByRole('navigation', { name: '选择阅读主题' }).getByRole('link').first();
    await topic.focus();
    await page.keyboard.press('Enter');
    await expect(page.locator('.orbit-topics__group').first()).toBeFocused();
    const topicHref = await topic.getAttribute('href');
    const articles = page.locator('.orbit-topics__group').first().locator('.orbit-topics__articles a');
    expect(await articles.count()).toBeGreaterThan(0);
    await articles.first().click();
    await expect(page.locator(`.orbit-article-topics a[href$="${topicHref}"]`)).toBeVisible();
    await page.getByRole('navigation', { name: '订阅与内容导航' }).getByRole('link', { name: '月份归档' }).click();
    await expect(page).toHaveURL(/\/archives\/$/);
    await expectNoOverflow(page);
    const month = page.getByRole('navigation', { name: '按月份浏览文章' }).getByRole('link').last();
    const monthId = await month.getAttribute('href');
    await month.click();
    await expect(page).toHaveURL(new RegExp(`${monthId}$`));
    await expect(page.locator(monthId)).toBeInViewport();
    await expect(page.locator(monthId)).toBeFocused();
    const archiveLinks = await page.locator('.orbit-archive-entries a').evaluateAll(links => links.map(link => new URL(link.href).pathname));
    expect(archiveLinks.every(path => path.startsWith('/posts/'))).toBeTruthy();
    expect(new Set(archiveLinks).size).toBe(archiveLinks.length);
    const rss = page.getByRole('navigation', { name: '订阅与内容导航' }).getByRole('link', { name: 'RSS 订阅' });
    const response = await page.request.get(await rss.getAttribute('href'));
    expect(response.ok()).toBeTruthy();
    expect(await response.text()).toContain('<rss');
    await page.screenshot({ path: testInfo.outputPath(`archives-${width}.png`), fullPage: true });
  }
});

test('home and reading pages inherit the same light and dark colors', async ({ page }, testInfo) => {
  for (const theme of ['light', 'dark']) {
    await page.goto('/');
    await page.evaluate(value => localStorage.setItem('pref-theme', value), theme);
    for (const path of ['/', '/topics/', '/archives/', articlePath]) {
      await page.goto(path);
      await expect(page.locator('html')).toHaveAttribute('data-theme', theme);
      const tokens = await page.locator('main').evaluate(el => {
        const style = getComputedStyle(el);
        return ['--orbit-ink', '--orbit-accent', '--orbit-focus-contrast'].map(name => style.getPropertyValue(name).trim());
      });
      expect(tokens).toEqual(Array(3).fill(theme === 'light' ? '#121212' : '#f5f5f4'));
      await expectNoOverflow(page);
      if (path === '/topics/') await page.screenshot({ path: testInfo.outputPath(`topics-${theme}.png`), fullPage: true });
    }
  }
});

test('dark reading and search fallback remain usable without JavaScript', async ({ browser, baseURL }, testInfo) => {
  const context = await browser.newContext({ baseURL, javaScriptEnabled: false, colorScheme: 'dark', viewport: { width: 390, height: 844 } });
  const page = await context.newPage();
  await page.goto(articlePath);
  await expect(page.locator('.post-content')).toBeVisible();
  await expectNoOverflow(page);
  const colors = await page.locator('.post-content code').first().evaluate(element => {
    const style = getComputedStyle(element);
    return [style.color, style.backgroundColor];
  });
  const luminance = color => color.match(/[\d.]+/g).slice(0, 3).map(Number).map(value => {
    const channel = value / 255;
    return channel <= 0.04045 ? channel / 12.92 : ((channel + 0.055) / 1.055) ** 2.4;
  }).reduce((sum, value, index) => sum + value * [0.2126, 0.7152, 0.0722][index], 0);
  const [foreground, background] = colors.map(luminance);
  expect((Math.max(foreground, background) + 0.05) / (Math.min(foreground, background) + 0.05)).toBeGreaterThanOrEqual(4.5);
  await page.screenshot({ path: testInfo.outputPath('no-js-dark-article.png'), fullPage: true });
  await page.goto('/search/');
  await expect(page.locator('main noscript a').first()).toBeVisible();
  await page.goto('/archives/');
  const month = page.getByRole('navigation', { name: '按月份浏览文章' }).getByRole('link').last();
  const monthId = await month.getAttribute('href');
  await month.focus();
  await page.keyboard.press('Enter');
  await expect(page.locator(monthId)).toBeInViewport();
  await expect(page.locator(monthId)).toBeFocused();
  await context.close();
});
