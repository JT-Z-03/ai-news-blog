param(
    [string]$BaseUrl = 'https://ai-news-blog-cg8.pages.dev',
    [string]$ExpectedArticle,
    [ValidateRange(1, 10)][int]$MaxAttempts = 3,
    [ValidateRange(0, 300)][int]$RetryDelaySeconds = 15
)
$ErrorActionPreference = 'Stop'
$arguments = @((Join-Path $PSScriptRoot 'site-health.mjs'), '--base-url', $BaseUrl)
if ($ExpectedArticle) { $arguments += @('--expected-article', $ExpectedArticle) }
for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
    & node @arguments
    if ($LASTEXITCODE -eq 0) { Write-Host "Site monitor passed on attempt $attempt."; exit 0 }
    if ($attempt -lt $MaxAttempts) { Start-Sleep -Seconds $RetryDelaySeconds }
}
Write-Error "Site monitor failed after $MaxAttempts attempts."
exit 1
