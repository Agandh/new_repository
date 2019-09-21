configuration Filecopying
{

import-module -name psdesiredstateconfiguration
                node win-rahul  {
                file "Agandh-file" {
                    DestinationPath = "c:\demo\agandh-file.txt"
                    Contents = "DSC Configuration file"
                    
                                }


                                    }

}


Filecopying
Update-DscConfiguration -





File [String] #ResourceName
{
    DestinationPath = [string]
    [Attributes = [string[]]{ Archive | Hidden | ReadOnly | System }]
    [Checksum = [string]{ CreatedDate | ModifiedDate | SHA-1 | SHA-256 | SHA-512 }]
    [Contents = [string]]
    [Credential = [PSCredential]]
    [DependsOn = [string[]]]
    [Ensure = [string]{ Absent | Present }]
    [Force = [bool]]
    [MatchSource = [bool]]
    [PsDscRunAsCredential = [PSCredential]]
    [Recurse = [bool]]
    [SourcePath = [string]]
    [Type = [string]{ Directory | File }]
}


 Filecopying

 Get-DscResource folder