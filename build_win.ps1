param(
    [ValidateSet("amd64", "arm64")]
    [string]$Arch = "amd64",
    [ValidateSet("stable", "pre")]
    [string]$BuildEnv = "stable"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$pubCacheBin = if ($env:PUB_CACHE) {
    Join-Path $env:PUB_CACHE "bin"
} else {
    Join-Path $env:LOCALAPPDATA "Pub\Cache\bin"
}
if (Test-Path $pubCacheBin) {
    $env:PATH = "$env:PATH;$pubCacheBin"
}

foreach ($cmd in @("dart", "flutter", "go", "cargo")) {
    if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Error "missing dependency: $cmd"
    }
}

dart ./setup.dart windows --arch $Arch --env $BuildEnv

Write-Host ""
Write-Host "dist/:"
Get-ChildItem dist -ErrorAction SilentlyContinue | Format-Table Name, @{ Label = "SizeMB"; Expression = { [math]::Round($_.Length / 1MB, 1) } }
