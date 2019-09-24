$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $env:COMPUTERNAME -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace

"Total Size in GB: "
[Math]::Round($disk.Size / 1GB)
"Free Space in GB: "
[Math]::Round($disk.FreeSpace / 1GB)

Pause
