param(
    [string]$HugoPath,
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent)
)

$ErrorActionPreference = 'Stop'
$projectPath = (Resolve-Path -LiteralPath $ProjectRoot).Path
. (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
$hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectPath -HugoPath $HugoPath
$tempParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$tempRoot = Join-Path $tempParent ('ai-news-blog-topics-' + [guid]::NewGuid().ToString('N'))
$fixtureContent = Join-Path $tempRoot 'content'
$output = Join-Path $tempRoot 'public'
$errors = [Collections.Generic.List[string]]::new()

function Write-Fixture([string]$path, [string]$body) {
    New-Item -ItemType Directory -Path (Split-Path $path -Parent) -Force | Out-Null
    [IO.File]::WriteAllText($path, $body, [Text.UTF8Encoding]::new($false))
}

function Read-Output([string]$relative) {
    $path = Join-Path $output $relative
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $errors.Add("Missing output: $relative")
        return ''
    }
    return [IO.File]::ReadAllText($path)
}

function Get-Links([string]$markup) {
    return @([regex]::Matches($markup, '<a\b[^>]*href="(?<url>[^"]+)"') | ForEach-Object {
        [Net.WebUtility]::HtmlDecode($_.Groups['url'].Value)
    })
}

try {
    New-Item -ItemType Directory -Path $tempRoot | Out-Null
    $fixtures = @(
        @{ name = 'synonyms'; date = '2010-01-03'; tags = '[AI Agent, 智能体, AI智能体]' },
        @{ name = 'normalized'; date = '2010-01-02'; tags = '["  aI aGeNt  "]' },
        @{ name = 'overlap'; date = '2010-01-01'; tags = '[AI编程, 智能体]' },
        @{ name = 'daily'; date = '2010-01-01'; tags = '[AI, 日报]' },
        @{ name = 'unmapped'; date = '2010-01-01'; tags = '[AI Agentic]' },
        @{ name = 'draft'; date = '2010-01-01'; tags = '[智能体]'; draft = $true }
    )
    foreach ($fixture in $fixtures) {
        $draft = if ($fixture.draft) { 'true' } else { 'false' }
        $title = if ($fixture.name -eq 'synonyms') { "'<script>alert(topic)</script>'" } else { "'Topic fixture $($fixture.name)'" }
        Write-Fixture (Join-Path $fixtureContent "posts/topic-fixture-$($fixture.name).md") "---`ntitle: $title`ndate: $($fixture.date)`ntags: $($fixture.tags)`ncategories: [深度分析]`nauthor: ZestJT`ndraft: $draft`n---`n主题聚合回归夹具。`n"
    }

    # Overlay only disposable articles; all real content, data, and templates stay read-only.
    $mounts = [Collections.Generic.List[string]]::new()
    foreach ($directory in @('content', 'static', 'assets', 'layouts', 'data')) {
        $source = (Join-Path $projectPath $directory).Replace('\', '/')
        $mounts.Add("  [[module.mounts]]`n    source = '$source'`n    target = '$directory'")
    }
    $mounts.Add("  [[module.mounts]]`n    source = '$($fixtureContent.Replace('\', '/'))'`n    target = 'content'")
    $fixtureConfig = Join-Path $tempRoot 'fixture.toml'
    Write-Fixture $fixtureConfig ("[module]`n" + ($mounts -join "`n") + "`n")
    $buildOutput = & $hugoExecutable --source $projectPath --config "$projectPath/hugo.toml,$fixtureConfig" --baseURL 'https://topics-fixture.invalid/preview/' --destination $output --cacheDir (Join-Path $tempRoot 'cache') 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Topics fixture build failed: $($buildOutput -join [Environment]::NewLine)" }

    $markup = Read-Output 'topics/index.html'
    $groups = @{}
    foreach ($group in [regex]::Matches($markup, '(?s)<section class="orbit-topics__group" id="(?<id>[^"]+)"[^>]*>(?<body>.*?)</section>')) {
        $id = $group.Groups['id'].Value
        $body = $group.Groups['body'].Value
        if ($groups.ContainsKey($id)) { $errors.Add("Duplicate theme anchor: $id") }
        $groups[$id] = $body
        $articleList = [regex]::Match($body, '(?s)<ul class="orbit-topics__articles">(?<body>.*?)</ul>').Groups['body'].Value
        $links = @(Get-Links $articleList)
        $count = [regex]::Match($body, 'class="orbit-topics__count">(?<count>\d+) 篇').Groups['count'].Value
        if (-not $count -or [int]$count -ne $links.Count) { $errors.Add("Theme $id count must equal its complete article list.") }
        if (@($links | Sort-Object -Unique).Count -ne $links.Count) { $errors.Add("Theme $id contains duplicate articles.") }
        foreach ($link in $links) {
            if (-not $link.StartsWith('/preview/posts/', [StringComparison]::Ordinal)) { $errors.Add("Theme $id article link loses the base path: $link") }
            $relative = $link.Substring('/preview/'.Length).TrimEnd('/') + '/index.html'
            if (-not (Test-Path -LiteralPath (Join-Path $output $relative) -PathType Leaf)) { $errors.Add("Theme $id points to a missing article: $link") }
        }
        $dates = @([regex]::Matches($body, '<time datetime="(?<date>[^\"]+)"') | ForEach-Object { $_.Groups['date'].Value })
        if (($dates -join ',') -cne (($dates | Sort-Object -Descending) -join ',')) { $errors.Add("Theme $id must sort newest first.") }
    }
    if ($groups.Count -ne 6) { $errors.Add("Expected six stable topics; found $($groups.Count).") }
    $navigation = [regex]::Match($markup, '(?s)<nav class="orbit-topics__nav"[^>]*>(?<body>.*?)</nav>').Groups['body'].Value
    $anchors = @(Get-Links $navigation)
    foreach ($id in $groups.Keys) {
        if (@($anchors | Where-Object { $_ -ceq "#$id" }).Count -ne 1) { $errors.Add("Theme $id needs exactly one navigation anchor.") }
    }
    $agents = @(Get-Links $groups['agents'])
    foreach ($name in @('synonyms', 'normalized', 'overlap')) {
        $url = "/preview/posts/topic-fixture-$name/"
        if (@($agents | Where-Object { $_ -ceq $url }).Count -ne 1) { $errors.Add("Synonym fixture $name must appear once in agents.") }
    }
    $coding = @(Get-Links $groups['coding-work'])
    if (@($coding | Where-Object { $_ -ceq '/preview/posts/topic-fixture-overlap/' }).Count -ne 1) { $errors.Add('A cross-topic article must remain reachable in both topics.') }
    $allThemeLinks = @($groups.Values | ForEach-Object { Get-Links $_ })
    foreach ($name in @('daily', 'unmapped', 'draft')) {
        if ($allThemeLinks -contains "/preview/posts/topic-fixture-$name/") { $errors.Add("Unmapped or unpublished fixture $name must not enter a theme.") }
    }
    if ($groups['agents'] -match '<script>alert\(topic\)</script>' -or $groups['agents'] -notmatch '&lt;script&gt;alert\(topic\)&lt;/script&gt;') { $errors.Add('Article titles must be rendered as escaped text.') }

    $overlap = Read-Output 'posts/topic-fixture-overlap/index.html'
    $articleNavigation = [regex]::Match($overlap, '(?s)<nav class="orbit-article-topics"[^>]*>(?<body>.*?)</nav>').Groups['body'].Value
    $articleLinks = @(Get-Links $articleNavigation)
    if ($articleLinks.Count -ne 2 -or $articleLinks -notcontains '/preview/topics/#agents' -or $articleLinks -notcontains '/preview/topics/#coding-work') { $errors.Add('Article topic links must use the landing page base path and exact anchors.') }
    $unmappedArticle = Read-Output 'posts/topic-fixture-unmapped/index.html'
    if ($unmappedArticle -match 'class="orbit-article-topics"') { $errors.Add('An unmapped article must not display an empty topic navigation.') }

    # Existing taxonomy navigation remains available alongside the new entry points.
    foreach ($relative in @('tags/ai/index.html', 'tags/ai-agent/index.html', 'tags/智能体/index.html')) {
        [void](Read-Output $relative)
    }
    $originalLinks = @(Get-Links $overlap | ForEach-Object { [Uri]::UnescapeDataString($_) })
    if ($originalLinks -notcontains '/preview/tags/智能体/') { $errors.Add('The original tag link must remain on article pages.') }
    if ($errors.Count -gt 0) { throw ($errors -join [Environment]::NewLine) }
    Write-Host 'Topics regression passed: six groups; synonym normalization and deduplication, overlap, excluded input, complete sorted lists, escaped titles, article backlinks, legacy tags, and subdirectory URLs.'
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        $resolved = [IO.Path]::GetFullPath($tempRoot)
        if (-not $resolved.StartsWith($tempParent, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-topics-[0-9a-f]{32}$') { throw "Refusing to remove unexpected test directory: $resolved" }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
