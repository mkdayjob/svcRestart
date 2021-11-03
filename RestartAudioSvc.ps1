# cmdlet to rest the audio service 
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
Clear-Host
echo check
gsv AudioSrv
echo restarting
Restart-Service -Name Audiosrv
echo recheck 
gsv AudioSrv
}
else {
    Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}

#run as admin wrapper cribbed from https://superuser.com/questions/1293170/launch-powershell-as-admin-when-double-click-on-ps1-file