param(
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$HugoPath,
    [string]$FixtureRoot
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
. (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
$hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectRoot -HugoPath $HugoPath
$keepFixture = -not [string]::IsNullOrWhiteSpace($FixtureRoot)
$temporaryParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$fixture = if ($keepFixture) { [IO.Path]::GetFullPath($FixtureRoot) } else { Join-Path $temporaryParent ('ai-news-blog-daily-updated-' + [guid]::NewGuid().ToString('N')) }
if (Test-Path -LiteralPath $fixture) { throw "Fixture directory must be new: $fixture" }
$output = Join-Path $fixture 'public'

function Write-Fixture([string]$path, [string]$text) {
    New-Item -ItemType Directory -Force -Path (Split-Path $path -Parent) | Out-Null
    [IO.File]::WriteAllText($path, $text, [Text.UTF8Encoding]::new($false))
}
function Read-Output([string]$relative) { return [IO.File]::ReadAllText((Join-Path $output $relative)) }
function Require([bool]$condition, [string]$message) { if (-not $condition) { throw $message } }

try {
    $articles = @(
        @{ name = 'same-day'; date = '2020-01-03T08:00:00+08:00'; lastmod = '2020-01-03T06:00:00Z'; category = '日报' },
        @{ name = 'cross-day'; date = '2020-01-02T08:00:00+08:00'; lastmod = '2020-01-03T08:00:00Z'; category = '日报' },
        @{ name = 'stream'; date = '2020-01-01T08:00:00+08:00'; lastmod = '2020-01-02T00:00:00Z'; category = '日报' },
        @{ name = 'legacy'; date = '2019-12-31T08:00:00+08:00'; category = '日报' },
        @{ name = 'first-published'; date = '2019-12-30T00:00:00+08:00'; publishDate = '2019-12-30T08:23:00+08:00'; category = '日报' },
        @{ name = 'unchanged'; date = '2019-12-29T08:00:00+08:00'; lastmod = '2019-12-29T08:00:00+08:00'; category = '日报' },
        @{ name = 'analysis'; date = '2020-01-04T08:00:00+08:00'; lastmod = '2020-01-04T06:00:00Z'; category = '深度分析' }
    )
    foreach ($article in $articles) {
        $modified = if ($article.lastmod) { "lastmod: $($article.lastmod)`n" } else { '' }
        $published = if ($article.publishDate) { "publishDate: $($article.publishDate)`n" } else { '' }
        Write-Fixture (Join-Path $fixture "content/posts/$($article.name).md") "---`ntitle: $($article.name)`ndate: $($article.date)`n${modified}${published}categories: [$($article.category)]`ntags: [AI]`nslug: $($article.name)`ndraft: false`n---`n测试正文 [来源](https://example.org/)。`n"
    }
    # Use disposable content with the real site templates, assets, and theme.
    $mounts = @("  [[module.mounts]]`n    source = '$((Join-Path $fixture 'content').Replace('\', '/'))'`n    target = 'content'")
    foreach ($directory in @('static', 'assets', 'layouts', 'data')) {
        $mounts += "  [[module.mounts]]`n    source = '$((Join-Path $projectRoot $directory).Replace('\', '/'))'`n    target = '$directory'"
    }
    $config = Join-Path $fixture 'fixture.toml'
    Write-Fixture $config ("[module]`n" + ($mounts -join "`n") + "`n")
    $build = & $hugoExecutable --source $projectRoot --config "$projectRoot/hugo.toml,$config" --baseURL 'https://daily-fixture.invalid/' --destination $output --cacheDir (Join-Path $fixture 'cache') 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Daily update fixture build failed: $($build -join [Environment]::NewLine)" }
    $homeMarkup = Read-Output 'index.html'
    $list = Read-Output 'categories/日报/index.html'
    $same = Read-Output 'posts/same-day/index.html'
    $cross = Read-Output 'posts/cross-day/index.html'
    foreach ($markup in @($homeMarkup, $list)) {
        Require ($markup.Contains('更新至 1月3日 14:00')) 'Same-day UTC lastmod must render as Beijing 14:00.'
        Require ($markup.Contains('更新至 1月3日 16:00')) 'Cross-day lastmod must retain the new Beijing calendar date.'
        Require ($markup.Contains('更新至 1月2日 08:00')) 'The older stream item must show its update time.'
        Require (([regex]::Matches($markup, 'class="orbit-daily-updated"')).Count -eq 3) 'Exactly the three explicitly updated dailies must show update labels.'
    }
    Require ($same.Contains('更新至 2020年1月3日 14:00（北京时间）')) 'Article must explicitly name Beijing time.'
    Require ($cross.Contains('更新至 2020年1月3日 16:00（北京时间）')) 'Article must convert UTC across midnight.'
    foreach ($name in @('legacy', 'first-published', 'unchanged', 'analysis')) {
        Require (-not (Read-Output "posts/$name/index.html").Contains('class="orbit-daily-updated"')) 'Omitted/equal lastmod and in-depth articles must not acquire update labels, including a separate publishDate.'
    }
    Require ($cross.Contains('2020 年 1 月 2 日')) 'Updating must preserve the original article date.'
    Require ($cross.Contains('https://daily-fixture.invalid/posts/cross-day/')) 'Updating must preserve the canonical permalink.'
    $positions = @($articles | Where-Object category -EQ '日报' | ForEach-Object { $homeMarkup.IndexOf('href="/posts/' + $_.name + '/"') })
    Require (($positions -join ',') -eq (($positions | Sort-Object) -join ',')) 'Homepage ordering must remain based on original article dates.'
    Write-Host 'Daily updated-time regression passed: UTC+8 conversion, cross-day updates, home/list/article rendering, legacy exclusion, stable date/link/order.'
}
finally {
    if (-not $keepFixture -and (Test-Path -LiteralPath $fixture)) {
        $resolved = [IO.Path]::GetFullPath($fixture)
        if (-not $resolved.StartsWith($temporaryParent, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-daily-updated-[0-9a-f]{32}$') {
            throw "Refusing to delete unexpected fixture path: $resolved"
        }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
