param(
    [string]$HeadersPath,
    [string]$HeadPath
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($HeadersPath)) {
    $HeadersPath = Join-Path $PSScriptRoot "..\static\_headers"
}

if ([string]::IsNullOrWhiteSpace($HeadPath)) {
    $HeadPath = Join-Path $PSScriptRoot "..\layouts\partials\extend_head.html"
}

if (-not (Test-Path -LiteralPath $HeadersPath)) {
    Write-Error "Missing Cloudflare Pages security headers artifact: static/_headers"
    exit 1
}

$content = [IO.File]::ReadAllText($HeadersPath, [Text.Encoding]::UTF8)
$globalHeaderLines = [Collections.Generic.List[string]]::new()
$inGlobalRule = $false
$hasGlobalRule = $false
foreach ($line in ($content -split "\r?\n")) {
    if ([string]::IsNullOrWhiteSpace($line) -or $line.TrimStart().StartsWith('#')) {
        continue
    }

    if ($line -notmatch '^[ \t]') {
        $inGlobalRule = $line.Trim() -eq '/*'
        $hasGlobalRule = $hasGlobalRule -or $inGlobalRule
        continue
    }

    if ($inGlobalRule) {
        $globalHeaderLines.Add($line)
    }
}
# Only the global rule can supply the site-wide baseline; local rules cannot lend it headers.
$globalContent = $globalHeaderLines -join "`n"
$requiredPatterns = [ordered]@{
    "content security policy" = "(?mi)^\s+Content-Security-Policy:\s+.*default-src 'self'.*object-src 'none'.*base-uri 'self'.*form-action 'self'.*frame-ancestors 'none'"
    "strict transport security" = "(?mi)^\s+Strict-Transport-Security:\s+.*max-age=31536000"
    "content type protection" = "(?mi)^\s+X-Content-Type-Options:\s+nosniff\s*$"
    "frame protection" = "(?mi)^\s+X-Frame-Options:\s+DENY\s*$"
    "referrer policy" = "(?mi)^\s+Referrer-Policy:\s+strict-origin-when-cross-origin\s*$"
    "permissions policy" = "(?mi)^\s+Permissions-Policy:\s+.*camera=\(\).*geolocation=\(\).*microphone=\(\)"
}

$errors = @()
if (-not $hasGlobalRule) {
    $errors += 'static/_headers: missing global rule /*'
}
foreach ($requirement in $requiredPatterns.GetEnumerator()) {
    if ($globalContent -notmatch $requirement.Value) {
        $errors += "static/_headers: global rule /* missing or incomplete $($requirement.Key)"
    }
}

if (-not (Test-Path -LiteralPath $HeadPath)) {
    $errors += "Missing project head extension: layouts/partials/extend_head.html"
}
else {
    $headContent = [IO.File]::ReadAllText($HeadPath, [Text.Encoding]::UTF8)
    $cspMatches = [regex]::Matches($globalContent, "(?mi)^\s+Content-Security-Policy:\s+(?<value>.+)$")

    foreach ($cspMatch in $cspMatches) {
        $csp = $cspMatch.Groups["value"].Value.Trim()
        # Pages injects the beacon outside the project head; keep its two required origins explicit.
        $analyticsSources = [ordered]@{
            'script-src' = 'https://static.cloudflareinsights.com'
            'connect-src' = 'https://cloudflareinsights.com'
        }
        foreach ($requirement in $analyticsSources.GetEnumerator()) {
            $directiveMatch = [regex]::Match($csp, "(?i)(?:^|;\s*)$([regex]::Escape($requirement.Key))\s+(?<sources>[^;]+)")
            $sources = if ($directiveMatch.Success) { $directiveMatch.Groups['sources'].Value -split '\s+' } else { @() }
            if ($sources -notcontains $requirement.Value) {
                $errors += "static/_headers: global $($requirement.Key) must allow Web Analytics origin $($requirement.Value)"
            }
        }
        $externalLinks = [regex]::Matches($headContent, "(?is)<link\b(?<attributes>[^>]*)>")

        foreach ($link in $externalLinks) {
            $attributes = $link.Groups["attributes"].Value
            $hrefMatch = [regex]::Match($attributes, '(?i)\bhref\s*=\s*(?<quote>["''])(?<href>https://.*?)\k<quote>')
            $relMatch = [regex]::Match($attributes, '(?i)\brel\s*=\s*(?<quote>["''])(?<rel>.*?)\k<quote>')
            if (-not ($hrefMatch.Success -and $relMatch.Success)) {
                continue
            }

            $origin = ([Uri]$hrefMatch.Groups["href"].Value).GetLeftPart([UriPartial]::Authority)
            $rel = $relMatch.Groups["rel"].Value
            $directive = $null

            if ($rel -match "(?i)\bstylesheet\b") {
                $directive = "style-src"
            }
            elseif ($rel -match "(?i)\bpreconnect\b" -and $attributes -match "(?i)\bcrossorigin\b") {
                $directive = "font-src"
            }

            if ($null -eq $directive) {
                continue
            }

            $directiveMatch = [regex]::Match($csp, "(?i)(?:^|;\s*)$([regex]::Escape($directive))\s+(?<sources>[^;]+)")
            $sources = if ($directiveMatch.Success) { $directiveMatch.Groups["sources"].Value -split "\s+" } else { @() }
            if ($sources -notcontains $origin) {
                $errors += "static/_headers: $directive must allow external head resource origin $origin"
            }
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Security header validation passed."
