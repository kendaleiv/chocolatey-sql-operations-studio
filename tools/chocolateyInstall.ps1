$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$pp = Get-PackageParameters
$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'sql-operations-studio'
  fileType       = 'EXE'
  url64bit       = 'https://go.microsoft.com/fwlink/?linkid=2013365'

  softwareName   = 'SQL Operations Studio (preview)'

  checksum64     = '7C534CA495D85C5F7A3D5F98A4B985D4A5E38972204CAEA2F14C7433CFB414D6'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\sql-operations-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Remove https://chocolatey.org/packages/sql-operations-studio/0.23.6 if installed
$toolsDir = Get-ToolsLocation
$dir = Join-Path $toolsDir "sqlops-windows"

if (Test-Path $dir) {
  Remove-Item $dir -Recurse
}

$shortcutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'SQL Operations Studio.lnk'
If (Test-Path $shortcutPath) {
  Remove-Item $shortcutPath
}
