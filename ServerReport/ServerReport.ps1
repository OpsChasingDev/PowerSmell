# FOR NEXT CLASS 
<#
- review people's scripts and see what they've added
- modify the 'GB Free' property to operate only on the system drive
- modify the script to reuse the operation for Get-CimInstance CIM_LogicalDisk
#>

# retrieve system info
$Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
$Name = $env:COMPUTERNAME
$DiskInstance = Get-CimInstance CIM_LogicalDisk 
$DiskCount = $DiskInstance.ComputerName
$FreeSpace = ($DiskInstance | Where-Object {$_.DeviceID -eq 'C:'}).FreeSpace

# make our own custom object
$obj = [PSCustomObject]@{
    ComputerName = $Name
    OsVersion = $Version
    DiskCount = $DiskCount
    'GB Free' = [System.Math]::Round($FreeSpace / 1Gb, 2)
}

# show output
Write-Output $obj