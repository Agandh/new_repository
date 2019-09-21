configuration NewFile
{

import-module -name psdesiredstateconfiguration
      node win-rahul  
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
Start-DscConfiguration -Path C:\NewFile -Wait -Verbose -Force