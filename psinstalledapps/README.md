#Powershell Task - Connect to Remote Server
## Installation
1. Clone Repo
##Run Script
```
.\installedapps.ps1
.\installedapps-registry.ps1
```
-registry script uses an advanced method described below
##Assumptions & Design Decisions
* Originally used the basic WMI method Get-WmiObject -Class Win32_Product
* For readability, restricted output to DisplayName, DisplayVersion, Publisher
* Research and testing showed that it did not capture every application correctly
* Changed method to pull directly from the uninstall registry keys Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
* Noticed that the registry pull had gaps. Some googling revealed that if some of the searched values were null that the output would not show
* Found an script at https://mcpmag.com/articles/2017/07/27/gathering-installed-software-using-powershell.aspx that demonstrated parsing each registry entry and try/catching on null values
* Second script has a modified version of that code which is more comprehensive
##Considerations
###Future Changes & Upgrades
* Change the output fields
* Output to file
* Parse installed software over a list of remote machines (as described in the link)
###Error Handling
* The output fields are catched and ignored if null
