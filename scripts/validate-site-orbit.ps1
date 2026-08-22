$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path "$PSScriptRoot\..").Path
$hugoPath = Join-Path $projectRoot "hugo.exe"
$orbitCssPath = Join-Path $projectRoot "assets/css/extended/orbit-site.css"
$orbitHomeCssPath = Join-Path $projectRoot "assets/css/extended/orbit-home.css"
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

function Read-GeneratedAsset([string]$assetUrl) {
    $assetPath = $assetUrl
    if ([Uri]::IsWellFormedUriString($assetUrl, [UriKind]::Absolute)) {
        $assetPath = ([Uri]$assetUrl).AbsolutePath
    }
    $assetPath = $assetPath.Split("?", 2)[0].TrimStart("/").Replace("/", [IO.Path]::DirectorySeparatorChar)
    $path = Join-Path $destination $assetPath
    if (-not (Test-Path -LiteralPath $path)) {
        $errors.Add("Missing generated asset: $assetUrl")
        return ""
    }
    return [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
}

function Require-BoundedSummaries([string]$markup, [string]$relativePath, [int]$limit) {
    $matches = [regex]::Matches($markup, '(?s)<p class="orbit-list__summary">(?<summary>.*?)</p>')
    if ($matches.Count -eq 0) {
        $errors.Add("$relativePath should render identifiable bounded list summaries.")
        return
    }

    foreach ($match in $matches) {
        $plainText = [Net.WebUtility]::HtmlDecode([regex]::Replace($match.Groups["summary"].Value, "<[^>]+>", "")).Trim()
        if ($plainText.Length -gt $limit) {
            $errors.Add("$relativePath rendered a list summary with $($plainText.Length) characters; the editorial limit is $limit.")
        }
    }
}

function Require-AllGeneratedSummariesBounded([int]$limit) {
    $summaryCount = 0
    Get-ChildItem -LiteralPath $destination -Filter "*.html" -File -Recurse | ForEach-Object {
        $markup = [IO.File]::ReadAllText($_.FullName, [Text.Encoding]::UTF8)
        $matches = [regex]::Matches($markup, '(?s)<p class="orbit-list__summary">(?<summary>.*?)</p>')
        $summaryCount += $matches.Count
        foreach ($match in $matches) {
            $plainText = [Net.WebUtility]::HtmlDecode([regex]::Replace($match.Groups["summary"].Value, "<[^>]+>", "")).Trim()
            if ($plainText.Length -gt $limit) {
                $relativePath = [IO.Path]::GetRelativePath($destination, $_.FullName)
                $errors.Add("$relativePath rendered a list summary with $($plainText.Length) characters; the editorial limit is $limit.")
            }
        }
    }
    if ($summaryCount -eq 0) {
        $errors.Add("Generated output should contain bounded Orbit list summaries.")
    }
}

function ConvertTo-RelativeLuminance([string]$hexColor) {
    if ($hexColor -notmatch '^#(?<red>[0-9a-f]{2})(?<green>[0-9a-f]{2})(?<blue>[0-9a-f]{2})$') {
        throw "Unsupported CSS color: $hexColor"
    }

    $channels = @($Matches.red, $Matches.green, $Matches.blue) | ForEach-Object {
        $value = [Convert]::ToInt32($_, 16) / 255.0
        if ($value -le 0.04045) { $value / 12.92 } else { [Math]::Pow(($value + 0.055) / 1.055, 2.4) }
    }
    return (0.2126 * $channels[0]) + (0.7152 * $channels[1]) + (0.0722 * $channels[2])
}

function Get-ContrastRatio([string]$foreground, [string]$background) {
    $first = ConvertTo-RelativeLuminance $foreground
    $second = ConvertTo-RelativeLuminance $background
    $lighter = [Math]::Max($first, $second)
    $darker = [Math]::Min($first, $second)
    return ($lighter + 0.05) / ($darker + 0.05)
}

function Get-CssSpecificity([string]$selector) {
    $idCount = [regex]::Matches($selector, '#[a-zA-Z_][\w-]*').Count
    $classCount = [regex]::Matches($selector, '\.[a-zA-Z_][\w-]*').Count
    $attributeCount = [regex]::Matches($selector, '\[[^\]]+\]').Count
    $pseudoClassCount = [regex]::Matches($selector, '(?<!:):(?!:)[a-zA-Z_][\w-]*(?:\([^)]*\))?').Count

    $remaining = [regex]::Replace($selector, '#[a-zA-Z_][\w-]*|\.[a-zA-Z_][\w-]*|\[[^\]]+\]|:{1,2}[a-zA-Z_][\w-]*(?:\([^)]*\))?', ' ')
    $elementCount = [regex]::Matches($remaining, '(?i)(?:^|[\s>+~])([a-z][\w-]*)').Count

    return @($idCount, ($classCount + $attributeCount + $pseudoClassCount), $elementCount)
}

function Compare-CssSpecificity([int[]]$first, [int[]]$second) {
    for ($index = 0; $index -lt 3; $index++) {
        if ($first[$index] -ne $second[$index]) {
            return [Math]::Sign($first[$index] - $second[$index])
        }
    }
    return 0
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
    $fixtureArchiveRoot = Join-Path $fixtureContentRoot "orbit-archive-fixture"
    $fixtureConfigPath = Join-Path $fixtureRoot "empty-list-fixture.toml"
    New-Item -ItemType Directory -Path $fixtureSectionRoot -Force | Out-Null
    New-Item -ItemType Directory -Path $fixtureArchiveRoot -Force | Out-Null
    [IO.File]::WriteAllText((Join-Path $fixtureSectionRoot "_index.md"), @"
---
title: "Empty list fixture"
---
"@, [Text.Encoding]::UTF8)
    [IO.File]::WriteAllText((Join-Path $fixtureArchiveRoot "index.md"), @"
---
title: "Archive fixture"
layout: "archives"
url: "/orbit-archive-fixture/"
---
"@, [Text.Encoding]::UTF8)

    $projectContentRoot = (Join-Path $projectRoot "content").Replace("\", "/")
    $projectStaticRoot = (Join-Path $projectRoot "static").Replace("\", "/")
    $projectAssetsRoot = (Join-Path $projectRoot "assets").Replace("\", "/")
    $projectLayoutsRoot = (Join-Path $projectRoot "layouts").Replace("\", "/")
    $fixtureSectionSource = $fixtureSectionRoot.Replace("\", "/")
    $fixtureArchiveSource = $fixtureArchiveRoot.Replace("\", "/")
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
  [[module.mounts]]
    source = "$fixtureArchiveSource"
    target = "content/orbit-archive-fixture"
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
    $archiveMarkup = Read-FixtureOutput "orbit-archive-fixture/index.html"

    Require-Match $searchMarkup '<section class="orbit-search"' "Search should use the Orbit search layout."
    Require-Match $searchMarkup 'id="searchInput"' "Search must preserve PaperMod's search input hook."
    Require-Match $searchMarkup 'id="searchResults"' "Search must preserve PaperMod's results hook."
    Require-Match $searchMarkup '<p id="searchStatus" class="orbit-search__status" role="status" aria-live="polite" aria-atomic="true" data-state="initial">输入关键词开始搜索。</p>' "Search should render a visible polite live-status element in its initial state."
    $searchScriptMatch = [regex]::Match($searchMarkup, '<script\b[^>]*\bsrc="(?<src>[^"]*assets/js/search[^"]+\.js)"')
    if (-not $searchScriptMatch.Success) {
        $errors.Add("Search output should load its generated behavior bundle.")
    }
    else {
        $searchScript = Read-GeneratedAsset $searchScriptMatch.Groups["src"].Value
        foreach ($stateContract in ([ordered]@{
            "initial" = "输入关键词开始搜索。"
            "loading" = "正在加载搜索索引…"
            "results" = " 条搜索结果。"
            "empty" = "没有找到匹配结果。"
            "failure" = "搜索暂时不可用，请稍后重试。"
        }).GetEnumerator()) {
            if ($searchScript -notmatch [regex]::Escape($stateContract.Value)) {
                $errors.Add("Search behavior should ship the $($stateContract.Key) live-status state.")
            }
        }
        Require-Match $searchScript '\.dataset\.state=' "Search behavior should expose each live-status state on the status element."
        Require-Match $searchScript '\.textContent=' "Search behavior should update visible live-status text."
    }
    Require-Match $notFoundMarkup '<section class="orbit-not-found"' "404 should use the Orbit error layout."
    Require-Match $notFoundMarkup 'href="/"' "404 should provide a direct homepage action."
    Require-Match $archiveMarkup '(?s)<section class="orbit-archive-year"[^>]*>.*?<section class="orbit-archive-month"' "Archive output should nest month groups within each year."
    Require-Match $archiveMarkup '<h3 id="month-2026-08">08 月</h3>' "The isolated archive fixture should render its August 2026 month heading."
    if (Test-Path -LiteralPath (Join-Path $destination "orbit-archive-fixture\index.html")) {
        $errors.Add("The temporary archive fixture must not introduce a production route.")
    }

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
    foreach ($listOutput in ([ordered]@{
        "categories/深度分析/index.html" = $deepListMarkup
        "categories/日报/index.html" = $dailyListMarkup
        "categories/日报/page/2/index.html" = $dailyPageTwoMarkup
        "tags/AI/index.html" = $tagListMarkup
        "posts/index.html" = $postsSectionMarkup
    }).GetEnumerator()) {
        Require-BoundedSummaries $listOutput.Value $listOutput.Key 160
    }
    Require-AllGeneratedSummariesBounded 160
    Require-Match $deepListMarkup ([regex]::Escape('<p class="orbit-list__summary">从 V4-Flash、V4-Pro、峰谷定价到开源 Harness，DeepSeek 正在把竞争单位从一次模型调用扩展为一次完整的 Agent 任务。</p>')) "List rows should prefer an authored description before falling back to an automatic summary."

    Require-Match $articleMarkup '<article class="orbit-page orbit-article"' "Regular posts should render the reading-first article layout."
    Require-Match $articleMarkup '<body[^>]*class="[^"]*\borbit-nav-deep-analysis\b' "Deep-analysis articles should expose their active navigation context."
    Require-Match $articleMarkup 'class="orbit-reading-progress"' "Regular posts should render a reading-progress control."
    Require-Match $articleMarkup 'class="orbit-reading-progress"\s+hidden\s+role="progressbar"[^>]*aria-valuemin="0"[^>]*aria-valuemax="100"[^>]*aria-valuenow="0"' "Reading progress should be hidden until its script computes a meaningful scroll range."
    Require-Match $articleMarkup '<span class="orbit-reading-progress__bar"></span>' "Reading progress should render its visual bar."
    Require-Match $articleMarkup '<span class="orbit-reading-progress__label">阅读进度 0%</span>' "Reading progress should render its visible value label."
    Require-Match $articleMarkup 'class="orbit-article__body post-content md-content"' "Regular posts should expose the constrained reading body."
    Require-Match $articleMarkup '2026 年 8 月 14 日</span>&nbsp;·&nbsp;<span>3 分钟</span>&nbsp;·&nbsp;<span>469 字</span>&nbsp;·&nbsp;<span>钟懿</span>' "Article metadata should match the Chinese reading-first reference copy."
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
    $orbitHomeCss = [IO.File]::ReadAllText($orbitHomeCssPath, [Text.Encoding]::UTF8)
    $siteMutedMatch = [regex]::Match($orbitCss, '(?s):root\s*\{[^}]*--orbit-muted:\s*(?<color>#[0-9a-fA-F]{6});')
    $homeMutedMatch = [regex]::Match($orbitHomeCss, '(?s)\.orbit-home\s*\{[^}]*--orbit-muted:\s*(?<color>#[0-9a-fA-F]{6});')
    $sitePageMatch = [regex]::Match($orbitCss, '(?s):root\s*\{[^}]*--orbit-page:\s*(?<color>#[0-9a-fA-F]{6});')
    $siteSurfaceMatch = [regex]::Match($orbitCss, '(?s):root\s*\{[^}]*--orbit-surface:\s*(?<color>#[0-9a-fA-F]{6});')
    $homeSurfaceMatch = [regex]::Match($orbitHomeCss, '(?s)\.orbit-home\s*\{[^}]*--orbit-surface:\s*(?<color>#[0-9a-fA-F]{6});')
    $homeSoftSurfaceMatch = [regex]::Match($orbitHomeCss, '(?s)\.orbit-home\s*\{[^}]*--orbit-surface-soft:\s*(?<color>#[0-9a-fA-F]{6});')
    if (-not ($siteMutedMatch.Success -and $homeMutedMatch.Success -and $sitePageMatch.Success -and
        $siteSurfaceMatch.Success -and $homeSurfaceMatch.Success -and $homeSoftSurfaceMatch.Success)) {
        $errors.Add("Orbit styles should declare their light muted-text and surface tokens.")
    }
    else {
        $siteMuted = $siteMutedMatch.Groups["color"].Value
        $homeMuted = $homeMutedMatch.Groups["color"].Value
        if ($siteMuted -ne $homeMuted) {
            $errors.Add("Orbit site and homepage muted-text tokens should stay consistent.")
        }

        $mutedSurfaceContracts = [ordered]@{
            "Orbit page" = $sitePageMatch.Groups["color"].Value
            "Orbit grouped surface" = $siteSurfaceMatch.Groups["color"].Value
            "homepage surface" = $homeSurfaceMatch.Groups["color"].Value
            "homepage soft card surface" = $homeSoftSurfaceMatch.Groups["color"].Value
        }
        foreach ($surface in $mutedSurfaceContracts.GetEnumerator()) {
            $mutedContrast = Get-ContrastRatio $siteMuted $surface.Value
            if ($mutedContrast -lt 4.5) {
                $errors.Add("Light muted text contrast on $($surface.Key) $($surface.Value) is $([Math]::Round($mutedContrast, 3)):1; it must meet WCAG AA 4.5:1.")
            }
        }
    }
    Require-Match $orbitCss '(?s):root\s*\{[^}]*--orbit-focus-contrast:\s*#121212;' "Light Orbit pages should declare an ink focus-contrast token."
    Require-Match $orbitCss '(?s)\[data-theme="dark"\]\s*\{[^}]*--orbit-focus-contrast:\s*#f5f5f4;' "Dark Orbit pages should declare an off-white focus-contrast token."
    Require-Match $orbitHomeCss '(?s)\.orbit-home\s*\{[^}]*--orbit-focus-contrast:\s*#121212;' "The homepage should share the light focus-contrast token."
    Require-Match $orbitHomeCss '(?s)\[data-theme="dark"\] \.orbit-home\s*\{[^}]*--orbit-focus-contrast:\s*#f5f5f4;' "The homepage should share the dark focus-contrast token."
    Require-Match $orbitCss '(?s)\.orbit-shell a:focus-visible,[^{]*\.orbit-shell input:focus-visible\s*\{(?=[^}]*outline:\s*3px\s+solid\s+var\(--orbit-focus-contrast\))(?=[^}]*box-shadow:\s*0\s+0\s+0\s+3px\s+var\(--orbit-accent\))[^}]*\}' "Shared focus indicators should combine a contrasting outline with the lime cue."
    $cardFocusRuleMatch = [regex]::Match($orbitHomeCss, '(?ms)^(?<selector>[^\r\n{]*\.orbit-post-link:focus-visible)\s*\{(?<declarations>[^}]*)\}')
    if (-not $cardFocusRuleMatch.Success) {
        $errors.Add("Image-card focus should declare its inset two-tone treatment.")
    }
    else {
        $cardFocusSelector = $cardFocusRuleMatch.Groups["selector"].Value.Trim()
        $cardFocusDeclarations = $cardFocusRuleMatch.Groups["declarations"].Value
        Require-Match $cardFocusDeclarations '(?s)(?=.*outline:\s*3px\s+solid\s+var\(--orbit-focus-contrast\))(?=.*box-shadow:\s*inset\s+0\s+0\s+0\s+3px\s+var\(--orbit-accent\)).*' "Image-card focus should combine an inset lime cue with a contrasting outline."

        $sharedFocusSelector = '.orbit-shell a:focus-visible'
        $cardFocusSpecificity = Get-CssSpecificity $cardFocusSelector
        $sharedFocusSpecificity = Get-CssSpecificity $sharedFocusSelector
        if ((Compare-CssSpecificity $cardFocusSpecificity $sharedFocusSpecificity) -le 0) {
            $errors.Add("Image-card focus selector '$cardFocusSelector' specificity ($($cardFocusSpecificity -join ',')) must exceed shared focus selector '$sharedFocusSelector' specificity ($($sharedFocusSpecificity -join ',')) so inset focus wins the cascade.")
        }
    }
    Require-Match $orbitCss '(?s)\.orbit-search #searchInput:focus-visible\s*\{(?=[^}]*outline:\s*3px\s+solid\s+var\(--orbit-focus-contrast\))(?=[^}]*box-shadow:\s*0\s+0\s+0\s+3px\s+var\(--orbit-accent\))[^}]*\}' "Search-input focus should combine the contrasting outline with the lime cue."
    Require-Match $orbitCss '(?s)\.orbit-search__status\s*\{[^}]*color:\s*var\(--orbit-muted\);' "Search live status should be visibly styled with the readable muted token."
    Require-Match $orbitCss '(?s)\.orbit-archive-month h3\s*\{[^}]*color:\s*var\(--orbit-muted\);' "Archive month groups should expose a visible secondary heading."
    Require-Match $orbitCss '(?s)\.orbit-shell \.main:not\(:has\(\.home-landing\)\)\s*\{[^}]*max-width:\s*none;' "The shared shell must override the legacy non-home main width."
    Require-Match $orbitCss '(?s)\.orbit-shell \.header-nav\s*\{[^}]*max-width:\s*min\(var\(--orbit-shell-width\),\s*calc\(100vw\s*-\s*32px\)\);' "The header-nav rule should declare the shared Orbit shell width."
    Require-Match $orbitCss '(?s)\.orbit-reading-progress\s*\{[^}]*margin:\s*2\.6rem\s+auto\s+2\.5rem;' "The reading-progress rule should declare the reviewed compact margin."
    Require-Match $orbitCss '(?s)\.orbit-article \.orbit-page__header \.breadcrumbs\s*\{[^}]*margin-bottom:\s*0\.75rem;' "The article-breadcrumb rule should declare the reviewed bottom margin."
    Require-Match $orbitCss '(?s)\.orbit-article \.orbit-page__eyebrow\s*\{[^}]*margin-bottom:\s*1rem;' "The article-eyebrow rule should declare the reviewed bottom margin."
    Require-Match $orbitCss '(?s)\.orbit-article \.orbit-page__title\s*\{(?=[^}]*width:\s*min\(54rem,\s*calc\(100vw\s*-\s*32px\)\))(?=[^}]*max-width:\s*none)(?=[^}]*font-size:\s*clamp\(2\.4rem,\s*5vw,\s*3\.75rem\))(?=[^}]*font-weight:\s*700)(?=[^}]*line-height:\s*1\.14)(?=[^}]*letter-spacing:\s*-0\.045em)[^}]*\}' "The article-title rule should declare the reviewed 54rem surface and display typography."
    Require-Match $orbitCss '(?s)@media\s*\(min-width:\s*761px\)\s+and\s+\(max-width:\s*943px\)\s*\{(?:(?!@media).)*?\.orbit-article \.orbit-page__title\s*\{[^}]*width:\s*min\(100%,\s*var\(--orbit-reading-width\)\);' "The intermediate article-title rule should declare the available 800px reading surface through the scrollbar-safe boundary."
    Require-Match $orbitCss '(?s)\.orbit-article \.orbit-page__description\s*\{[^}]*max-width:\s*42rem;' "The article-description rule should declare its independent 42rem reading measure."
    Require-Match $orbitCss '(?s)\.orbit-article__body\s*\{[^}]*font-size:\s*1\.1rem;' "The article-body rule should declare the reviewed reading size."
    Require-Match $orbitCss '(?s)\.orbit-list__row h2\s*\{[^}]*font-size:\s*clamp\(1\.5rem,\s*3vw,\s*2\.05rem\);' "The list-title rule should declare the reviewed maximum size."
    Require-Match $orbitCss '(?s)\.orbit-shell \.orbit-search__results a\.entry-link:focus-visible\s*\{(?=[^}]*outline:\s*3px\s+solid\s+var\(--orbit-focus-contrast\))(?=[^}]*box-shadow:\s*0\s+0\s+0\s+3px\s+var\(--orbit-accent\))[^}]*\}' "Search-result focus should combine the contrasting outline with the lime cue."
    Require-Match $orbitCss '(?s)\.orbit-nav-deep-analysis \.menu a\[href\*="%E6%B7%B1%E5%BA%A6%E5%88%86%E6%9E%90/"\] span,[^{]*\{[^}]*box-shadow:\s*inset\s+0\s+-2px\s+var\(--orbit-accent\);' "The deep-analysis navigation rule should declare the Orbit accent underline."
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
