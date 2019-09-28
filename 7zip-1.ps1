Configuration myChocoConfig
{
   Import-DscResource -Module cChoco
   Node "localhost"
   {
      LocalConfigurationManager
      {
          DebugMode = 'ForceModuleImport'
      }
      cChocoInstaller installChoco
      {
        InstallDir = "c:\choco"
      }
      
      cChocoPackageInstallerSet installSomeStuff
      {
         Ensure = 'Present'
         Name = @(
            "7zip"
        )
         
      }
         
      }
   }


myChocoConfig
$secpasswd = ConvertTo-SecureString "ntms" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ("administrator", $secpasswd)

$client="ntmspc-9"
$cimSessionOption = New-CimSessionOption -UseSsl -SkipCACheck -SkipCNCheck
$cimSession = New-CimSession -SessionOption $cimSessionOption -ComputerName $client -Port 5986  -Credential $Cred -Verbose



Start-DscConfiguration .\myChocoConfig -wait -Verbose -force
clienthostfile -OutputPath C:\Clientconfig

Copy-Item -Path C:\Users\Administrator\Desktop\Rahul\powerdsc\myChocoConfig\localhost.mof -Destination "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration\ClientConfig.mof" -Force
New-DscChecksum -Path "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration\ClientConfig.mof" -OutPath "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration" -Force
ClientLCMConfiguration -RegistrationKey $regkey -ServerName $dscserver -Nodename $client -OutputPath $ClientConfig\TargetNodes 

Publish-ModuleToPullServer -Name cchoco -OutputFolderPath "C:\Program Files\WindowsPowerShell\DscService\Modules" -ModuleBase "C:\Program Files\WindowsPowerShell\Modules\cchoco\2.4.0.0" -Version 2.4.0.0 

Set-DscLocalConfigurationManager -Path "$ClientConfig\TargetNodes" -CimSession $cimSession -Verbose

Update-DscConfiguration -CimSession $cimSession -Verbose -Wait -Debug