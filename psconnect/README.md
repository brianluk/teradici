# Powershell Task - Connect to Remote Server
## Installation
1. Clone Repo
## Run Script
```
.\remoteexecute <FQDN> <Command>
```
## Example
```
.\remoteexecute <FQDN> "Get-TimeZone"
```
## Assumptions & Design Decisions
* FQDN is a remote computer with remote powershell enabled
* Command is any scriptblock command that can be run on Windows Machine
* Credentials are provided through interactive shell to not expose password
## Considerations
### Future Changes & Upgrades
* Make it so the username is passed from script parameter to fill in credential pop up
* Pass both username and password via command line in plain text
* Ability to detect whether the machine accepts SSH connections and run linux commands
### Error Handling
* Expand on types of errors that could occur
* Check FQDN input is valid (eg. regex for valid FQDN)
