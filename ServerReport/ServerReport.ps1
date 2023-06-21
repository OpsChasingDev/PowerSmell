# retrieve system name
$Name = $env:COMPUTERNAME

# operating system version
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion