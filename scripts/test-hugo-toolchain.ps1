param([string]$HugoPath)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
$realHugo = Resolve-HugoExecutable -ProjectRoot $projectRoot -HugoPath $HugoPath
$expectedVersion = [IO.File]::ReadAllText((Join-Path $projectRoot '.hugo-version')).Trim()
$pwshPath = Join-Path $PSHOME $(if ($IsWindows) { 'pwsh.exe' } else { 'pwsh' })
$temporaryParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$temporaryRoot = Join-Path $temporaryParent ('ai-news-blog-toolchain-test-' + [guid]::NewGuid().ToString('N'))
$fixtureProject = Join-Path $temporaryRoot 'project with spaces'
$fixtureBin = Join-Path $temporaryRoot 'bin with spaces'
$originalPath = $env:PATH
$originalBuildExit = [Environment]::GetEnvironmentVariable('TOOLCHAIN_TEST_BUILD_EXIT', 'Process')
$originalNodeFailure = [Environment]::GetEnvironmentVariable('TOOLCHAIN_TEST_NODE_FAILURE', 'Process')
$originalPublicExit = [Environment]::GetEnvironmentVariable('TOOLCHAIN_TEST_PUBLIC_EXIT', 'Process')
$utf8 = [Text.UTF8Encoding]::new($false)
$caseCount = 0

function Write-TestFile([string]$path, [string]$content) {
    New-Item -ItemType Directory -Path (Split-Path $path -Parent) -Force | Out-Null
    [IO.File]::WriteAllText($path, $content, $utf8)
}

function New-TestExecutable([string]$name, [string]$versionOutput, [int]$exitCode = 0) {
    if ($IsWindows) {
        $path = Join-Path $fixtureBin ($name + '.cmd')
        Write-TestFile $path "@echo off`r`necho $versionOutput`r`nexit /b $exitCode`r`n"
    }
    else {
        $path = Join-Path $fixtureBin $name
        Write-TestFile $path "#!/bin/sh`nprintf '%s\n' '$versionOutput'`nexit $exitCode`n"
        [IO.File]::SetUnixFileMode($path, [IO.UnixFileMode]::UserRead -bor [IO.UnixFileMode]::UserWrite -bor [IO.UnixFileMode]::UserExecute)
    }
    return $path
}

function Assert-Run([string]$name, [string]$script, [string[]]$arguments, [int]$expectedExit, [string]$expectedPattern) {
    $output = (& $pwshPath -NoLogo -NoProfile -NonInteractive -File $script @arguments 2>&1 | Out-String)
    $actualExit = $LASTEXITCODE
    if ($actualExit -ne $expectedExit -or ($expectedPattern -and $output -notmatch $expectedPattern)) {
        throw "${name}: expected exit $expectedExit / pattern '$expectedPattern', observed exit ${actualExit}:`n$output"
    }
    $script:caseCount++
    Write-Host "${name}: PASS (exit $actualExit)"
}

try {
    Write-TestFile (Join-Path $fixtureProject '.hugo-version') "$expectedVersion`n"
    $resolverRunner = Join-Path $temporaryRoot 'resolve.ps1'
    Write-TestFile $resolverRunner @'
param([string]$Helper, [string]$ProjectRoot, [string]$HugoPath)
$ErrorActionPreference = 'Stop'
. $Helper
Resolve-HugoExecutable -ProjectRoot $ProjectRoot -HugoPath $HugoPath
'@
    $resolverArguments = @('-Helper', (Join-Path $PSScriptRoot 'hugo-toolchain.ps1'), '-ProjectRoot', $fixtureProject)
    $valid = New-TestExecutable 'valid-hugo' "hugo v$expectedVersion+extended test/platform"
    $wrongVersion = New-TestExecutable 'wrong-version' 'hugo v0.0.1+extended test/platform'
    $prerelease = New-TestExecutable 'prerelease' "hugo v$expectedVersion-rc.1+extended test/platform"
    $standard = New-TestExecutable 'standard' "hugo v$expectedVersion test/platform"
    $versionFailure = New-TestExecutable 'version-failure' "hugo v$expectedVersion+extended test/platform" 17
    $pathHugo = New-TestExecutable 'hugo' "hugo v$expectedVersion+extended test/platform"
    $env:PATH = $fixtureBin + [IO.Path]::PathSeparator + $originalPath

    # Copy the real platform-native binary to test project-local discovery, including spaces.
    $localHugo = Join-Path $fixtureProject $(if ($IsWindows) { 'hugo.exe' } else { 'hugo' })
    Copy-Item -LiteralPath $realHugo -Destination $localHugo
    if (-not $IsWindows) { [IO.File]::SetUnixFileMode($localHugo, [IO.File]::GetUnixFileMode($realHugo)) }
    Assert-Run 'explicit path takes priority over local and PATH' $resolverRunner ($resolverArguments + @('-HugoPath', $valid)) 0 ([regex]::Escape($valid))
    Assert-Run 'project-local binary takes priority over PATH' $resolverRunner $resolverArguments 0 ([regex]::Escape($localHugo))
    # This is the exact disposable file created above; the original executable is retained.
    Remove-Item -LiteralPath $localHugo -Force
    Assert-Run 'PATH fallback' $resolverRunner $resolverArguments 0 ([regex]::Escape($pathHugo))
    Assert-Run 'wrong version is rejected' $resolverRunner ($resolverArguments + @('-HugoPath', $wrongVersion)) 1 'version mismatch'
    Assert-Run 'prerelease does not satisfy a stable version' $resolverRunner ($resolverArguments + @('-HugoPath', $prerelease)) 1 'version mismatch'
    Assert-Run 'non-Extended binary is rejected' $resolverRunner ($resolverArguments + @('-HugoPath', $standard)) 1 'non-Extended'
    Assert-Run 'failed version command is rejected' $resolverRunner ($resolverArguments + @('-HugoPath', $versionFailure)) 1 'version check failed'
    Assert-Run 'missing explicit path does not fall back' $resolverRunner ($resolverArguments + @('-HugoPath', (Join-Path $temporaryRoot 'missing-hugo'))) 1 'Explicit Hugo executable not found'
    Write-TestFile (Join-Path $fixtureProject '.hugo-version') 'latest'
    Assert-Run 'invalid version pin is rejected' $resolverRunner ($resolverArguments + @('-HugoPath', $valid)) 1 'Invalid Hugo version'
    Remove-Item -LiteralPath (Join-Path $fixtureProject '.hugo-version') -Force
    Assert-Run 'missing version pin is rejected' $resolverRunner ($resolverArguments + @('-HugoPath', $valid)) 1 'Missing Hugo version'
    Write-TestFile (Join-Path $fixtureProject '.hugo-version') "$expectedVersion`n"

    # Exercise the real orchestrator against disposable stages, avoiding recursive real builds.
    $fixtureScripts = Join-Path $fixtureProject 'scripts'
    New-Item -ItemType Directory -Path $fixtureScripts | Out-Null
    foreach ($name in @('hugo-toolchain.ps1', 'validate-all.ps1')) {
        Copy-Item -LiteralPath (Join-Path $PSScriptRoot $name) -Destination $fixtureScripts
    }
    # This fixture verifies orchestration only; the real checker has isolated Git regression tests.
    Write-TestFile (Join-Path $fixtureScripts 'check-public-repository.mjs') @'
import fs from 'node:fs';
import { fileURLToPath } from 'node:url';
const invocation = fileURLToPath(new URL('../public-check-invocation.json', import.meta.url));
fs.writeFileSync(invocation, JSON.stringify({ cwd: process.cwd(), args: process.argv.slice(2) }));
process.exit(Number(process.env.TOOLCHAIN_TEST_PUBLIC_EXIT || 0));
'@
    $stageNames = @('validate-content', 'validate-security', 'validate-home-orbit', 'validate-site-orbit', 'test-security-validation', 'test-content-metadata', 'test-icon-references', 'test-hugo-toolchain', 'test-seo-security', 'test-share-metadata', 'test-topics')
    $stageBody = @'
param([string]$HugoPath)
Add-Content -LiteralPath (Join-Path $PSScriptRoot '../stage-log.txt') -Value ([IO.Path]::GetFileNameWithoutExtension($PSCommandPath))
exit 0
'@
    foreach ($name in $stageNames) { Write-TestFile (Join-Path $fixtureScripts ($name + '.ps1')) $stageBody }
    $formalFile = Join-Path $fixtureProject 'public/keep.txt'
    Write-TestFile $formalFile 'existing output must be preserved'
    Write-TestFile (Join-Path $fixtureScripts 'build-site.mjs') @'
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
const root = fileURLToPath(new URL('../', import.meta.url));
const args = process.argv.slice(2);
if (args.length !== 2 || args[0] !== '--destination' || !process.env.HUGO_BINARY) process.exit(93);
const destination = path.resolve(args[1]);
if (destination === path.join(root, 'public')) process.exit(94);
fs.mkdirSync(destination, { recursive: true });
fs.writeFileSync(path.join(destination, 'build-marker.txt'), 'fixture');
fs.writeFileSync(path.join(root, 'build-invocation.json'), JSON.stringify({ destination, binary: process.env.HUGO_BINARY }));
process.exit(Number(process.env.TOOLCHAIN_TEST_BUILD_EXIT || 0));
'@
    Write-TestFile (Join-Path $fixtureScripts 'test-build-site.mjs') @'
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { fileURLToPath } from 'node:url';
test('disposable production build regression', () => {
  fs.writeFileSync(fileURLToPath(new URL('../node-test-invocation.txt', import.meta.url)), 'called');
  assert.notEqual(process.env.TOOLCHAIN_TEST_NODE_FAILURE, '1');
});
'@
    $orchestrator = Join-Path $fixtureScripts 'validate-all.ps1'
    $stageLog = Join-Path $fixtureProject 'stage-log.txt'
    $env:TOOLCHAIN_TEST_PUBLIC_EXIT = '29'
    Assert-Run 'public boundary failure stops all later validation and build stages' $orchestrator @('-HugoPath', $valid) 29 'Public repository boundary check failed with exit code 29'
    if ((Test-Path -LiteralPath $stageLog) -or
        (Test-Path -LiteralPath (Join-Path $fixtureProject 'node-test-invocation.txt')) -or
        (Test-Path -LiteralPath (Join-Path $fixtureProject 'build-invocation.json'))) {
        throw 'A public boundary failure must stop PowerShell checks, Node tests, and the production build.'
    }
    $publicInvocation = Get-Content -LiteralPath (Join-Path $fixtureProject 'public-check-invocation.json') -Raw | ConvertFrom-Json
    if ($publicInvocation.cwd -cne $fixtureProject -or $publicInvocation.args.Count -ne 0) {
        throw 'The public boundary check must run in the fixture project root using the complete index mode.'
    }
    $env:TOOLCHAIN_TEST_PUBLIC_EXIT = '0'
    Write-TestFile (Join-Path $fixtureScripts 'validate-security.ps1') ($stageBody.Replace('exit 0', 'exit 31'))
    Assert-Run 'validation failure propagates and stops later stages' $orchestrator @('-HugoPath', $valid) 31 'validate-security failed with exit code 31'
    $observedStages = @(Get-Content -LiteralPath $stageLog)
    if (($observedStages -join ',') -ne 'validate-content,validate-security' -or (Test-Path -LiteralPath (Join-Path $fixtureProject 'build-invocation.json'))) {
        throw 'Validation failure must stop before subsequent checks and the production build.'
    }

    Write-TestFile (Join-Path $fixtureScripts 'validate-security.ps1') $stageBody
    Remove-Item -LiteralPath $stageLog
    $env:TOOLCHAIN_TEST_NODE_FAILURE = '1'
    Assert-Run 'Node regression failure stops the production build' $orchestrator @('-HugoPath', $valid) 1 'Production build script regression failed with exit code 1'
    if ((Test-Path -LiteralPath (Join-Path $fixtureProject 'build-invocation.json')) -or
        ((Get-Content -LiteralPath $stageLog) -join ',') -ne ($stageNames -join ',')) {
        throw 'A Node regression failure must stop the production build after the ordered PowerShell checks.'
    }
    $env:TOOLCHAIN_TEST_NODE_FAILURE = '0'
    foreach ($buildExit in @(37, 0)) {
        Remove-Item -LiteralPath $stageLog
        $env:TOOLCHAIN_TEST_BUILD_EXIT = [string]$buildExit
        $pattern = if ($buildExit -eq 0) { 'isolated production build passed' } else { 'Production build failed with exit code 37' }
        Assert-Run "production build exit $buildExit propagates" $orchestrator @('-HugoPath', $valid) $buildExit $pattern
        if (((Get-Content -LiteralPath $stageLog) -join ',') -ne ($stageNames -join ',')) {
            throw 'Every validation stage must run once, in order, before the production build.'
        }
        $invocation = Get-Content -LiteralPath (Join-Path $fixtureProject 'build-invocation.json') -Raw | ConvertFrom-Json
        if ($invocation.binary -cne $valid -or (Test-Path -LiteralPath $invocation.destination)) {
            throw 'The build must receive the resolved Hugo binary and its temporary output must be cleaned on both success and failure.'
        }
        if ([IO.File]::ReadAllText($formalFile) -cne 'existing output must be preserved') {
            throw 'The validation orchestrator changed existing public output.'
        }
    }
}
finally {
    $env:PATH = $originalPath
    [Environment]::SetEnvironmentVariable('TOOLCHAIN_TEST_BUILD_EXIT', $originalBuildExit, 'Process')
    [Environment]::SetEnvironmentVariable('TOOLCHAIN_TEST_NODE_FAILURE', $originalNodeFailure, 'Process')
    [Environment]::SetEnvironmentVariable('TOOLCHAIN_TEST_PUBLIC_EXIT', $originalPublicExit, 'Process')
    if (Test-Path -LiteralPath $temporaryRoot) {
        $resolved = [IO.Path]::GetFullPath($temporaryRoot)
        if (-not $resolved.StartsWith($temporaryParent, [StringComparison]::OrdinalIgnoreCase) -or
            (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-toolchain-test-[0-9a-f]{32}$') {
            throw "Refusing to remove unexpected toolchain fixture directory: $resolved"
        }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}

Write-Host "Hugo toolchain regression passed: $caseCount cases ($([Environment]::OSVersion.Platform))."
