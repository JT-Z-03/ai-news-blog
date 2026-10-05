[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$HugoPath = (Join-Path (Split-Path $PSScriptRoot -Parent) "hugo.exe"),
    [string]$PublicRoot,
    [string]$EvidenceDirectory,
    [string]$EvidenceName = "icon-references"
)

$ErrorActionPreference = "Stop"
$projectPath = (Resolve-Path -LiteralPath $ProjectRoot).Path
$hugoExecutable = (Resolve-Path -LiteralPath $HugoPath).Path
$temporaryParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$temporaryRoot = Join-Path $temporaryParent ("ai-news-blog-icon-test-" + [guid]::NewGuid())
$fixtureSource = Join-Path $temporaryRoot "source"
$errors = [Collections.Generic.List[string]]::new()
$cases = [Collections.Generic.List[object]]::new()
$utf8 = [Text.UTF8Encoding]::new($false)
$baseUrlMatch = [regex]::Match([IO.File]::ReadAllText((Join-Path $projectPath "hugo.toml")), '(?m)^baseURL\s*=\s*["''](?<url>[^"'']+)')
if (-not $baseUrlMatch.Success) { throw "The icon tests require the configured baseURL." }
$siteUri = [uri]$baseUrlMatch.Groups["url"].Value

function Get-HtmlAttribute([string]$tag, [string]$name) {
    $attribute = [regex]::Match($tag, ('(?i)(?:\s|^)' + [regex]::Escape($name) + '\s*=\s*(?:"(?<value>[^"]*)"|''(?<value>[^'']*)''|(?<value>[^\s>]+))'))
    return [Net.WebUtility]::HtmlDecode($attribute.Groups["value"].Value)
}

function Get-PageIcons([string]$markup, [string]$relativePath) {
    $references = [Collections.Generic.List[object]]::new()
    foreach ($link in [regex]::Matches($markup, '(?is)<link\b[^>]*>')) {
        $relation = Get-HtmlAttribute $link.Value "rel"
        if ($relation -in @("icon", "apple-touch-icon", "mask-icon")) {
            $references.Add([pscustomobject]@{ file = $relativePath; kind = "link:$relation"; url = (Get-HtmlAttribute $link.Value "href") })
        }
    }
    foreach ($script in [regex]::Matches($markup, '(?is)<script\b(?<attributes>[^>]*)>(?<json>.*?)</script>')) {
        if ((Get-HtmlAttribute $script.Groups["attributes"].Value "type") -ne "application/ld+json") { continue }
        try { $schema = $script.Groups["json"].Value | ConvertFrom-Json -AsHashtable }
        catch {
            $errors.Add("$relativePath has invalid JSON-LD: $($_.Exception.Message)")
            continue
        }
        if ($schema.ContainsKey("logo")) {
            $url = if ($schema.logo -is [Collections.IDictionary]) { $schema.logo.url } else { $schema.logo }
            $references.Add([pscustomobject]@{ file = $relativePath; kind = "schema:logo"; url = $url })
        }
        if ($schema["@type"] -eq "Person" -and $schema.ContainsKey("image")) {
            $references.Add([pscustomobject]@{ file = $relativePath; kind = "schema:image"; url = $schema.image })
        }
        if ($schema.publisher -and $schema.publisher.ContainsKey("logo")) {
            $references.Add([pscustomobject]@{ file = $relativePath; kind = "schema:publisher.logo"; url = $schema.publisher.logo.url })
        }
    }
    return $references.ToArray()
}

function Test-GeneratedIcons([string]$output, [string]$caseName) {
    $beforeCount = $errors.Count
    $allReferences = [Collections.Generic.List[object]]::new()
    $pageCount = 0
    foreach ($html in Get-ChildItem -LiteralPath $output -Filter "*.html" -Recurse -File) {
        $pageCount++
        $relativePath = [IO.Path]::GetRelativePath($output, $html.FullName).Replace("\", "/")
        $markup = [IO.File]::ReadAllText($html.FullName)
        foreach ($reference in @(Get-PageIcons $markup $relativePath)) {
            $allReferences.Add($reference)
            if (-not $reference.url) {
                $errors.Add("${caseName}: $relativePath contains an empty $($reference.kind) URL.")
                continue
            }
            $uri = [uri]::new($siteUri, $reference.url)
            if ($uri.Host -ne $siteUri.Host) { continue }
            $assetPath = [uri]::UnescapeDataString($uri.AbsolutePath).TrimStart("/").Replace("/", [IO.Path]::DirectorySeparatorChar)
            if (-not (Test-Path -LiteralPath (Join-Path $output $assetPath) -PathType Leaf)) {
                $errors.Add("${caseName}: $relativePath references missing $($reference.kind) asset $($uri.AbsolutePath).")
            }
        }
    }
    if ($pageCount -eq 0) { $errors.Add("${caseName}: no generated HTML was checked.") }
    $cases.Add([pscustomobject]@{
        name = $caseName
        pages = $pageCount
        referenceCount = $allReferences.Count
        referencedUrls = @($allReferences.ToArray().url | Sort-Object -Unique)
        failureCount = $errors.Count - $beforeCount
    })
    return $allReferences.ToArray()
}

function Build-Fixture([string]$name, [string]$extraConfig = "") {
    $output = Join-Path $temporaryRoot ($name + "-public")
    $config = Join-Path $fixtureSource "hugo.toml"
    if ($extraConfig) { $config += "," + $extraConfig }
    $arguments = @("--source", $fixtureSource, "--config", $config, "--destination", $output, "--cacheDir", (Join-Path $temporaryRoot "cache"))
    $buildOutput = & $hugoExecutable @arguments 2>&1
    $buildExitCode = $LASTEXITCODE
    if ($EvidenceDirectory) {
        [IO.File]::WriteAllText((Join-Path $EvidenceDirectory "$EvidenceName-$name-build.log"), ($buildOutput -join "`n"), $utf8)
    }
    if ($buildExitCode -ne 0) { throw "$name fixture build failed with exit code $buildExitCode." }
    return $output
}

function Require-ConfiguredReferences([object[]]$references, [string[]]$expectedUrls, [string]$caseName) {
    $homeReferences = @($references | Where-Object file -EQ "index.html")
    $links = @($homeReferences | Where-Object kind -Like "link:*")
    if ($links.Count -ne 5) { $errors.Add("${caseName}: the homepage must retain all five provided icon links.") }
    foreach ($url in $expectedUrls) {
        if ($url -notin $links.url) { $errors.Add("${caseName}: provided icon URL $url was not emitted.") }
    }
    if (-not ($homeReferences | Where-Object { $_.kind -eq "schema:logo" -and $_.url -eq $expectedUrls[0] })) {
        $errors.Add("${caseName}: the homepage logo must use the provided favicon.")
    }
    if (-not ($references | Where-Object { $_.file -eq "posts/pope-ai-encyclical/index.html" -and $_.kind -eq "schema:publisher.logo" -and $_.url -eq $expectedUrls[0] })) {
        $errors.Add("${caseName}: the article publisher logo must use the provided favicon.")
    }
}

try {
    New-Item -ItemType Directory -Path $fixtureSource -Force | Out-Null
    if ($EvidenceDirectory) { New-Item -ItemType Directory -Path $EvidenceDirectory -Force | Out-Null }
    foreach ($path in @("assets", "content", "layouts", "static", "themes", "hugo.toml")) {
        Copy-Item -LiteralPath (Join-Path $projectPath $path) -Destination $fixtureSource -Recurse
    }

    $currentOutput = if ($PublicRoot) { (Resolve-Path -LiteralPath $PublicRoot).Path } else { Build-Fixture "current" }
    $null = Test-GeneratedIcons $currentOutput "current missing-resource guard"

    # These disposable resources only exercise reference preservation; they are not new site branding.
    $pixel = [Convert]::FromBase64String("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+a5f8AAAAASUVORK5CYII=")
    foreach ($name in @("favicon-16x16.png", "favicon-32x32.png", "apple-touch-icon.png")) {
        [IO.File]::WriteAllBytes((Join-Path $fixtureSource "static/$name"), $pixel)
    }
    $icoHeader = [byte[]]@(0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 32, 0)
    $icoHeader += [BitConverter]::GetBytes([int]$pixel.Length) + [BitConverter]::GetBytes([int]22)
    [IO.File]::WriteAllBytes((Join-Path $fixtureSource "static/favicon.ico"), ($icoHeader + $pixel))
    [IO.File]::WriteAllText((Join-Path $fixtureSource "static/safari-pinned-tab.svg"), '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1 1"><path d="M0 0h1v1H0z"/></svg>', $utf8)
    $localOutput = Build-Fixture "provided-local"
    $localReferences = @(Test-GeneratedIcons $localOutput "provided local defaults")
    $localUrls = @("favicon.ico", "favicon-16x16.png", "favicon-32x32.png", "apple-touch-icon.png", "safari-pinned-tab.svg") | ForEach-Object { [uri]::new($siteUri, $_).AbsoluteUri }
    Require-ConfiguredReferences $localReferences $localUrls "provided local defaults"

    $remoteConfig = Join-Path $temporaryRoot "remote-icons.toml"
    $remoteUrls = @("favicon.ico", "favicon-16x16.png", "favicon-32x32.png", "apple-touch-icon.png", "safari-pinned-tab.svg") | ForEach-Object { "https://example.invalid/icons/$_" }
    [IO.File]::WriteAllText($remoteConfig, @"
[params.assets]
favicon = '$($remoteUrls[0])'
favicon16x16 = '$($remoteUrls[1])'
favicon32x32 = '$($remoteUrls[2])'
apple_touch_icon = '$($remoteUrls[3])'
safari_pinned_tab = '$($remoteUrls[4])'
"@, $utf8)
    $remoteOutput = Build-Fixture "configured-remote" $remoteConfig
    $remoteReferences = @(Test-GeneratedIcons $remoteOutput "explicit remote configuration")
    Require-ConfiguredReferences $remoteReferences $remoteUrls "explicit remote configuration"
}
catch { $errors.Add($_.Exception.Message) }
finally {
    if ($EvidenceDirectory) {
        $evidence = [ordered]@{ cases = $cases.ToArray(); passed = ($errors.Count -eq 0); errors = $errors.ToArray() }
        [IO.File]::WriteAllText((Join-Path $EvidenceDirectory "$EvidenceName.json"), ($evidence | ConvertTo-Json -Depth 8), $utf8)
    }
    $resolvedTemporary = [IO.Path]::GetFullPath($temporaryRoot)
    if (-not $resolvedTemporary.StartsWith($temporaryParent, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolvedTemporary -Leaf) -notlike "ai-news-blog-icon-test-*") {
        throw "Refusing to remove an unexpected test directory: $resolvedTemporary"
    }
    if (Test-Path -LiteralPath $resolvedTemporary) { Remove-Item -LiteralPath $resolvedTemporary -Recurse -Force }
}

if ($errors.Count -gt 0) {
    $errors | Select-Object -First 8 | ForEach-Object { Write-Host $_ }
    throw "Icon reference regression failed with $($errors.Count) error(s)."
}
Write-Host "Icon reference regression passed: no missing references, provided local and explicit remote icons retained."
