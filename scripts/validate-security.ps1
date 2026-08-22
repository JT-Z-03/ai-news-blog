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
$requiredPatterns = [ordered]@{
    "global rule" = "(?m)^/\*\r?$"
    "content security policy" = "(?mi)^\s+Content-Security-Policy:\s+.*default-src 'self'.*object-src 'none'.*base-uri 'self'.*form-action 'self'.*frame-ancestors 'none'"
    "strict transport security" = "(?mi)^\s+Strict-Transport-Security:\s+.*max-age=31536000"
    "content type protection" = "(?mi)^\s+X-Content-Type-Options:\s+nosniff\s*$"
    "frame protection" = "(?mi)^\s+X-Frame-Options:\s+DENY\s*$"
    "referrer policy" = "(?mi)^\s+Referrer-Policy:\s+strict-origin-when-cross-origin\s*$"
    "permissions policy" = "(?mi)^\s+Permissions-Policy:\s+.*camera=\(\).*geolocation=\(\).*microphone=\(\)"
}

$errors = @()
foreach ($requirement in $requiredPatterns.GetEnumerator()) {
    if ($content -notmatch $requirement.Value) {
        $errors += "static/_headers: missing or incomplete $($requirement.Key)"
    }
}

if (-not (Test-Path -LiteralPath $HeadPath)) {
    $errors += "Missing project head extension: layouts/partials/extend_head.html"
}
else {
    $headContent = [IO.File]::ReadAllText($HeadPath, [Text.Encoding]::UTF8)
    $cspMatch = [regex]::Match($content, "(?mi)^\s+Content-Security-Policy:\s+(?<value>.+)$")

    if ($cspMatch.Success) {
        $csp = $cspMatch.Groups["value"].Value.Trim()
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
