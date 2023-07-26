function Get-PowerSmell {
    param (
        $DriveLetter
    )
    # retrieve system info
    $Version = (Get-ComputerInfo | Select-Object OsVersion).OsVersion
    $Name = $env:COMPUTERNAME
    $DiskInstance = Get-CimInstance CIM_LogicalDisk 
    $DiskCount = $DiskInstance.Count
    $FreeSpace = ($DiskInstance | Where-Object {$_.DeviceID -eq $DriveLetter}).FreeSpace
    
    # make our own custom object
    $obj = [PSCustomObject]@{
        ComputerName = $Name
        OsVersion = $Version
        DiskCount = $DiskCount
        'GB Free' = [System.Math]::Round($FreeSpace / 1Gb, 2)
    }
    
    # show output
    Write-Output $obj
}