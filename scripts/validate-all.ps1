param([string]$HugoPath)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$pwshPath = Join-Path $PSHOME $(if ($IsWindows) { 'pwsh.exe' } else { 'pwsh' })
$temporaryParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$temporaryRoot = Join-Path $temporaryParent ('ai-news-blog-validation-' + [guid]::NewGuid().ToString('N'))
$previousHugoBinary = [Environment]::GetEnvironmentVariable('HUGO_BINARY', 'Process')
$exitCode = 0

try {
    . (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
    $hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectRoot -HugoPath $HugoPath
    $nodeExecutable = (Get-Command node -CommandType Application -ErrorAction Stop | Select-Object -First 1).Source
    Write-Host 'Checking the complete public repository index...'
    Push-Location -LiteralPath $projectRoot
    try {
        & $nodeExecutable (Join-Path $PSScriptRoot 'check-public-repository.mjs')
        if ($LASTEXITCODE -ne 0) {
            $exitCode = $LASTEXITCODE
            throw "Public repository boundary check failed with exit code $exitCode."
        }
    }
    finally {
        Pop-Location
    }
    $checks = @(
        @{ name = 'validate-content'; hugo = $false },
        @{ name = 'validate-security'; hugo = $false },
        @{ name = 'validate-home-orbit'; hugo = $true },
        @{ name = 'validate-site-orbit'; hugo = $true },
        @{ name = 'test-security-validation'; hugo = $false },
        @{ name = 'test-content-metadata'; hugo = $true },
        @{ name = 'test-icon-references'; hugo = $true },
        @{ name = 'test-hugo-toolchain'; hugo = $true },
        @{ name = 'test-seo-security'; hugo = $true },
        @{ name = 'test-share-metadata'; hugo = $true },
        @{ name = 'test-topics'; hugo = $true }
    )
    foreach ($check in $checks) {
        Write-Host "Running $($check.name)..."
        $arguments = @('-NoLogo', '-NoProfile', '-NonInteractive', '-File', (Join-Path $PSScriptRoot ($check.name + '.ps1')))
        if ($check.hugo) { $arguments += @('-HugoPath', $hugoExecutable) }
        & $pwshPath @arguments
        if ($LASTEXITCODE -ne 0) {
            $exitCode = $LASTEXITCODE
            throw "$($check.name) failed with exit code $exitCode."
        }
    }

    Write-Host 'Testing build, content, search, and monitoring behavior...'
    $nodeTests = @(Get-ChildItem -LiteralPath $PSScriptRoot -Filter 'test-*.mjs' | Sort-Object Name | ForEach-Object FullName)
    & $nodeExecutable --test @nodeTests
    if ($LASTEXITCODE -ne 0) {
        $exitCode = $LASTEXITCODE
        throw "Production build script regression failed with exit code $exitCode."
    }

    New-Item -ItemType Directory -Path $temporaryRoot | Out-Null
    $env:HUGO_BINARY = $hugoExecutable
    Write-Host 'Building production output in an isolated temporary directory...'
    & $nodeExecutable (Join-Path $PSScriptRoot 'build-site.mjs') --destination (Join-Path $temporaryRoot 'public')
    if ($LASTEXITCODE -ne 0) {
        $exitCode = $LASTEXITCODE
        throw "Production build failed with exit code $exitCode."
    }
}
catch {
    if ($exitCode -eq 0) { $exitCode = 1 }
    Write-Error $_ -ErrorAction Continue
}
finally {
    [Environment]::SetEnvironmentVariable('HUGO_BINARY', $previousHugoBinary, 'Process')
    if (Test-Path -LiteralPath $temporaryRoot) {
        $resolved = [IO.Path]::GetFullPath($temporaryRoot)
        if (-not $resolved.StartsWith($temporaryParent, [StringComparison]::OrdinalIgnoreCase) -or
            (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-validation-[0-9a-f]{32}$') {
            throw "Refusing to remove unexpected validation directory: $resolved"
        }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}

if ($exitCode -ne 0) { exit $exitCode }
Write-Host 'All repository checks and the isolated production build passed.'
