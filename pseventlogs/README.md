#Powershell Task - Connect to Remote Server
## Installation
1. Clone Repo
##Run Script
```
.\savelogs.ps1
```
##Assumptions & Design Decisions
* Saves system logs to csv instead of text file for readability
* Example only captures yesterday's System logs for faster testing
##Considerations
###Future Changes & Upgrades
* Allow command line parameters to specify which logs and date range
* Possibly allow for all logs for all time and clean logs
###Error Handling
* No error handling is built in as it only runs a single command
* Error handling could be introduced to capture better error messages and or parameter filtering
