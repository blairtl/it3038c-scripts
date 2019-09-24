﻿Get-WmiObject -ComputerName $ComputerName -Namespace "root\cimv2" -Class "win32_logicaldisk" -Filter "DriveType = 3" | Select-Object -Property @{Name="Drive";Expression={$_.DeciveID}},@{Name="Free Space in GB";Expression="{0:N2}" -f ($_.FreeSpace / 1GB}}, @Name="Total Size in GB";Expression="{0:N2}" -f ($_.Size / 1GB)}} | FT -Auto