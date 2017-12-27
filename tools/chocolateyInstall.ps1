$packageName = "sql-operations-studio"
$url = "https://go.microsoft.com/fwlink/?linkid=865305"
$fileType = "exe"
$silentArgs = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
$checksum = "BBD79D4E5C46FE439ED2FA9C74782ECA08B38290B66DC7DAA57C6E558B9295F5"
$checksumType = "sha256"

Install-ChocolateyPackage -PackageName $packageName -FileType $fileType -SilentArgs $silentArgs -Url $url -Checksum $checksum -ChecksumType $checksumType
