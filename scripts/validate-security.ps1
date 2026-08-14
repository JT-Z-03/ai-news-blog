$ErrorActionPreference = "Stop"

$headersPath = Join-Path $PSScriptRoot "..\static\_headers"
if (-not (Test-Path -LiteralPath $headersPath)) {
    Write-Error "Missing Cloudflare Pages security headers artifact: static/_headers"
    exit 1
}

$content = [IO.File]::ReadAllText($headersPath, [Text.Encoding]::UTF8)
$requiredPatterns = [ordered]@{
    "global rule" = "(?m)^/\*$"
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

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Security header validation passed."
