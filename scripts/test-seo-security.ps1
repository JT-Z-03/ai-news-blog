param(
    [string]$HugoPath,
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$PublicRoot
)

$ErrorActionPreference = 'Stop'
$projectPath = (Resolve-Path -LiteralPath $ProjectRoot).Path
$tempParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$tempRoot = Join-Path $tempParent ('ai-news-blog-seo-security-' + [guid]::NewGuid().ToString('N'))
$errors = [Collections.Generic.List[string]]::new()

function Get-Attribute([string]$attributes, [string]$name) {
    $pattern = '(?i)(?:^|\s)' + [regex]::Escape($name) + '\s*=\s*(?:"(?<value>[^"]*)"|''(?<value>[^'']*)''|(?<value>[^\s>]+))'
    return [Net.WebUtility]::HtmlDecode([regex]::Match($attributes, $pattern).Groups['value'].Value)
}

function Get-MarkupErrors([string]$markup, [string]$relative, [string]$expectedType = '') {
    $problems = [Collections.Generic.List[string]]::new()
    $schemas = [Collections.Generic.List[object]]::new()
    foreach ($script in [regex]::Matches($markup, '(?is)<script\b(?<attributes>[^>]*)>(?<body>.*?)</script\s*>')) {
        $attributes = $script.Groups['attributes'].Value
        $type = Get-Attribute $attributes 'type'
        $src = Get-Attribute $attributes 'src'
        if ($type -eq 'application/ld+json') {
            try { $schemas.Add(($script.Groups['body'].Value | ConvertFrom-Json -AsHashtable)) }
            catch { $problems.Add("$relative contains invalid JSON-LD.") }
        }
        elseif (-not $src) { $problems.Add("$relative contains executable inline JavaScript.") }
    }
    foreach ($tag in [regex]::Matches($markup, '(?is)<[a-z][^>]*>')) {
        if ($tag.Value -match '(?i)\son[a-z]+\s*=') { $problems.Add("$relative contains an inline event handler.") }
        foreach ($name in @('href', 'src', 'action')) {
            $value = Get-Attribute $tag.Value $name
            if (($value -replace '[\x00-\x20]', '') -match '(?i)^javascript:') { $problems.Add("$relative contains a JavaScript URL.") }
        }
    }
    if ($markup -match '(?i)(?:datePublished|dateModified|article:published_time|article:modified_time)[^<>]{0,100}0001-') {
        $problems.Add("$relative contains a zero publication/modification date.")
    }
    if ($expectedType) {
        if (@($schemas | Where-Object { $_['@type'] -eq $expectedType }).Count -ne 1) { $problems.Add("$relative must contain exactly one $expectedType schema.") }
        $isArticle = $expectedType -eq 'BlogPosting'
        $ogType = ''
        foreach ($meta in [regex]::Matches($markup, '(?is)<meta\b[^>]*>')) {
            $property = Get-Attribute $meta.Value 'property'
            if ($property -eq 'og:type') { $ogType = Get-Attribute $meta.Value 'content' }
            if (-not $isArticle -and $property.StartsWith('article:')) { $problems.Add("$relative must not expose article Open Graph metadata.") }
        }
        $requiredOgType = if ($isArticle) { 'article' } else { 'website' }
        if ($ogType -ne $requiredOgType) { $problems.Add("$relative has incorrect Open Graph type.") }
        if (-not $isArticle) {
            foreach ($schema in $schemas) {
                if ($schema['@type'] -eq 'BlogPosting' -or $schema.ContainsKey('datePublished') -or $schema.ContainsKey('dateModified')) { $problems.Add("$relative must not pretend to be a dated article.") }
            }
        }
    }
    return $problems.ToArray()
}

try {
    if ($PublicRoot) { $output = (Resolve-Path -LiteralPath $PublicRoot).Path }
    else {
        . (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
        $hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectPath -HugoPath $HugoPath
        New-Item -ItemType Directory -Path $tempRoot | Out-Null
        $output = Join-Path $tempRoot 'public'
        $buildOutput = & $hugoExecutable --source $projectPath --destination $output --cacheDir (Join-Path $tempRoot 'cache') --minify --printPathWarnings 2>&1
        if ($LASTEXITCODE -ne 0) { throw "SEO/security fixture build failed: $($buildOutput -join [Environment]::NewLine)" }
        if (($buildOutput -join [Environment]::NewLine) -match 'LanguageCode.*deprecated|deprecated.*LanguageCode') { $errors.Add('Build must not emit the deprecated Language.LanguageCode warning.') }
    }
    $htmlCount = 0
    foreach ($file in Get-ChildItem -LiteralPath $output -Filter '*.html' -File -Recurse) {
        $htmlCount++
        $relative = [IO.Path]::GetRelativePath($output, $file.FullName).Replace('\', '/')
        $expected = switch -Regex ($relative) {
            '^about/index\.html$' { 'AboutPage'; break }
            '^search/index\.html$' { 'SearchResultsPage'; break }
            '^posts/[^/]+/index\.html$' { 'BlogPosting'; break }
            default { '' }
        }
        $markup = [IO.File]::ReadAllText($file.FullName)
        # Hugo aliases are redirect documents, not duplicate article pages.
        if ($markup -match '(?i)http-equiv\s*=\s*["'']?refresh') { $expected = '' }
        foreach ($problem in @(Get-MarkupErrors $markup $relative $expected)) { $errors.Add($problem) }
    }
    if ($htmlCount -eq 0) { $errors.Add('No generated HTML was validated.') }
    $about = [IO.File]::ReadAllText((Join-Path $output 'about/index.html'))
    $homeMarkup = [IO.File]::ReadAllText((Join-Path $output 'index.html'))
    foreach ($asset in @('orbit-theme', 'orbit-ui')) {
        if ($homeMarkup -notmatch ('src=[^>]*' + $asset)) { $errors.Add("Home must load the external $asset script.") }
    }
    $article = [IO.File]::ReadAllText((Join-Path $output 'posts/deepseek-v4-agent-platform/index.html'))
    if ($article -notmatch 'src=[^>]*orbit-reading-progress') { $errors.Add('Articles must load the external reading-progress script.') }
    [xml]$feed = [IO.File]::ReadAllText((Join-Path $output 'index.xml'))
    if ($feed.rss.channel.language -ne 'zh-CN') { $errors.Add('RSS must use the configured zh-CN locale.') }
    foreach ($item in $feed.rss.channel.item) {
        if ($item.link -match '/(?:about|search)/?$' -or $item.pubDate -match '0001') { $errors.Add('RSS must contain articles, with no static-page zero dates.') }
    }
    # Corrupt disposable strings, never project files, to prove the checks reject regressions.
    $negativeCases = [ordered]@{
        'inline-script' = $about + '<script>alert("blocked")</script>'
        'inline-event' = $about + '<button onclick="alert(1)">unsafe</button>'
        'javascript-link' = $about + '<a href="java&#x73;cript:alert(1)">unsafe</a>'
        'article-schema-on-about' = $about.Replace('"AboutPage"', '"BlogPosting"')
        'zero-date' = $about + '<script type="application/ld+json">{"datePublished":"0001-01-01T00:00:00Z"}</script>'
        'invalid-json-ld' = $about + '<script type="application/ld+json">{broken}</script>'
    }
    foreach ($case in $negativeCases.GetEnumerator()) {
        if (@(Get-MarkupErrors $case.Value 'about/index.html' 'AboutPage').Count -eq 0) { $errors.Add("Negative case was not rejected: $($case.Key)") }
    }
    if ($errors.Count -gt 0) { throw ($errors -join [Environment]::NewLine) }
    Write-Host "SEO and strict-script output regression passed: $htmlCount HTML pages, RSS, and $($negativeCases.Count) negative cases."
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        $resolved = [IO.Path]::GetFullPath($tempRoot)
        if (-not $resolved.StartsWith($tempParent, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-seo-security-[0-9a-f]{32}$') { throw "Refusing to remove unexpected test directory: $resolved" }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
