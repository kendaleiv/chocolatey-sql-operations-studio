$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$pp = Get-PackageParameters
$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'sql-operations-studio'
  fileType       = 'EXE'
  url64bit       = 'https://go.microsoft.com/fwlink/?linkid=873386'

  softwareName   = 'SQL Operations Studio (preview)'

  checksum64     = '5E832491FDAFAD7FC279A214A3D13893202301D8D64505AB40CBE98D0DEDAC96'
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
