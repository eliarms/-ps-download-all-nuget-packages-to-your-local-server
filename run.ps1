# PowerShell Script to download all nuget feeds to a custom repository
# Author: Emmanuel Eliason-Armstrong
# Github: https://github.com/eliarms  Linkedin: https://www.linkedin.com/in/eliasonarmstrong/
$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = "$PSScriptRoot\nuget.exe"

#Verify that nuget is install on the machine
write-host "Checking nuget.exe  Intallation"
if(![System.IO.File]::Exists($targetNugetExe))
{
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
}
else
{
    write-host "Nuget.exe os already installed."
}
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

#Execute nuget restore
nuget restore packages.config
