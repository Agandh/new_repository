$cred = Get-Credential
$cso= New-CimSessionOption -SkipCACheck -SkipCNCheck -UseSsl
$cs = New-CimSession -ComputerName win16-ntms -Credential $cred -SessionOption $cso


configuration NewFile
{

import-module -name psdesiredstateconfiguration
      node win16-ntms  
      {
                file "Agandh-file" 
                {
                    DestinationPath = "c:\demo\hack1\agandh-file1.txt"
                    Contents = "DSC Configuration file"
                    DependsOn = "[file]agandhfolder"
                    type = "file" 
                }

                
                file agandhfolder
                {
                
                   DestinationPath = "c:\demo\hack1" 
                   type = {directory} 
                
                }




     }

}




NewFile

Update-DscConfiguration