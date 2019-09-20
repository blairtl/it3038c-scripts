function getIP{
    (Get-NetIPAddress).ipv4address | Select-String "192*"
}
$IP = getIP


function getHost{
    ($env:ComputerName)
}
$getHostName = getHost


function getUser{
    ($env:USERNAME)
}
$User = getUser


function getDate{
    (Get-Date)
}
$Date = getDate


function getVersion{
    ($Host.Version.Major)
}
$Version = getVersion


$BODY = "This machine's IP is $IP. This machine's Hostname is $getHostName. This machine's user is $User. Today's date is $Date. This machine's Powershell version is $Version."
Write-Host("$BODY")

$smtpCred = (Get-Credential)
$ToAddress = 'blairtl@mail.uc.edu'
$FromAddress = 'tylerlb14@gmail.com'
$SmtpServer = 'smtp.gmail.com'
$SmtpPort = '587'

$mailParam =@{
    To = $ToAddress
    From = $FromAddress
    Subject = 'IT3038C Windows Sysinfo'
    Body = $Body
    SmtpServer = $SmtpServer
    Port = $SmtpPort
    Credential = $smtpCred
}

Send-MailMessage @mailparam -UseSsl