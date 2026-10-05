param(
    [string]$ValidatorPath = (Join-Path $PSScriptRoot 'validate-security.ps1'),
    [string]$ResultsPath
)

$ErrorActionPreference = 'Stop'
$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('ai-news-blog-security-tests-' + [Guid]::NewGuid().ToString('N'))
$null = New-Item -ItemType Directory -Path $fixtureRoot
$utf8 = [Text.UTF8Encoding]::new($false)
$pwshPath = Join-Path $PSHOME $(if ($IsWindows) { 'pwsh.exe' } else { 'pwsh' })
$results = [Collections.Generic.List[object]]::new()
$securityHeaders = [ordered]@{
    'Content-Security-Policy' = "default-src 'self'; script-src 'self' 'unsafe-inline' https://static.cloudflareinsights.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; img-src 'self' data: https:; font-src 'self' data: https://fonts.gstatic.com; connect-src 'self' https://cloudflareinsights.com; object-src 'none'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'; upgrade-insecure-requests"
    'Strict-Transport-Security' = 'max-age=31536000; includeSubDomains'
    'X-Content-Type-Options' = 'nosniff'
    'X-Frame-Options' = 'DENY'
    'Referrer-Policy' = 'strict-origin-when-cross-origin'
    'Permissions-Policy' = 'camera=(), geolocation=(), microphone=(), payment=(), usb=()'
}

function New-HeadersBlock {
    param([string]$Rule = '/*', [string]$ExcludedHeader, [string]$Csp)
    $lines = [Collections.Generic.List[string]]::new()
    $lines.Add($Rule)
    foreach ($header in $securityHeaders.GetEnumerator()) {
        if ($header.Key -eq $ExcludedHeader) { continue }
        $value = if ($header.Key -eq 'Content-Security-Policy' -and $Csp) { $Csp } else { $header.Value }
        $lines.Add("  $($header.Key): $value")
    }
    return ($lines -join "`n") + "`n"
}

function Invoke-Case {
    param([string]$Name, [string]$Headers, [bool]$ShouldPass)
    $headersPath = Join-Path $fixtureRoot ($Name + '.txt')
    [IO.File]::WriteAllText($headersPath, $Headers, $utf8)
    $output = & $pwshPath -NoLogo -NoProfile -NonInteractive -File $ValidatorPath -HeadersPath $headersPath -HeadPath $headPath 2>&1 | Out-String
    $exitCode = $LASTEXITCODE
    $passed = ($exitCode -eq 0) -eq $ShouldPass
    $results.Add([pscustomobject]@{
        name = $Name
        expectedExit = if ($ShouldPass) { 'zero' } else { 'nonzero' }
        actualExit = $exitCode
        passed = $passed
        output = $output.Trim()
    })
    Write-Host ("{0}: {1} (exit {2}, expected {3})" -f $Name, $(if ($passed) { 'PASS' } else { 'FAIL' }), $exitCode, $(if ($ShouldPass) { 'zero' } else { 'nonzero' }))
}

try {
    $headPath = Join-Path $fixtureRoot 'extend_head.html'
    [IO.File]::WriteAllText($headPath, @'
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter">
'@, $utf8)

    $valid = New-HeadersBlock
    Invoke-Case 'valid-global-lf' $valid $true
    Invoke-Case 'valid-global-crlf' ($valid.Replace("`n", "`r`n")) $true
    Invoke-Case 'missing-global-rule' (New-HeadersBlock '/protected-only/*') $false
    Invoke-Case 'headers-in-specific-rule' ("/*`n  Cache-Control: no-cache`n`n" + (New-HeadersBlock '/protected-only/*')) $false

    foreach ($header in $securityHeaders.Keys) {
        Invoke-Case ('missing-' + $header.ToLowerInvariant()) (New-HeadersBlock -ExcludedHeader $header) $false
    }

    $localCsp = "/protected-only/*`n  Content-Security-Policy: $($securityHeaders['Content-Security-Policy'])`n`n"
    Invoke-Case 'csp-only-in-specific-rule' ($localCsp + (New-HeadersBlock -ExcludedHeader 'Content-Security-Policy')) $false
    $noFontsCsp = $securityHeaders['Content-Security-Policy'].Replace(' https://fonts.googleapis.com', '').Replace(' https://fonts.gstatic.com', '')
    Invoke-Case 'font-permission-from-specific-csp' ($localCsp + (New-HeadersBlock -Csp $noFontsCsp)) $false

    $noBeaconCsp = $securityHeaders['Content-Security-Policy'].Replace(' https://static.cloudflareinsights.com', '')
    $noRumCsp = $securityHeaders['Content-Security-Policy'].Replace(' https://cloudflareinsights.com', '')
    Invoke-Case 'missing-analytics-script-origin' (New-HeadersBlock -Csp $noBeaconCsp) $false
    Invoke-Case 'missing-analytics-connect-origin' (New-HeadersBlock -Csp $noRumCsp) $false
    Invoke-Case 'project-headers' ([IO.File]::ReadAllText((Join-Path $PSScriptRoot '..\static\_headers'))) $true

    $failed = @($results | Where-Object { -not $_.passed })
    if (-not [string]::IsNullOrWhiteSpace($ResultsPath)) {
        $report = [ordered]@{
            validator = [IO.Path]::GetFullPath($ValidatorPath)
            total = $results.Count
            failed = $failed.Count
            cases = @($results)
        }
        [IO.File]::WriteAllText([IO.Path]::GetFullPath($ResultsPath), ($report | ConvertTo-Json -Depth 5), $utf8)
    }
}
finally {
    $resolvedFixtureRoot = [IO.Path]::GetFullPath($fixtureRoot)
    $resolvedTempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    if (-not $resolvedFixtureRoot.StartsWith($resolvedTempRoot, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path -Leaf $resolvedFixtureRoot) -notmatch '^ai-news-blog-security-tests-[0-9a-f]{32}$') {
        throw "Refusing to remove unexpected fixture directory: $resolvedFixtureRoot"
    }
    Remove-Item -LiteralPath $resolvedFixtureRoot -Recurse -Force
}

if ($failed.Count -gt 0) {
    throw "Security validation regression tests failed: $($failed.Count) / $($results.Count)"
}
Write-Host "Security validation regression tests passed: $($results.Count) cases."
