$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path "$PSScriptRoot\..").Path
$hugoPath = Join-Path $projectRoot "hugo.exe"
$orbitCssPath = Join-Path $projectRoot "assets/css/extended/orbit-site.css"
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$destination = Join-Path $tempRoot ("ai-news-blog-site-orbit-" + [guid]::NewGuid())
$fixtureRoot = Join-Path $tempRoot ("ai-news-blog-site-orbit-fixture-" + [guid]::NewGuid())
$fixtureDestination = Join-Path $tempRoot ("ai-news-blog-site-orbit-empty-" + [guid]::NewGuid())
$errors = [Collections.Generic.List[string]]::new()
$previousTagTaxonomy = [Environment]::GetEnvironmentVariable("HUGO_PARAMS_TAXONOMIES_TAG", "Process")

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

function Read-FixtureOutput([string]$relativePath) {
    $path = Join-Path $fixtureDestination $relativePath
    if (-not (Test-Path -LiteralPath $path)) {
        $errors.Add("Missing generated fixture output: $relativePath")
        return ""
    }
    return [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
}

New-Item -ItemType Directory -Path $destination | Out-Null
New-Item -ItemType Directory -Path $fixtureDestination | Out-Null
try {
    $env:HUGO_PARAMS_TAXONOMIES_TAG = "categories"
    & $hugoPath --source $projectRoot --destination $destination --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) { throw "Hugo build failed with exit code $LASTEXITCODE" }

    $cssFiles = Get-ChildItem -LiteralPath (Join-Path $destination "assets/css") -Filter "*.css" -File
    $combinedCss = ($cssFiles | ForEach-Object { [IO.File]::ReadAllText($_.FullName) }) -join "`n"
    if ($combinedCss -match '#14b8a6|#0f766e|rgba\(20,\s*184,\s*166') {
        $errors.Add("Built site CSS should not contain the legacy teal design tokens.")
    }
    if ($combinedCss -notmatch '(?s)@media\s*\(max-width:\s*480px\)\s*\{(?:(?!@media).)*?\.orbit-article__footer\s+\.post-tags\s+a\s*\{(?=[^}]*display:\s*inline-flex)(?=[^}]*min-height:\s*44px)(?=[^}]*align-items:\s*center)[^}]*\}') {
        $errors.Add("Article tag links should expose a 44px centered mobile hit area in built CSS.")
    }

    $fixtureContentRoot = Join-Path $fixtureRoot "content"
    $fixtureSectionRoot = Join-Path $fixtureContentRoot "orbit-empty-fixture"
    $fixtureConfigPath = Join-Path $fixtureRoot "empty-list-fixture.toml"
    New-Item -ItemType Directory -Path $fixtureSectionRoot -Force | Out-Null
    [IO.File]::WriteAllText((Join-Path $fixtureSectionRoot "_index.md"), @"
---
title: "Empty list fixture"
---
"@, [Text.Encoding]::UTF8)

    $projectContentRoot = (Join-Path $projectRoot "content").Replace("\", "/")
    $projectStaticRoot = (Join-Path $projectRoot "static").Replace("\", "/")
    $projectAssetsRoot = (Join-Path $projectRoot "assets").Replace("\", "/")
    $projectLayoutsRoot = (Join-Path $projectRoot "layouts").Replace("\", "/")
    $fixtureSectionSource = $fixtureSectionRoot.Replace("\", "/")
    $utf8WithoutBom = [Text.UTF8Encoding]::new($false)
    [IO.File]::WriteAllText($fixtureConfigPath, @"
[module]
  [[module.mounts]]
    source = "$projectContentRoot"
    target = "content"
  [[module.mounts]]
    source = "$projectStaticRoot"
    target = "static"
  [[module.mounts]]
    source = "$projectAssetsRoot"
    target = "assets"
  [[module.mounts]]
    source = "$projectLayoutsRoot"
    target = "layouts"
  [[module.mounts]]
    source = "$fixtureSectionSource"
    target = "content/orbit-empty-fixture"
"@, $utf8WithoutBom)
    & $hugoPath --source $projectRoot --config "$projectRoot/hugo.toml,$fixtureConfigPath" --destination $fixtureDestination --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) { throw "Hugo empty-list fixture build failed with exit code $LASTEXITCODE" }

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

    foreach ($relativePath in @(
        "index.html",
        "categories/深度分析/index.html",
        "categories/日报/index.html",
        "search/index.html",
        "404.html"
    )) {
        $markup = Read-Output $relativePath
        Require-Match $markup '<body[^>]*class="[^"]*\blist\b' "$relativePath should retain PaperMod's list body class."
    }

    foreach ($relativePath in @(
        "posts/deepseek-v4-agent-platform/index.html",
        "about/index.html"
    )) {
        $markup = Read-Output $relativePath
        if ($markup -match '<body[^>]*class="[^"]*\blist\b') {
            $errors.Add("$relativePath should not use PaperMod's list body class.")
        }
    }

    $articleMarkup = Read-Output "posts/deepseek-v4-agent-platform/index.html"
    $aboutMarkup = Read-Output "about/index.html"
    $deepListMarkup = Read-Output "categories/深度分析/index.html"
    $dailyListMarkup = Read-Output "categories/日报/index.html"
    $dailyPageTwoMarkup = Read-Output "categories/日报/page/2/index.html"
    $categoryTaxonomyMarkup = Read-Output "categories/index.html"
    $tagListMarkup = Read-Output "tags/AI/index.html"
    $postsSectionMarkup = Read-Output "posts/index.html"
    $emptyListMarkup = Read-FixtureOutput "orbit-empty-fixture/index.html"
    $searchMarkup = Read-Output "search/index.html"
    $notFoundMarkup = Read-Output "404.html"

    Require-Match $searchMarkup '<section class="orbit-search"' "Search should use the Orbit search layout."
    Require-Match $searchMarkup 'id="searchInput"' "Search must preserve PaperMod's search input hook."
    Require-Match $searchMarkup 'id="searchResults"' "Search must preserve PaperMod's results hook."
    Require-Match $notFoundMarkup '<section class="orbit-not-found"' "404 should use the Orbit error layout."
    Require-Match $notFoundMarkup 'href="/"' "404 should provide a direct homepage action."

    Require-Match $deepListMarkup '<section class="orbit-list"' "Deep-analysis category should use the shared Orbit list."
    Require-Match $dailyListMarkup '<div class="orbit-list__items"' "Daily category should use the grouped list surface."
    Require-Match $dailyPageTwoMarkup 'class="orbit-list__row"' "Paginated daily pages should keep Orbit rows."
    Require-Match $categoryTaxonomyMarkup '<ul class="orbit-terms"' "Category taxonomy should use Orbit term links."
    Require-Match $tagListMarkup '<section class="orbit-list"' "Tag terms should use the shared Orbit list."
    Require-Match $postsSectionMarkup '<div class="orbit-list__items"' "The posts section should use the grouped Orbit list surface."
    Require-Match $dailyListMarkup '<a rel="next" href="/categories/%E6%97%A5%E6%8A%A5/page/2/">下一页</a>' "The first daily category page should link to its real next paginator URL."
    Require-Match $dailyPageTwoMarkup '<a rel="prev" href="/categories/%E6%97%A5%E6%8A%A5/">上一页</a>' "The second daily category page should link to its real previous paginator URL."
    Require-Match $dailyPageTwoMarkup '<a rel="next" href="/categories/%E6%97%A5%E6%8A%A5/page/3/">下一页</a>' "The second daily category page should link to its real next paginator URL."
    Require-Match $emptyListMarkup '<div class="orbit-empty">' "Empty section lists should render the Orbit empty state."
    if ($deepListMarkup -match 'class="post-entry') {
        $errors.Add("Orbit lists should not retain PaperMod floating post-entry cards.")
    }

    Require-Match $articleMarkup '<article class="orbit-page orbit-article"' "Regular posts should render the reading-first article layout."
    Require-Match $articleMarkup 'class="orbit-reading-progress"' "Regular posts should render a reading-progress control."
    Require-Match $articleMarkup 'class="orbit-reading-progress"[^>]*role="progressbar"[^>]*aria-valuemin="0"[^>]*aria-valuemax="100"[^>]*aria-valuenow="0"' "Reading progress should expose its initial ARIA range and value."
    Require-Match $articleMarkup '<span class="orbit-reading-progress__bar"></span>' "Reading progress should render its visual bar."
    Require-Match $articleMarkup '<span class="orbit-reading-progress__label">阅读进度 0%</span>' "Reading progress should render its visible value label."
    Require-Match $articleMarkup 'class="orbit-article__body post-content md-content"' "Regular posts should expose the constrained reading body."
    Require-Match $articleMarkup 'progress\.setAttribute\(.aria-valuenow.,\s*String\(' "The shipped progress script should update the accessible value."
    Require-Match $articleMarkup 'bar\.style\.transform\s*=' "The shipped progress script should update the visual bar."
    Require-Match $articleMarkup 'label\.textContent\s*=' "The shipped progress script should update the visible value label."
    Require-Match $articleMarkup 'progress\.hidden\s*=\s*distance\s*===\s*0' "The shipped progress script should hide when the article cannot scroll."
    Require-Match $articleMarkup 'addEventListener\(.scroll.,\s*updateProgress' "The shipped progress script should respond to scrolling."
    Require-Match $articleMarkup '(?s)<footer class="orbit-article__footer post-footer">.*?href="[^"]*/categories/' "The article footer should honor the configured tag-taxonomy key."
    Require-Match $aboutMarkup '<article class="orbit-page orbit-static-page"' "Static pages should render the Orbit static-page layout."
    if ($aboutMarkup -match 'orbit-reading-progress') {
        $errors.Add("Static pages should not render article reading progress.")
    }
    if ($aboutMarkup -match 'orbit-article__footer') {
        $errors.Add("Static pages should not render the article footer.")
    }

    $orbitCss = [IO.File]::ReadAllText($orbitCssPath, [Text.Encoding]::UTF8)
    Require-Match $orbitCss '(?s)\.orbit-shell \.main:not\(:has\(\.home-landing\)\)\s*\{[^}]*max-width:\s*none;' "The shared shell must override the legacy non-home main width."
    Require-Match $orbitCss '(?s)\.orbit-page__title\s*\{[^}]*font-family:\s*"Outfit"' "Orbit page titles should use the Outfit display face."
    Require-Match $orbitCss '(?s)\.orbit-article__body[^\{]*h2[^\{]*\{[^}]*font-family:\s*"Outfit"' "Article headings should use the Outfit display face."
}
finally {
    if ($null -eq $previousTagTaxonomy) {
        Remove-Item Env:HUGO_PARAMS_TAXONOMIES_TAG -ErrorAction SilentlyContinue
    }
    else {
        $env:HUGO_PARAMS_TAXONOMIES_TAG = $previousTagTaxonomy
    }
    $resolvedDestination = [IO.Path]::GetFullPath($destination)
    if ($resolvedDestination.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolvedDestination).StartsWith("ai-news-blog-site-orbit-")) {
        Remove-Item -LiteralPath $resolvedDestination -Recurse -Force
    }
    $resolvedFixtureDestination = [IO.Path]::GetFullPath($fixtureDestination)
    if ((Test-Path -LiteralPath $fixtureDestination) -and
        $resolvedFixtureDestination.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolvedFixtureDestination).StartsWith("ai-news-blog-site-orbit-empty-")) {
        Remove-Item -LiteralPath $resolvedFixtureDestination -Recurse -Force
    }
    $resolvedFixtureRoot = [IO.Path]::GetFullPath($fixtureRoot)
    if ((Test-Path -LiteralPath $fixtureRoot) -and
        $resolvedFixtureRoot.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolvedFixtureRoot).StartsWith("ai-news-blog-site-orbit-fixture-")) {
        Remove-Item -LiteralPath $resolvedFixtureRoot -Recurse -Force
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ -ErrorAction Continue }
    exit 1
}

Write-Host "Orbit site validation passed."
