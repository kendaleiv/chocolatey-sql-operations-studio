$packageName = "sql-operations-studio"
$url = "https://go.microsoft.com/fwlink/?linkid=862648"
$toolsDir = Get-ToolsLocation
$checksum = "4D3E50DC59EC863418B5C8C0647C96A9B13AB92C817B45DD0CD8405DB690471F"
$checksumType = "sha256"

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $toolsDir -Checksum $checksum -ChecksumType $checksumType

$shortcutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'SQL Operations Studio.lnk'
$targetPath = Join-Path -Path $toolsDir "sqlops-windows" | Join-Path -ChildPath "sqlops.exe"

Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $targetPath
