# Power Shell Code Base

>set-location c:\     # To change the directory.

>get-childitem     # To get a listing of all the files in the directory.

>clear-host      # Similar to clear command

>get-alias     # Prints a bunch of alias command | alternatively you can use >gal 

>gal -Definition get-process     # For a specfic alias

>update-help -Force     # To update help

>get-verb     # To get all the verbs

>Get-EventLog -LogName System -Newest 3 -EntryType Error     # To get the newest event log data

>get-process | Export-Clixml -path .\temp1\good.xml
> notepad
> calc
> Compare-Object -ReferenceObject (Import-Clixml .\temp1\good.xml) -DifferenceObject (Get-Process) -Property name

>Get-Service | ConvertTo-Html -Property name,status
>Get-Service | ConvertTo-Html -Property name status | Out-File .\temp1\test.html
>.\temp1\test.html

>get-process | where handles -gt 999 | sort handles     # gets you all the process with handles greater than 999 sorted

>Get-ChildItem | select -Property name, length | sort -Property length     # another example

>Get-Service | gm     # get member will get all the properties

>Get-EventLog -LogName System -Newest 6 | select -Property EventID, TimeGenerated, Message | sort -Property TimeGenerated -Descending | ConvertTo-Html | out-file .\temp1\error.html

>get-service | where {$_.status -eq "Running"}     # Filtering for status alternatively $PSItem_.

>gps | where {$_.handles -ge 1000}

>gps | where handles -ge 1000      # also works

>gsv -Name BITS | select -Property name, status

>Get-ADComputer -Filter * | ForEach-Object {
    Get-Service -Name bits -ComputerName $_.Name -ErrorAction SilentlyContinue
}

>Get-WmiObject -Class win32_bios     # to get Bios info

>Get-ADComputer -filter * | select ExpandProperty name     # Gives out the name of the computer

>Get-WmiObject -Class win32_bios -ComputerName (Get-ADComputer -filter * | select ExpandProperty name)

>Get-WmiObject -Class win32_bios -ComputerName (Get-ADComputer -filter *).name 

>Get-ADComputer -filter * | get-wmiobject win32_beos -computerName, {$_.Name} 

>hostname
>ipconfig

>invoke-command -ComputerName dc, cq, c2 {get-eventlog -LogName System -new 3} | sort timewritten | format-table -Property timewritten, message -AutoSize

>Get-Volume

>get-psdrive      # it lists all the drives

>dir Cert:\CurrentUser -Recurse -CodeSigningCert -OutVariable a     # to get all the stored self signed certificates

>$cert = $a[0]

>Get-ExecutionPolicy

>set-ExecutionPolicy "allsigned"

>Set-AuthenticodeSignature -Certificate $cert -FilePath .\temp1\test.ps1        # This is to set the certificate for the file

>$myVar = "Hellooo"

>$myVar=Get-service bits
>$myVar | gm
>$myVar.status

>1..5>.\temp\test2.txt
>$(.\temp\test2.txt)

>$sessions=New-PSSession
>GetPSSessions

>$c = Get-Command get-process
>$c
>$c.Parameters
>$c.Parameters["Name"]

>Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
>Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" | Select @{n='freegb';e={$_.FreeSpace / 1gb -as [int]}}

>cat Env:\PSModulePath      # To get the module path
>$env:PSModulePath -split ";"