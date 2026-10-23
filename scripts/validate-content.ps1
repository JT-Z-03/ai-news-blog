param([string]$ContentPath = (Join-Path $PSScriptRoot '../content/posts'))
$ErrorActionPreference = 'Stop'
& node (Join-Path $PSScriptRoot 'content-validation.mjs') $ContentPath
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
