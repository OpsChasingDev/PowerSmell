# FOR NEXT CLASS 
<#
- review people's scripts and see what they've added
- modify the 'GB Free' property to operate only on the system drive
- modify the script to reuse the operation for Get-CimInstance CIM_LogicalDisk
#>

# retrieve system info
$Name = $env:COMPUTERNAME
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
$DiskCount = (Get-CimInstance CIM_LogicalDisk).count
$FreeSpace = (Get-CimInstance CIM_LogicalDisk | Where-Object {$_.DeviceID -eq 'C:'}).FreeSpace

# make our own custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name
    OsVersion = $Version
    DiskCount = $DiskCount
    'GB Free' = $FreeSpace / 1Gb
}

# show output
Write-Output $obj