<# God Willing, this program will Bring Computer Last User Accessed Active Computer #>
<# God Willing, this will be used in GPMC, (Find Active, Apply program) #>

<# Variables Declaration #>
$koko 		= $Env:ComputerName				<# Variable Contain Computer Name #>
$srv_Directory 	= "192.168.24.157"				<# Variable Contain server address, Where you put your logs files #>
$logfile 	= "\\$srv_Directory\D$\logs\PC_logs.txt"	<# Variable Contain Log file path #>
$no_of_logons 	= 1						<# number of logon and logoff you want to get collect, put whatever number you want #>

<# Work on the Computers "Not Found" in flagfile #>
Get-WinEvent -Computer "$koko" -FilterHash @{LogName='system';providername='Microsoft-Windows-Winlogon'} -MaxEvents $no_of_logons |
Select-Object @{n="User";e={(New-Object System.Security.Principal.SecurityIdentifier $_.Properties.Value[1]).Translate([System.Security.Principal.NTAccount])}},@{n="Action";e={if($_.ID -eq 7001) {"Logon"} else {"Logoff"}}},@{n="Time";e={$_.timecreated}},@{n="Computer";e={$koko}},@{n="TimeCommandRun";e={(Get-Date).ToString()}} | Format-Table -Wrap -AutoSize >> $logfile
$koko >> $flagfile
