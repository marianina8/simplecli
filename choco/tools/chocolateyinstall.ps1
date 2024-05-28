$ErrorActionPreference = 'Stop'

$packageName = 'simplecli'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$binRoot = Get-ToolsLocation

# Use the package version from Chocolatey's environment variable
$packageVersion = $env:chocolateyPackageVersion

# Define the URL for the binary package dynamically
$url = "https://github.com/marianina8/simplecli/releases/download/$packageVersion/simplecli_Windows_x86_64.zip"

# Define the file paths
$zipPath = Join-Path $toolsDir 'simplecli-windows-x86-64.zip'
$exePath = Join-Path $toolsDir 'simplecli.exe'

# Download the zip file
Write-Host "Downloading $url to $zipPath"
Invoke-WebRequest -Uri $url -OutFile $zipPath

# Unzip the file
Write-Host "Unzipping $zipPath to $toolsDir"
Get-ChocolateyUnzip -FileFullPath $zipPath -Destination $toolsDir

# Move the binary to the tools directory
Write-Host "Moving simplecli.exe to $toolsDir"
Move-Item -Path (Join-Path $toolsDir 'simplecli.exe') -Destination $exePath

# Remove the zip file
Write-Host "Removing $zipPath"
Remove-Item -Path $zipPath

# Add to PATH
Install-BinFile -Name 'simplecli' -Path $exePath

Write-Host "$packageName has been installed."
