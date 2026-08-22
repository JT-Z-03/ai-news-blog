$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path "$PSScriptRoot\..").Path
$hugoPath = Join-Path $projectRoot "hugo.exe"
$orbitCssPath = Join-Path $projectRoot "assets/css/extended/orbit-site.css"
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

    Require-Match $articleMarkup '<article class="orbit-page orbit-article"' "Regular posts should render the reading-first article layout."
    Require-Match $articleMarkup 'class="orbit-reading-progress"' "Regular posts should render a reading-progress control."
    Require-Match $articleMarkup 'class="orbit-article__body post-content md-content"' "Regular posts should expose the constrained reading body."
    Require-Match $aboutMarkup '<article class="orbit-page orbit-static-page"' "Static pages should render the Orbit static-page layout."
    if ($aboutMarkup -match 'orbit-reading-progress') {
        $errors.Add("Static pages should not render article reading progress.")
    }

    $orbitCss = [IO.File]::ReadAllText($orbitCssPath, [Text.Encoding]::UTF8)
    Require-Match $orbitCss '(?s)\.orbit-shell \.main:not\(:has\(\.home-landing\)\)\s*\{[^}]*max-width:\s*none;' "The shared shell must override the legacy non-home main width."
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
