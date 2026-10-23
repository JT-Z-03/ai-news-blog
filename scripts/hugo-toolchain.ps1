function Resolve-HugoExecutable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$ProjectRoot,
        [string]$HugoPath
    )

    $root = (Resolve-Path -LiteralPath $ProjectRoot -ErrorAction Stop).Path
    $versionFile = Join-Path $root '.hugo-version'
    if (-not (Test-Path -LiteralPath $versionFile -PathType Leaf)) {
        throw "Missing Hugo version file: $versionFile"
    }
    $expectedVersion = [IO.File]::ReadAllText($versionFile).Trim()
    if ($expectedVersion -notmatch '^\d+\.\d+\.\d+$') {
        throw "Invalid Hugo version in ${versionFile}: expected an exact version such as 0.162.0."
    }

    $candidate = $null
    if (-not [string]::IsNullOrWhiteSpace($HugoPath)) {
        if (Test-Path -LiteralPath $HugoPath -PathType Leaf) {
            $candidate = (Resolve-Path -LiteralPath $HugoPath).Path
        }
        else {
            $command = Get-Command -Name $HugoPath -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($command) { $candidate = $command.Source }
        }
        if (-not $candidate) { throw "Explicit Hugo executable not found: $HugoPath" }
    }
    else {
        $localNames = if ($IsWindows) { @('hugo.exe', 'hugo') } else { @('hugo') }
        foreach ($name in $localNames) {
            $localPath = Join-Path $root $name
            if (Test-Path -LiteralPath $localPath -PathType Leaf) {
                $candidate = $localPath
                break
            }
        }
        if (-not $candidate) {
            $command = Get-Command -Name hugo -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($command) { $candidate = $command.Source }
        }
        if (-not $candidate) {
            throw "Hugo Extended $expectedVersion was not found. Install it on PATH or pass -HugoPath."
        }
    }

    $versionLines = & $candidate version 2>&1
    $versionExit = $LASTEXITCODE
    $versionOutput = ($versionLines | Out-String).Trim()
    if ($versionExit -ne 0) {
        throw "Hugo version check failed (exit $versionExit) for ${candidate}: $versionOutput"
    }
    $versionMatch = [regex]::Match($versionOutput, '(?m)^hugo v(?<version>[^\s+]+)(?<features>(?:\+[^\s+]+)*)\s')
    # Official stable binaries may append their Git commit before +extended.
    $actualVersion = $versionMatch.Groups['version'].Value -replace '-[0-9a-f]{7,40}$', ''
    if (-not $versionMatch.Success -or $actualVersion -cne $expectedVersion) {
        throw "Hugo version mismatch: expected $expectedVersion from .hugo-version; found '$versionOutput' at $candidate."
    }
    if (($versionMatch.Groups['features'].Value -split '\+') -notcontains 'extended') {
        throw "Hugo Extended $expectedVersion is required; found a non-Extended binary at $candidate."
    }
    return $candidate
}
