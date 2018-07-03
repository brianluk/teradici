$Paths  = @("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall","SOFTWARE\\Wow6432node\\Microsoft\\Windows\\CurrentVersion\\Uninstall")         
ForEach($Path in $Paths) { 
   
    $reg=[microsoft.win32.registrykey]::OpenRemoteBaseKey('LocalMachine',$Computer,'Registry64') 
    $regkey=$reg.OpenSubKey($Path)  
    $subkeys=$regkey.GetSubKeyNames()      

    ForEach ($key in $subkeys){   
        $thisKey=$Path+"\\"+$key 
        $thisSubKey=$reg.OpenSubKey($thisKey)   
        $DisplayName =  $thisSubKey.getValue("DisplayName")
        If ($DisplayName  -AND $DisplayName  -notmatch '^Update  for|rollup|^Security Update|^Service Pack|^HotFix') {
            $Publisher = Try {
                $thisSubKey.GetValue('Publisher')
            } Catch {
                $thisSubKey.GetValue('Publisher')
            }
            $Version = Try {
                $thisSubKey.GetValue('DisplayVersion')
            } Catch {
                $thisSubKey.GetValue('DisplayVersion')
            }
            $Object = [pscustomobject]@{
                DisplayName = $DisplayName
                Version  = $Version
                Publisher = $Publisher
            }
            Write-Output $Object
        }
    }
    $reg.Close()    
 }
    
                      
