Set-ExecutionPolicy RemoteSigned 
$UserCredential=Get-Credential
$s=New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -credential $UserCredential -Authentication Basic -AllowRedirection
import-PSSession -session $s
Connect-MsolService -Credential $UserCredential
Write-host "Prepared MSOL Login"
$email=Read-Host "Enter the email id for which Archive Auto Expand is to be activated :: "
Enable-Mailbox $email -AutoExpandingArchive
Write-Host " Checking if Auto Expanding is enabled for " $email
Get-Mailbox $email | FL AutoExpandingArchiveEnabled