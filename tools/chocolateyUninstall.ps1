$toolsDir = Get-ToolsLocation
$dir = Join-Path $toolsDir "sqlops-windows"

Remove-Item $dir -Recurse

$shortcutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'SQL Operations Studio.lnk'
If (Test-Path $shortcutPath) {
  Remove-Item $shortcutPath
}
