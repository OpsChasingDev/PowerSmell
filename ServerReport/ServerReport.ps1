# retrieve system name
$Name = $env:COMPUTERNAME

# operating system version
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion

# logical disk count
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count