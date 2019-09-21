Get-Module -ListAvailable #check all three paths
get-module              # shows modeules in memory
$env:PSModulePath 

Find-Module PackageManagement
find-module vmware*,azure*
install-module PackageManagement
get-help Get-CimInstance -Full

Get-DscResource

Get-CimInstance -namespace root/microsoft/windows -ClassName __NAMESPACE
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_* | fw 
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_DSCmetaconfiguration
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_* | select -ExpandProperty 

Get-DscLocalConfigurationManager

Get-DscResource -Name service -Syntax
Get-DscResource -Name file -Syntax
Get-DscResource -Name *fea* -Syntax


Service [String] #ResourceName
{
    Name = [string]
    [BuiltInAccount = [string]{ LocalService | LocalSystem | NetworkService }]
    [Credential = [PSCredential]]
    [Dependencies = [string[]]]
    [DependsOn = [string[]]]
    [Description = [string]]
    [DisplayName = [string]]
    [Ensure = [string]{ Absent | Present }]
    [Path = [string]]
    [PsDscRunAsCredential = [PSCredential]]
    [StartupType = [string]{ Automatic | Disabled | Manual }]
    [State = [string]{ Running | Stopped }]
}

