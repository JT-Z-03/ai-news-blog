$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path "$PSScriptRoot\..").Path
$hugoPath = Join-Path $projectRoot "hugo.exe"
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$destination = Join-Path $tempRoot ("ai-news-blog-orbit-" + [guid]::NewGuid())
$errors = @()
$cssPath = Join-Path $projectRoot "assets/css/extended/orbit-home.css"

if (-not (Test-Path -LiteralPath $hugoPath)) {
    Write-Error "Hugo executable not found at $hugoPath"
    exit 1
}

if (-not (Test-Path -LiteralPath $cssPath)) {
    Write-Error "Orbit homepage stylesheet not found at $cssPath"
    exit 1
}

$homeCss = [IO.File]::ReadAllText($cssPath, [Text.Encoding]::UTF8)
if ($homeCss -match '--orbit-accent-text\s*:') {
    $errors += "Small homepage labels and links must use neutral ink; --orbit-accent-text is not allowed."
}
foreach ($legacyGreen in @('#708800', '#9bb62a', 'rgba(144, 174, 20,')) {
    if ($homeCss -match [regex]::Escape($legacyGreen)) {
        $errors += "Only #d4ff3f may be used as the homepage brand accent; found legacy green $legacyGreen."
    }
}

New-Item -ItemType Directory -Path $destination | Out-Null

try {
    & $hugoPath --source $projectRoot --destination $destination --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Hugo build failed with exit code $LASTEXITCODE"
        exit $LASTEXITCODE
    }

    $homePath = Join-Path $destination "index.html"
    $homeMarkup = [IO.File]::ReadAllText($homePath, [Text.Encoding]::UTF8)
    $homeRootCount = [regex]::Matches($homeMarkup, '<div[^>]*class="[^"]*\borbit-home\b[^"]*"').Count
    $featuredLeadCount = [regex]::Matches($homeMarkup, '<article class="orbit-feature__lead"').Count
    $featuredDailyCount = [regex]::Matches($homeMarkup, '<article class="orbit-feature__daily-item"').Count
    $analysisCardCount = [regex]::Matches($homeMarkup, '<article class="orbit-analysis-card"').Count
    $dailyItemCount = [regex]::Matches($homeMarkup, '<article class="orbit-daily-item"').Count
    $imageCount = [regex]::Matches($homeMarkup, '<img\s+[^>]*class="orbit-story-image"').Count
    $postLinkCount = [regex]::Matches($homeMarkup, 'class="orbit-post-link"').Count
    $heroActionMatch = [regex]::Match($homeMarkup, '<nav class="orbit-home__actions"[^>]*>(.*?)</nav>', [Text.RegularExpressions.RegexOptions]::Singleline)
    $heroButtonCount = [regex]::Matches($heroActionMatch.Groups[1].Value, 'class="orbit-button"').Count
    $heroPrimaryCount = [regex]::Matches($heroActionMatch.Groups[1].Value, 'orbit-button--primary').Count

    if ($homeRootCount -ne 1) {
        $errors += "Homepage should render one unified Orbit root; found $homeRootCount."
    }
    if ($featuredLeadCount -ne 1) {
        $errors += "Featured intelligence should render one lead analysis; found $featuredLeadCount."
    }
    if ($featuredDailyCount -ne 2) {
        $errors += "Featured intelligence should render 2 daily reports; found $featuredDailyCount."
    }
    if ($analysisCardCount -ne 2) {
        $errors += "Unified content hub should render 2 additional analysis cards; found $analysisCardCount."
    }
    if ($dailyItemCount -ne 6) {
        $errors += "Unified content hub should render 6 additional daily reports; found $dailyItemCount."
    }
    if ($imageCount -ne 3) {
        $errors += "The lead and analysis cards should render 3 editorial images; found $imageCount."
    }
    if ($postLinkCount -ne 11) {
        $errors += "Every featured and hub item should expose one post link; found $postLinkCount."
    }
    if ($heroButtonCount -ne 3 -or $heroPrimaryCount -ne 0) {
        $errors += "The 3 hero entry buttons should share the same visual style; found $heroButtonCount matching buttons and $heroPrimaryCount primary variants."
    }
    if ($homeMarkup -match '<section class="orbit-blog"') {
        $errors += "The old standalone Orbit section should not remain on the unified homepage."
    }
}
finally {
    $resolvedDestination = [IO.Path]::GetFullPath($destination)
    if ($resolvedDestination.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        [IO.Path]::GetFileName($resolvedDestination).StartsWith("ai-news-blog-orbit-")) {
        Remove-Item -LiteralPath $resolvedDestination -Recurse -Force
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Orbit homepage validation passed."
