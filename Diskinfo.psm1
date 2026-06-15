<#
.Synopsis
This is the short explanation
.Description
This is the long description
.Parameter ComputerName
This is for remote computers
.Example
Diskinfo -computername remote
This is for a remote computers
#>
function Get-diskinfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$ComputerName
    )

    Get-CimInstance -ComputerName $ComputerName -Class Win32_LogicalDisk -Filter "DeviceID='C:'" | 
        Select-Object @{Name='FreeGB'; Expression={$_.FreeSpace / 1GB -as [int]}}
}