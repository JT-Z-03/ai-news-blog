# Unified Orbit Site Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Extend the approved Orbit homepage into a unified, reading-first Hugo website covering articles, static pages, lists, search, taxonomy, archive output, and 404 while preserving every existing route and behavior.

**Architecture:** Keep `themes/hugo-PaperMod` untouched. Add project-level Hugo template overrides, one shared `orbit-site.css` design-system layer, and a progressively enhanced article-progress script through PaperMod's `extend_footer.html` hook. Verify each slice against real Hugo output before implementation, then finish with same-viewport visual comparison against the selected article reference.

**Tech Stack:** Hugo Extended 0.162.0, Go templates, hugo-PaperMod, CSS, vanilla JavaScript, PowerShell 7 regression scripts, Codex in-app Browser.

**Spec:** `docs/superpowers/specs/2026-08-22-unified-orbit-site-design.md`

## Global Constraints

- Do not edit any file inside `themes/hugo-PaperMod`.
- Preserve the approved homepage composition and content hierarchy.
- Preserve all current content, URLs, categories, pagination, search hooks, metadata, and theme-toggle behavior.
- Do not add an archive route or navigation destination.
- Use Outfit for display typography and Inter for interface/body typography with system fallbacks.
- Use `#d4ff3f` as the sole brand accent; remove the old teal presentation from live pages.
- Article reading width must remain between `780px` and `820px`.
- Desktop reference viewport is `1440 × 1024`; mobile verification viewport is `390 × 844`.
- Keep all interactions keyboard accessible, honor `prefers-reduced-motion`, and prevent horizontal overflow at `320px` and above.
- Run every shell command through `pwsh.exe -NoLogo -NoProfile -NonInteractive`.
- Use `apply_patch` for text-file changes and stage only the files named by the current task.

---

### Task 1: Preserve and Commit the Approved Homepage Baseline

**Files:**
- Modify: `layouts/index.html`
- Create: `assets/css/extended/orbit-home.css`
- Create: `layouts/partials/extend_head.html`
- Create: `scripts/validate-home-orbit.ps1`
- Create: `static/images/home/orbit/deepseek-agent-platform.webp`
- Create: `static/images/home/orbit/generated-genomes.webp`
- Create: `static/images/home/orbit/local-inference.webp`

**Interfaces:**
- Consumes: existing Hugo content categories `深度分析` and `日报`.
- Produces: the approved `.orbit-home` page and a green homepage regression validator used by every later task.

- [ ] **Step 1: Verify the current approved homepage output**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-home-orbit.ps1
```

Expected: exit `0` and `Orbit homepage validation passed.`

- [ ] **Step 2: Verify content, security headers, and whitespace**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-content.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-security.ps1
git diff --check
```

Expected: both validators pass; `git diff --check` exits `0` with at most the existing LF/CRLF warning.

- [ ] **Step 3: Inspect the exact baseline file set**

Run:

```powershell
git status --short --untracked-files=all
```

Expected: the seven homepage files listed under this task and no unexpected generated files.

- [ ] **Step 4: Commit the approved homepage baseline**

Run:

```powershell
git add -- layouts/index.html assets/css/extended/orbit-home.css layouts/partials/extend_head.html scripts/validate-home-orbit.ps1 static/images/home/orbit/deepseek-agent-platform.webp static/images/home/orbit/generated-genomes.webp static/images/home/orbit/local-inference.webp
git commit -m "feat: redesign unified Orbit homepage"
```

Expected: one commit containing only the approved homepage implementation.

---

### Task 2: Add the Global Orbit Shell and Output Validator

**Files:**
- Create: `scripts/validate-site-orbit.ps1`
- Create: `layouts/baseof.html`
- Create: `assets/css/extended/orbit-site.css`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: PaperMod partials `head.html`, `header.html`, and `footer.html` plus Hugo `.Kind`, `.Layout`, and `.Section`.
- Produces: `body.orbit-shell`, page-kind/layout classes, global Orbit tokens, shared header/footer styling, and reusable validation helpers.

- [ ] **Step 1: Write the failing shell-output test**

Create `scripts/validate-site-orbit.ps1` with a temporary Hugo build and these concrete helpers and assertions:

```powershell
$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path "$PSScriptRoot\..").Path
$hugoPath = Join-Path $projectRoot "hugo.exe"
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$destination = Join-Path $tempRoot ("ai-news-blog-site-orbit-" + [guid]::NewGuid())
$errors = [Collections.Generic.List[string]]::new()

function Read-Output([string]$relativePath) {
    $path = Join-Path $destination $relativePath
    if (-not (Test-Path -LiteralPath $path)) {
        $errors.Add("Missing generated output: $relativePath")
        return ""
    }
    return [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
}

function Require-Match([string]$markup, [string]$pattern, [string]$message) {
    if ($markup -notmatch $pattern) {
        $errors.Add($message)
    }
}

New-Item -ItemType Directory -Path $destination | Out-Null
try {
    & $hugoPath --source $projectRoot --destination $destination --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) { throw "Hugo build failed with exit code $LASTEXITCODE" }

    $outputs = @(
        "index.html",
        "posts/deepseek-v4-agent-platform/index.html",
        "categories/深度分析/index.html",
        "categories/日报/index.html",
        "search/index.html",
        "about/index.html",
        "404.html"
    )

    foreach ($relativePath in $outputs) {
        $markup = Read-Output $relativePath
        Require-Match $markup '<body[^>]*class="[^"]*\borbit-shell\b' "$relativePath should use the shared Orbit shell."
    }
}
finally {
    $resolvedDestination = [IO.Path]::GetFullPath($destination)
    if ($resolvedDestination.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolvedDestination).StartsWith("ai-news-blog-site-orbit-")) {
        Remove-Item -LiteralPath $resolvedDestination -Recurse -Force
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Orbit site validation passed."
```

- [ ] **Step 2: Run the shell-output test and verify red**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
```

Expected: failure stating that representative outputs should use the shared Orbit shell.

- [ ] **Step 3: Add the project-level base template**

Create `layouts/baseof.html` with the existing PaperMod partial contract and deterministic body classes:

```go-html-template
<!DOCTYPE html>
{{- $theme := site.Params.defaultTheme | default "auto" }}
<html lang="{{ site.Language }}" dir="{{ .Language.Direction | default "auto" }}" data-theme="{{ $theme }}">
<head>
    {{- partial "head.html" . }}
</head>
{{- $bodyClasses := slice "orbit-shell" (printf "orbit-kind-%s" .Kind) -}}
{{- with .Layout }}{{ $bodyClasses = $bodyClasses | append (printf "orbit-layout-%s" .) }}{{ end -}}
{{- with .Section }}{{ $bodyClasses = $bodyClasses | append (printf "orbit-section-%s" .) }}{{ end -}}
<body class="{{ delimit $bodyClasses " " }}" id="top">
    {{ partialCached "header.html" . .Page -}}
    <main class="main">
        {{- block "main" . }}{{ end }}
    </main>
    {{ partialCached "footer.html" . .Layout .Kind (.Param "hideFooter") (.Param "ShowCodeCopyButtons") -}}
</body>
</html>
```

- [ ] **Step 4: Add shared Orbit tokens and shell styling**

Create `assets/css/extended/orbit-site.css` beginning with these exact public tokens and shell contracts:

```css
:root {
    --orbit-accent: #d4ff3f;
    --orbit-ink: #121212;
    --orbit-muted: #767676;
    --orbit-border: #e5e5e5;
    --orbit-page: #fbfbf9;
    --orbit-surface: #ffffff;
    --orbit-surface-soft: #f4f4f1;
    --orbit-reading-width: 800px;
    --orbit-shell-width: 1200px;
}

[data-theme="dark"] {
    --orbit-ink: #f5f5f4;
    --orbit-muted: #a8a8a3;
    --orbit-border: #33332f;
    --orbit-page: #111110;
    --orbit-surface: #191918;
    --orbit-surface-soft: #212120;
}

body.orbit-shell {
    background: var(--orbit-page);
    color: var(--orbit-ink);
    font-family: "Inter", system-ui, sans-serif;
}

.orbit-shell .header {
    border-bottom: 1px solid var(--orbit-border);
    background: color-mix(in srgb, var(--orbit-page) 92%, transparent);
    backdrop-filter: blur(18px);
}

.orbit-shell .nav {
    max-width: min(var(--orbit-shell-width), calc(100vw - 32px));
}

.orbit-shell .main {
    width: min(var(--orbit-shell-width), calc(100vw - 32px));
    max-width: none;
}

.orbit-shell a:focus-visible,
.orbit-shell button:focus-visible,
.orbit-shell input:focus-visible {
    outline: 3px solid var(--orbit-accent);
    outline-offset: 3px;
}

.orbit-shell .menu a:hover,
.orbit-shell .menu .active {
    background: var(--orbit-accent);
    color: #121212;
}

.orbit-shell .footer {
    max-width: min(var(--orbit-shell-width), calc(100vw - 32px));
    border-top: 1px solid var(--orbit-border);
    color: var(--orbit-muted);
}
```

Also move the current `.home-landing` breakout rule into this file so removing `custom.css` later cannot change the approved homepage width.

- [ ] **Step 5: Run both Orbit validators and verify green**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-home-orbit.ps1
```

Expected: both validators pass.

- [ ] **Step 6: Commit the shared shell**

Run:

```powershell
git add -- scripts/validate-site-orbit.ps1 layouts/baseof.html assets/css/extended/orbit-site.css
git commit -m "feat: add shared Orbit site shell"
```

---

### Task 3: Build Reading-First Article and Static Pages

**Files:**
- Modify: `scripts/validate-site-orbit.ps1`
- Create: `layouts/single.html`
- Create: `layouts/partials/extend_footer.html`
- Modify: `assets/css/extended/orbit-site.css`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: PaperMod content partials `breadcrumbs.html`, `post_meta.html`, `cover.html`, `toc.html`, `anchored_headings.html`, `post_nav_links.html`, and `share_icons.html`.
- Produces: `.orbit-article` with functional `.orbit-reading-progress` on posts and `.orbit-static-page` without article-only chrome.

- [ ] **Step 1: Extend the output validator for post/static behavior**

Inside the existing `try` block, add:

```powershell
$articleMarkup = Read-Output "posts/deepseek-v4-agent-platform/index.html"
$aboutMarkup = Read-Output "about/index.html"

Require-Match $articleMarkup '<article class="orbit-page orbit-article"' "Regular posts should render the reading-first article layout."
Require-Match $articleMarkup 'class="orbit-reading-progress"' "Regular posts should render a reading-progress control."
Require-Match $articleMarkup 'class="orbit-article__body post-content md-content"' "Regular posts should expose the constrained reading body."
Require-Match $aboutMarkup '<article class="orbit-page orbit-static-page"' "Static pages should render the Orbit static-page layout."
if ($aboutMarkup -match 'orbit-reading-progress') {
    $errors.Add("Static pages should not render article reading progress.")
}
```

- [ ] **Step 2: Run the validator and verify red**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
```

Expected: failure for missing `.orbit-article`, progress, body, and static-page classes.

- [ ] **Step 3: Create the single-page override**

Create `layouts/single.html` with an explicit post/static branch and preserved PaperMod content hooks:

```go-html-template
{{- define "main" }}
{{- $isArticle := eq .Section "posts" -}}
<article class="orbit-page {{ if $isArticle }}orbit-article{{ else }}orbit-static-page{{ end }}">
  {{- if $isArticle }}
  <div class="orbit-reading-progress" role="progressbar" aria-label="阅读进度" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
    <span class="orbit-reading-progress__bar"></span>
    <span class="orbit-reading-progress__label">阅读进度 0%</span>
  </div>
  {{- end }}

  <header class="orbit-page__header">
    {{- partial "breadcrumbs.html" . }}
    {{- if $isArticle }}
      {{- with .GetTerms "categories" }}
        {{- with index . 0 }}
        <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>{{ .LinkTitle }}</p>
        {{- end }}
      {{- end }}
    {{- end }}
    <h1 class="orbit-page__title">{{ .Title }}</h1>
    {{- with .Description }}<p class="orbit-page__description">{{ . }}</p>{{ end }}
    {{- if not (.Param "hideMeta") }}
    <div class="orbit-page__meta">
      {{- partial "post_meta.html" . -}}
      {{- partial "translation_list.html" . -}}
      {{- partial "edit_post.html" . -}}
      {{- partial "post_canonical.html" . -}}
    </div>
    {{- end }}
  </header>

  {{- $isHidden := (.Param "cover.hiddenInSingle") | default (.Param "cover.hidden") | default false }}
  {{- partial "cover.html" (dict "cxt" . "IsSingle" true "isHidden" $isHidden) }}
  {{- if (.Param "ShowToc") }}<div class="orbit-article__toc">{{ partial "toc.html" . }}</div>{{ end }}

  {{- with .Content }}
  <div class="orbit-article__body post-content md-content">
    {{- if not ($.Param "disableAnchoredHeadings") }}
      {{- partial "anchored_headings.html" . -}}
    {{- else }}{{ . }}{{ end }}
  </div>
  {{- end }}

  {{- partial "extend_post_content.html" . }}
  {{- if $isArticle }}
  <footer class="orbit-article__footer post-footer">
    <ul class="post-tags">{{ range (.GetTerms "tags") }}<li><a href="{{ .Permalink }}">{{ .LinkTitle }}</a></li>{{ end }}</ul>
    {{- if (.Param "ShowPostNavLinks") }}{{ partial "post_nav_links.html" . }}{{ end }}
    {{- if (and site.Params.ShowShareButtons (ne .Params.disableShare true)) }}{{ partial "share_icons.html" . }}{{ end }}
  </footer>
  {{- end }}
  {{- if (.Param "comments") }}{{ partial "comments.html" . }}{{ end }}
</article>
{{- end }}
```

- [ ] **Step 4: Add functional reading progress**

Create `layouts/partials/extend_footer.html`:

```html
<script>
(() => {
  const progress = document.querySelector('.orbit-reading-progress');
  const article = document.querySelector('.orbit-article__body');
  if (!progress || !article) return;

  const bar = progress.querySelector('.orbit-reading-progress__bar');
  const label = progress.querySelector('.orbit-reading-progress__label');

  const updateProgress = () => {
    const start = article.getBoundingClientRect().top + window.scrollY;
    const distance = Math.max(article.offsetHeight - window.innerHeight, 0);
    const percent = distance === 0 ? 100 : Math.min(100, Math.max(0, ((window.scrollY - start) / distance) * 100));
    const rounded = Math.round(percent);
    progress.hidden = distance === 0;
    progress.setAttribute('aria-valuenow', String(rounded));
    bar.style.transform = `scaleX(${percent / 100})`;
    label.textContent = `阅读进度 ${rounded}%`;
  };

  updateProgress();
  document.addEventListener('scroll', updateProgress, { passive: true });
  window.addEventListener('resize', updateProgress);
})();
</script>
```

- [ ] **Step 5: Add article/static CSS contracts**

Append rules for `.orbit-page`, `.orbit-reading-progress`, `.orbit-page__header`, `.orbit-page__eyebrow`, `.orbit-page__title`, `.orbit-page__description`, `.orbit-page__meta`, `.orbit-article__body`, `.orbit-article__toc`, and `.orbit-article__footer`. Use `max-width: var(--orbit-reading-width)` for the header/body/footer, a `clamp(2.6rem, 6vw, 4.5rem)` article title, `1.85` body line height, base-page surfaces, divider-led headings, lime link underlines, and no enclosing header card or sidebar.

Use this exact progress behavior:

```css
.orbit-reading-progress {
    display: grid;
    grid-template-columns: minmax(0, 1fr) auto;
    gap: 1.25rem;
    align-items: center;
    max-width: 880px;
    margin: 2.6rem auto 4.5rem;
    color: var(--orbit-muted);
    font-size: 0.78rem;
}

.orbit-reading-progress::before {
    content: "";
    grid-column: 1;
    grid-row: 1;
    height: 2px;
    background: var(--orbit-border);
}

.orbit-reading-progress__bar {
    grid-column: 1;
    grid-row: 1;
    width: 100%;
    height: 3px;
    transform: scaleX(0);
    transform-origin: left center;
    background: var(--orbit-accent);
}
```

- [ ] **Step 6: Run both validators and verify green**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-home-orbit.ps1
```

Expected: both validators pass.

- [ ] **Step 7: Commit article/static pages**

Run:

```powershell
git add -- scripts/validate-site-orbit.ps1 layouts/single.html layouts/partials/extend_footer.html assets/css/extended/orbit-site.css
git commit -m "feat: add reading-first Orbit article pages"
```

---

### Task 4: Unify Category, Tag, Section, and Paginated Lists

**Files:**
- Modify: `scripts/validate-site-orbit.ps1`
- Create: `layouts/list.html`
- Create: `layouts/taxonomy.html`
- Modify: `assets/css/extended/orbit-site.css`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: Hugo `.RegularPages`, `.Sections`, `.Data.Terms`, `.Paginate`, and PaperMod `post_meta.html`.
- Produces: `.orbit-list` grouped article rows, `.orbit-terms` taxonomy links, and preserved pagination URLs.

- [ ] **Step 1: Add list/taxonomy output assertions**

Add:

```powershell
$deepListMarkup = Read-Output "categories/深度分析/index.html"
$dailyListMarkup = Read-Output "categories/日报/index.html"
$dailyPageTwoMarkup = Read-Output "categories/日报/page/2/index.html"
$categoryTaxonomyMarkup = Read-Output "categories/index.html"

Require-Match $deepListMarkup '<section class="orbit-list"' "Deep-analysis category should use the shared Orbit list."
Require-Match $dailyListMarkup '<div class="orbit-list__items"' "Daily category should use the grouped list surface."
Require-Match $dailyPageTwoMarkup 'class="orbit-list__row"' "Paginated daily pages should keep Orbit rows."
Require-Match $categoryTaxonomyMarkup '<ul class="orbit-terms"' "Category taxonomy should use Orbit term links."
if ($deepListMarkup -match 'class="post-entry') {
    $errors.Add("Orbit lists should not retain PaperMod floating post-entry cards.")
}
```

- [ ] **Step 2: Run the validator and verify red**

Run the site validator. Expected: missing `.orbit-list`, `.orbit-list__items`, rows, and terms; current `post-entry` check also fails.

- [ ] **Step 3: Create the list override**

Create `layouts/list.html` using one paginator and one semantic grouped list:

```go-html-template
{{- define "main" }}
{{- $pages := union .RegularPages .Sections -}}
{{- $paginator := .Paginate $pages -}}
<section class="orbit-list">
  <header class="orbit-list__header">
    {{ partial "breadcrumbs.html" . }}
    <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>AI NEWS INDEX</p>
    <h1>{{ .Title }}</h1>
    {{ with .Description }}<p>{{ . | markdownify }}</p>{{ end }}
    <p class="orbit-list__count">共 {{ len $pages }} 篇内容</p>
  </header>

  {{ with .Content }}<div class="orbit-list__intro post-content md-content">{{ . }}</div>{{ end }}

  {{ if gt (len $paginator.Pages) 0 }}
  <div class="orbit-list__items">
    {{ range $paginator.Pages }}
    <article class="orbit-list__row">
      <div class="orbit-list__context">
        {{ with .GetTerms "categories" }}{{ with index . 0 }}<span>{{ .LinkTitle }}</span>{{ end }}{{ end }}
        <time datetime="{{ .Date.Format "2006-01-02" }}">{{ .Date.Format "2006.01.02" }}</time>
      </div>
      <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
      {{ if ne (.Param "hideSummary") true }}<p>{{ .Summary | plainify | htmlUnescape }}</p>{{ end }}
      {{ if not (.Param "hideMeta") }}<div class="orbit-list__meta">{{ partial "post_meta.html" . }}</div>{{ end }}
    </article>
    {{ end }}
  </div>
  {{ else }}
  <div class="orbit-empty"><p>这里暂时还没有内容。</p><a href="{{ "/" | relURL }}">返回首页</a></div>
  {{ end }}

  {{ if gt $paginator.TotalPages 1 }}
  <nav class="orbit-pagination" aria-label="分页">
    {{ with $paginator.Prev }}<a rel="prev" href="{{ .URL }}">上一页</a>{{ end }}
    <span>{{ $paginator.PageNumber }} / {{ $paginator.TotalPages }}</span>
    {{ with $paginator.Next }}<a rel="next" href="{{ .URL }}">下一页</a>{{ end }}
  </nav>
  {{ end }}
</section>
{{- end }}
```

- [ ] **Step 4: Create the taxonomy override**

Create `layouts/taxonomy.html`:

```go-html-template
{{- define "main" }}
<section class="orbit-list orbit-taxonomy">
  <header class="orbit-list__header">
    <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>AI NEWS TOPICS</p>
    <h1>{{ .Title }}</h1>
    {{ with .Description }}<p>{{ . }}</p>{{ end }}
  </header>
  <ul class="orbit-terms">
    {{ $type := .Type }}
    {{ range .Data.Terms.Alphabetical }}
      {{ $count := .Count }}
      {{ with site.GetPage (printf "/%s/%s" $type .Name) }}
      <li><a href="{{ .RelPermalink }}"><span>{{ .LinkTitle }}</span><strong>{{ $count }}</strong></a></li>
      {{ end }}
    {{ end }}
  </ul>
</section>
{{- end }}
```

- [ ] **Step 5: Add grouped-list CSS**

Append CSS for `.orbit-list`, `.orbit-list__header`, `.orbit-list__count`, `.orbit-list__items`, `.orbit-list__row`, `.orbit-list__context`, `.orbit-list__meta`, `.orbit-pagination`, `.orbit-terms`, and `.orbit-empty`. Use a single surface with `border-block`, row `border-bottom`, no row shadows, `min-height: 44px` controls, and lime active/focus states.

- [ ] **Step 6: Run both validators and verify green**

Run the site and homepage validators. Expected: both pass, including the generated daily page 2.

- [ ] **Step 7: Commit list and taxonomy pages**

Run:

```powershell
git add -- scripts/validate-site-orbit.ps1 layouts/list.html layouts/taxonomy.html assets/css/extended/orbit-site.css
git commit -m "feat: unify Orbit list and taxonomy pages"
```

---

### Task 5: Unify Search, Archive Output, and 404

**Files:**
- Modify: `scripts/validate-site-orbit.ps1`
- Create: `layouts/search.html`
- Create: `layouts/archives.html`
- Create: `layouts/404.html`
- Modify: `assets/css/extended/orbit-site.css`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: PaperMod search hooks `#searchInput` and `#searchResults`, Hugo archive grouping, and the homepage route.
- Produces: `.orbit-search`, `.orbit-archives` when used, and `.orbit-not-found` with a working homepage action.

- [ ] **Step 1: Add utility-page output assertions**

Add:

```powershell
$searchMarkup = Read-Output "search/index.html"
$notFoundMarkup = Read-Output "404.html"

Require-Match $searchMarkup '<section class="orbit-search"' "Search should use the Orbit search layout."
Require-Match $searchMarkup 'id="searchInput"' "Search must preserve PaperMod's search input hook."
Require-Match $searchMarkup 'id="searchResults"' "Search must preserve PaperMod's results hook."
Require-Match $notFoundMarkup '<section class="orbit-not-found"' "404 should use the Orbit error layout."
Require-Match $notFoundMarkup 'href="/"' "404 should provide a direct homepage action."
```

- [ ] **Step 2: Run the validator and verify red**

Expected: missing Orbit search/error wrappers while the existing hook assertions still pass.

- [ ] **Step 3: Create the search override**

Create `layouts/search.html`:

```go-html-template
{{- define "main" }}
<section class="orbit-search">
  <header class="orbit-list__header">
    <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>AI NEWS SEARCH</p>
    <h1>{{ .Title }}</h1>
    {{ with .Description }}<p>{{ . }}</p>{{ end }}
  </header>
  <div id="searchbox" class="orbit-search__box">
    <label for="searchInput">输入关键词</label>
    <input id="searchInput" disabled placeholder="{{ .Params.placeholder | default "搜索文章" }}" aria-label="搜索文章" type="search" autocomplete="off" maxlength="64">
    <p class="orbit-search__hint">搜索 AI 热点日报与深度分析文章</p>
    <ul id="searchResults" class="searchResults orbit-search__results" aria-label="搜索结果"></ul>
  </div>
</section>
{{- end }}
```

- [ ] **Step 4: Create the archive override without adding a route**

Copy the theme archive grouping into `layouts/archives.html`, then apply these exact structural changes:

```go-html-template
{{- define "main" }}
<section class="orbit-archives">
  <header class="orbit-list__header">
    <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>AI NEWS ARCHIVE</p>
    <h1>{{ .Title }}</h1>
    {{ with .Description }}<p>{{ . }}</p>{{ end }}
  </header>
  {{ $pages := where site.RegularPages "Type" "in" site.Params.mainSections }}
  {{ if site.Params.ShowAllPagesInArchive }}{{ $pages = site.RegularPages }}{{ end }}
  {{ range $pages.GroupByPublishDate "2006" }}
    {{ if ne .Key "0001" }}
    <section class="orbit-archive-year" aria-labelledby="year-{{ .Key }}">
      <h2 id="year-{{ .Key }}">{{ .Key }} <span>{{ len .Pages }}</span></h2>
      <div class="orbit-archive-entries">
        {{ range .Pages }}
          {{ if eq .Kind "page" }}
          <article><time datetime="{{ .Date.Format "2006-01-02" }}">{{ .Date.Format "01.02" }}</time><a href="{{ .RelPermalink }}">{{ .Title }}</a></article>
          {{ end }}
        {{ end }}
      </div>
    </section>
    {{ end }}
  {{ end }}
</section>
{{- end }}
```

- [ ] **Step 5: Create the 404 override**

Create `layouts/404.html`:

```go-html-template
{{- define "main" }}
<section class="orbit-not-found">
  <p class="orbit-page__eyebrow"><span aria-hidden="true"></span>PAGE NOT FOUND</p>
  <h1>404</h1>
  <p>这个页面不存在，或者已经移动。</p>
  <a class="orbit-button" href="{{ "/" | relURL }}">返回首页</a>
</section>
{{- end }}
```

- [ ] **Step 6: Add utility-page CSS**

Append CSS for `.orbit-search`, `.orbit-search__box`, `.orbit-search__results`, `.orbit-archives`, `.orbit-archive-year`, `.orbit-archive-entries`, and `.orbit-not-found`. Preserve the disabled search state, give `#searchInput` a visible lime focus ring, style generated search result `li` elements as divider-led rows, and center the 404 action without introducing additional features.

- [ ] **Step 7: Run both validators and verify green**

Run the site and homepage validators. Expected: both pass.

- [ ] **Step 8: Commit utility pages**

Run:

```powershell
git add -- scripts/validate-site-orbit.ps1 layouts/search.html layouts/archives.html layouts/404.html assets/css/extended/orbit-site.css
git commit -m "feat: unify Orbit utility pages"
```

---

### Task 6: Remove Obsolete Teal CSS and Complete Responsive States

**Files:**
- Delete: `assets/css/extended/custom.css`
- Modify: `assets/css/extended/orbit-site.css`
- Modify: `assets/css/extended/orbit-home.css`
- Modify: `scripts/validate-site-orbit.ps1`
- Test: `scripts/validate-home-orbit.ps1`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: all Orbit selectors created in Tasks 1–5.
- Produces: one live lime design system with dark-mode, reduced-motion, tablet, mobile, and overflow-safe behavior; no active teal presentation remains.

- [ ] **Step 1: Add a built-CSS regression against the legacy accent**

After the Hugo build in `validate-site-orbit.ps1`, add:

```powershell
$cssFiles = Get-ChildItem -LiteralPath (Join-Path $destination "assets/css") -Filter "*.css" -File
$combinedCss = ($cssFiles | ForEach-Object { [IO.File]::ReadAllText($_.FullName) }) -join "`n"
if ($combinedCss -match '#14b8a6|#0f766e|rgba\(20,\s*184,\s*166') {
    $errors.Add("Built site CSS should not contain the legacy teal design tokens.")
}
```

- [ ] **Step 2: Run the validator and verify red**

Expected: failure stating that built CSS still contains legacy teal tokens from `custom.css`.

- [ ] **Step 3: Delete obsolete CSS and complete shared responsive rules**

Delete `assets/css/extended/custom.css`. Ensure `orbit-site.css` now owns the `.home-landing` breakout formerly supplied by that file.

Add these responsive contracts, then add selector-specific spacing reductions for article, list, search, archive, and 404 layouts:

```css
@media (max-width: 760px) {
    .orbit-shell .nav {
        min-height: auto;
        padding-block: 0.75rem;
    }

    .orbit-shell .main,
    .orbit-shell .nav,
    .orbit-shell .footer {
        width: min(100%, calc(100vw - 28px));
    }

    .orbit-reading-progress {
        margin-block: 1.5rem 3rem;
    }

    .orbit-page__title {
        font-size: clamp(2.15rem, 10vw, 3.25rem);
    }

    .orbit-list__row {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 480px) {
    .orbit-shell .menu {
        width: 100%;
        overflow-x: auto;
    }

    .orbit-shell .menu a,
    .orbit-pagination a,
    .orbit-button {
        min-height: 44px;
    }

    .orbit-article__body table {
        display: block;
        max-width: 100%;
        overflow-x: auto;
    }
}

@media (prefers-reduced-motion: reduce) {
    .orbit-shell *,
    .orbit-shell *::before,
    .orbit-shell *::after {
        scroll-behavior: auto !important;
        transition-duration: 0.01ms !important;
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
    }
}
```

- [ ] **Step 4: Run automated validators and a production build**

Run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-home-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-content.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-security.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "& '.\hugo.exe' --gc --minify --cleanDestinationDir --printPathWarnings"
git diff --check
```

Expected: every command exits `0`; only upstream Hugo deprecation warnings are acceptable.

- [ ] **Step 5: Commit the consolidated responsive system**

Run:

```powershell
git add -- assets/css/extended/custom.css assets/css/extended/orbit-site.css assets/css/extended/orbit-home.css scripts/validate-site-orbit.ps1
git commit -m "style: consolidate responsive Orbit design system"
```

---

### Task 7: Run Browser Interaction Checks and Blocking Design QA

**Files:**
- Create: `design-qa.md`
- Modify: implementation files from Tasks 2–6 only when a P0/P1/P2 mismatch requires a fix.
- Test: `scripts/validate-home-orbit.ps1`
- Test: `scripts/validate-site-orbit.ps1`

**Interfaces:**
- Consumes: `docs/design-references/orbit-reading-first-article-reference.png` and the running Hugo site at `http://127.0.0.1:1313/`.
- Produces: verified desktop/mobile light/dark states and `design-qa.md` ending with `final result: passed`.

- [ ] **Step 1: Start or reuse the Hugo preview**

Run when no preview is active:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "& '.\hugo.exe' server --bind 127.0.0.1 --port 1313 --disableFastRender"
```

Expected: the site is available at `http://127.0.0.1:1313/` and the process remains running.

- [ ] **Step 2: Capture the representative desktop implementation**

Using the Codex in-app Browser, set `1440 × 1024`, open `/posts/deepseek-v4-agent-platform/` in light mode, and capture the viewport. Confirm in the DOM that `.orbit-article`, `.orbit-reading-progress`, and `.orbit-article__body` exist and that page `scrollWidth` does not exceed viewport width.

- [ ] **Step 3: Compare source and implementation in one input**

Open the selected visual reference and the new article screenshot together in the same visual comparison input. Check typography, title wrapping, reading width, vertical rhythm, lime/neutral tokens, copy, progress placement, and absence of a sidebar/header card.

Create `design-qa.md` with this concrete structure:

```markdown
# Orbit Site Design QA

## Comparison

- Source: `docs/design-references/orbit-reading-first-article-reference.png`
- Implementation: `http://127.0.0.1:1313/posts/deepseek-v4-agent-platform/`
- Viewport: `1440 × 1024`, light theme

## Required Fidelity Surfaces

- Fonts and typography:
- Spacing and layout rhythm:
- Colors and visual tokens:
- Image quality and asset fidelity:
- Copy and content:

## Findings

## Responsive and Interaction Checks

- Desktop light/dark:
- Mobile light/dark:
- Navigation, search, theme toggle, reading progress, pagination, 404 action:
- Console errors and horizontal overflow:

## Final

final result: blocked
```

Write an evidence-based result after every fidelity and interaction label, and list each finding as `severity — location — evidence — impact — concrete fix`. Do not leave any section empty.

- [ ] **Step 4: Fix every P0/P1/P2 mismatch and repeat comparison**

For each actionable finding, change only the responsible template or Orbit CSS rule, rerun both Orbit validators, recapture the same route/state/viewport, and compare both images again. Do not loop on P3 polish.

- [ ] **Step 5: Verify dark and responsive states**

Check these exact states in the in-app Browser:

```text
1440 × 1024 light: article, deep-analysis list, search, 404
1440 × 1024 dark: article, homepage
390 × 844 light: homepage, article, daily list, search
390 × 844 dark: article, daily list
```

For each state, verify no clipped text, no horizontal overflow, visible focus treatment on one keyboard-accessible control, and loaded editorial images where applicable.

- [ ] **Step 6: Exercise primary interactions**

Verify that:

```text
Header navigation opens 首页, 深度分析, 日报, 搜索, and 关于.
Theme toggle changes light to dark and back.
An article row opens its article.
Daily pagination opens page 2 and returns to page 1.
Search accepts a real keyword and renders results linking to articles.
Reading progress increases after scrolling the article.
The 404 action returns to the homepage.
```

- [ ] **Step 7: Mark design QA passed and run fresh final verification**

Update `design-qa.md` so every earlier P0/P1/P2 has a recorded fix and the final line is exactly:

```text
final result: passed
```

Then run:

```powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-home-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-site-orbit.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-content.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File .\scripts\validate-security.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "& '.\hugo.exe' --gc --minify --cleanDestinationDir --printPathWarnings"
git diff --check
```

Expected: every command exits `0` and `design-qa.md` ends in `final result: passed`.

- [ ] **Step 8: Commit QA evidence and any final fixes**

Run:

```powershell
git add -- design-qa.md layouts assets/css/extended scripts/validate-home-orbit.ps1 scripts/validate-site-orbit.ps1
git commit -m "test: verify unified Orbit site design"
```

Before committing, inspect `git diff --cached --name-status` and unstage any path outside the files owned by this plan.
