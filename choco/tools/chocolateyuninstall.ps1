$ErrorActionPreference = 'Stop'

$packageName = 'simplecli'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir 'simplecli.exe'

# Remove the binary from the tools directory
Write-Host "Removing $exePath"
if (Test-Path $exePath) {
   Remove-Item -Path $exePath -Force
} else {
   Write-Host "$exePath does not exist."
}

# Remove from PATH
Write-Host "Uninstalling $packageName from PATH"
Uninstall-BinFile -Name 'simplecli'

Write-Host "$packageName has been uninstalled."