param(
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$HugoPath,
    [string]$EvidencePath
)

$ErrorActionPreference = "Stop"
$projectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
if (-not $HugoPath) { $HugoPath = Join-Path $projectRoot "hugo.exe" }
$tempParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$tempRoot = Join-Path $tempParent ("ai-news-blog-metadata-test-" + [guid]::NewGuid().ToString("N"))
$fixtureContent = Join-Path $tempRoot "content"
$destination = Join-Path $tempRoot "public"
$baseUrl = "https://metadata-fixture.invalid/"
$overrideUrl = "https://example.invalid/explicit-canonical/"
$errors = [Collections.Generic.List[string]]::new()
$utf8 = [Text.UTF8Encoding]::new($false)
$listCount = 0
$wordCount = $null
$readingTime = $null
$listMetadata = $null

function Write-Fixture([string]$path, [string]$text) {
    New-Item -ItemType Directory -Path (Split-Path $path -Parent) -Force | Out-Null
    [IO.File]::WriteAllText($path, $text, $utf8)
}

function Read-Output([string]$relativePath) {
    $path = Join-Path $destination $relativePath
    if (-not (Test-Path -LiteralPath $path)) {
        $errors.Add("Missing generated output: $relativePath")
        return ""
    }
    return [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
}

function Require-Match([string]$markup, [string]$pattern, [string]$message) {
    if ($markup -notmatch $pattern) { $errors.Add($message) }
}

function Require-Canonical([string]$markup, [string]$expectedUrl, [string]$relativePath) {
    $links = [regex]::Matches($markup, '<link\b[^>]*\brel="canonical"[^>]*\bhref="(?<url>[^"]*)"[^>]*>')
    if ($links.Count -ne 1) {
        $errors.Add("$relativePath must contain exactly one canonical; found $($links.Count).")
    }
    elseif ([Net.WebUtility]::HtmlDecode($links[0].Groups["url"].Value) -cne $expectedUrl) {
        $errors.Add("$relativePath canonical must be $expectedUrl; found $($links[0].Groups['url'].Value).")
    }
}

try {
    New-Item -ItemType Directory -Path $tempRoot | Out-Null
    # The unspaced body contains exactly 600 CJK characters: a known input,
    # independent of the current article corpus and Hugo's output.
    $body = "春夏秋冬" * 150
    Write-Fixture (Join-Path $fixtureContent "posts/metadata-fixture/_index.md") "---`ntitle: Metadata fixture`n---`n"
    for ($index = 1; $index -le 21; $index++) {
        $name = "item-{0:d2}" -f $index
        $date = ([datetime]"2020-01-01").AddDays(21 - $index).ToString("yyyy-MM-dd")
        Write-Fixture (Join-Path $fixtureContent "posts/metadata-fixture/$name.md") "---`ntitle: $name`ndate: $date`ntags: [metadata-regression]`n---`n$body`n"
    }
    # A high-weight child section would lead a default .Paginator collection,
    # while the site's union deliberately appends sections after regular pages.
    Write-Fixture (Join-Path $fixtureContent "posts/metadata-fixture/child/_index.md") "---`ntitle: Child section`nweight: -1`ndate: 2020-12-31`n---`n"
    Write-Fixture (Join-Path $fixtureContent "posts/metadata-canonical-fixture/_index.md") "---`ntitle: Explicit canonical fixture`ncanonicalURL: ' $overrideUrl '`n---`n"
    for ($index = 1; $index -le 11; $index++) {
        $name = "override-{0:d2}" -f $index
        Write-Fixture (Join-Path $fixtureContent "posts/metadata-canonical-fixture/$name.md") "---`ntitle: $name`ndate: 2020-01-01`n---`n$body`n"
    }

    $mounts = [Collections.Generic.List[string]]::new()
    foreach ($directory in @("content", "static", "assets", "layouts")) {
        $source = (Join-Path $projectRoot $directory).Replace("\", "/")
        $mounts.Add("  [[module.mounts]]`n    source = '$source'`n    target = '$directory'")
    }
    $fixtureSource = $fixtureContent.Replace("\", "/")
    $mounts.Add("  [[module.mounts]]`n    source = '$fixtureSource'`n    target = 'content'")
    $fixtureConfig = Join-Path $tempRoot "fixture.toml"
    Write-Fixture $fixtureConfig ("[pagination]`n  pagerSize = 10`n[module]`n" + ($mounts -join "`n") + "`n")
    & $HugoPath --source $projectRoot --config "$projectRoot/hugo.toml,$fixtureConfig" --baseURL $baseUrl --destination $destination --cacheDir (Join-Path $tempRoot "cache") --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) { throw "Metadata fixture build failed with exit code $LASTEXITCODE." }

    $article = Read-Output "posts/metadata-fixture/item-01/index.html"
    $wordMatch = [regex]::Match($article, '<span>(?<count>\d+) 字</span>')
    $timeMatch = [regex]::Match($article, '<span>(?<minutes>\d+) 分钟</span>')
    if ($wordMatch.Success) { $wordCount = [int]$wordMatch.Groups["count"].Value }
    if ($timeMatch.Success) { $readingTime = [int]$timeMatch.Groups["minutes"].Value }
    Require-Match $article '<span>600 字</span>' "The 600-character unspaced CJK article must display 600 字."
    Require-Match $article '<span>2 分钟</span>' "The 600-character CJK article must display Hugo's 2-minute estimate."
    Require-Match $article '"wordCount"\s*:\s*"600"' "The CJK article's JSON-LD wordCount must equal its displayed count."

    $allRows = [Collections.Generic.List[string]]::new()
    $pagePaths = @("posts/metadata-fixture/index.html", "posts/metadata-fixture/page/2/index.html", "posts/metadata-fixture/page/3/index.html")
    $expectedRows = @(1..21 | ForEach-Object { "/posts/metadata-fixture/item-{0:d2}/" -f $_ }) + "/posts/metadata-fixture/child/"
    for ($index = 0; $index -lt $pagePaths.Count; $index++) {
        $markup = Read-Output $pagePaths[$index]
        if ($index -eq 0) { $listMetadata = [regex]::Match($markup, '(?s)<div class="orbit-list__meta">(?<meta>.*?)</div>').Groups["meta"].Value }
        $pageNumber = $index + 1
        Require-Match $markup ([regex]::Escape("<span>$pageNumber / 3</span>")) "$($pagePaths[$index]) must retain the three-page fixture."
        foreach ($match in [regex]::Matches($markup, '<h2><a href="(?<url>[^"]+)"')) { $allRows.Add($match.Groups["url"].Value) }
        $metadata = [regex]::Matches($markup, '(?s)<div class="orbit-list__meta">(?<meta>.*?)</div>')
        $articleRows = if ($index -lt 2) { 10 } else { 1 }
        if ($metadata.Count -lt $articleRows) { $errors.Add("Fixture list must render metadata for every article row.") }
        for ($rowIndex = 0; $rowIndex -lt [Math]::Min($articleRows, $metadata.Count); $rowIndex++) {
            # Keep the existing theme i18n fallback labels; verify the numerical
            # contract in every article row, rather than impose a new translation.
            Require-Match $metadata[$rowIndex].Groups["meta"].Value '<span>600 (?:字|words)</span>' "Every fixture list article must display its 600-character CJK count."
            Require-Match $metadata[$rowIndex].Groups["meta"].Value '<span>2 (?:分钟|min)</span>' "Every fixture list article must display its 2-minute reading estimate."
        }
        if ($index -gt 0) {
            $previousUrl = if ($index -eq 1) { "/posts/metadata-fixture/" } else { "/posts/metadata-fixture/page/2/" }
            Require-Match $markup ([regex]::Escape('<a rel="prev" href="' + $previousUrl + '">')) "Fixture previous-page URL must remain correct."
        }
        else {
            if ($markup -match '<a rel="prev"') { $errors.Add("The first fixture page must not have a previous-page link.") }
        }
        if ($index -lt 2) {
            Require-Match $markup ([regex]::Escape('<a rel="next" href="/posts/metadata-fixture/page/' + ($index + 2) + '/">')) "Fixture next-page URL must remain correct."
        }
        elseif ($markup -match '<a rel="next"') { $errors.Add("The last fixture page must not have a next-page link.") }
    }
    if (($allRows -join "`n") -cne ($expectedRows -join "`n")) { $errors.Add("Pagination must preserve every regular page in order and append the child section once.") }

    foreach ($file in Get-ChildItem -LiteralPath $destination -Filter "*.html" -File -Recurse) {
        $markup = [IO.File]::ReadAllText($file.FullName, [Text.Encoding]::UTF8)
        if ($markup -notmatch '<section class="orbit-list') { continue }
        $listCount++
        $relative = [IO.Path]::GetRelativePath($destination, $file.FullName).Replace("\", "/")
        $route = $relative -replace 'index\.html$', ''
        $expected = ([Uri]::new([Uri]$baseUrl, $route)).AbsoluteUri
        if ($route -match '^posts/metadata-canonical-fixture/(?:page/\d+/)?$') { $expected = $overrideUrl }
        Require-Canonical $markup $expected $relative
    }
    if ($listCount -lt 10) { $errors.Add("The regression build must exercise the project's real lists as well as fixture lists.") }
    foreach ($relative in @("index.html", "search/index.html", "about/index.html", "posts/deepseek-v4-agent-platform/index.html")) {
        $markup = Read-Output $relative
        $route = $relative -replace 'index\.html$', ''
        Require-Canonical $markup ([Uri]::new([Uri]$baseUrl, $route)).AbsoluteUri $relative
        Require-Match $markup '<meta name="description"' "$relative must retain the original head metadata."
    }
    Require-Match (Read-Output "search/index.html") '<script\b[^>]*src="[^"]*assets/js/search' "Search must retain its generated JavaScript bundle."
    Write-Host "CJK fixture observed: $wordCount characters / $readingTime minutes; checked $listCount list canonical URLs."
}
finally {
    if ($EvidencePath) {
        $evidence = [ordered]@{ fixtureCharacters = 600; expectedMinutes = 2; observedCharacters = $wordCount; observedMinutes = $readingTime; firstListMetadata = $listMetadata; checkedListPages = $listCount; errors = @($errors) }
        [IO.File]::WriteAllText([IO.Path]::GetFullPath($EvidencePath), ($evidence | ConvertTo-Json -Depth 4), $utf8)
    }
    $resolved = [IO.Path]::GetFullPath($tempRoot)
    if ($resolved.StartsWith($tempParent, [StringComparison]::OrdinalIgnoreCase) -and [IO.Path]::GetFileName($resolved).StartsWith("ai-news-blog-metadata-test-")) {
        if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ -ErrorAction Continue }
    exit 1
}
Write-Host "Content statistics and pagination canonical regression passed."
