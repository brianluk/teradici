param (
    [Parameter(Mandatory=$true)][string]$fqdn,
    [Parameter(Mandatory=$true)][string]$command,
    [System.Management.Automation.PSCredential]$Credential    
);

$errorActionPreference = 'Stop' 

#$pass = ConvertTo-SecureString -String $password -AsPlainText -Force;
#$mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username,$pass;

If (Test-Connection $fqdn -Count 1 -Quiet){
    Try {
        $s = New-PSSession -ComputerName $fqdn -Credential $credential
        Try {
            $scriptblock = [scriptblock]::Create($command)
            Invoke-Command -Session $s -ScriptBlock $scriptblock
            Exit-PSSession
        } Catch {
            Write-Error "Remote command could not be run"
            Exit-PSSession
        }

    } Catch {
        Write-Error "Unable to connect to remote system $($fqdn)"
    }
}
Else {
    Write-Error "Computer $($fqdn) cannot by reached or does not exist"
}