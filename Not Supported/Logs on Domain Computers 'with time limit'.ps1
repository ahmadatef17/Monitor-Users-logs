<# God Willing, this program will Bring Computer Last 10 Users Accessed Active Computer #>
<# God Willing, this will be used in GPMC, (Find Active, Apply program) #>

<# Variables Declaration #>
$curr_month = [datetime]::now.tostring("yyyy-MM")                       <# Variable Contain Current date 'Only' year-Month #>
$koko 		= $Env:ComputerName				        <# Variable Contain Computer Name #>
$yoyo 		= $Env:UserName                                         <# Variable Contain User Name #>
$srv_Directory 	= "192.168.24.157"				        <# Variable Contain server address, Where you put your logs files #>
$logfile 	= "\\$srv_Directory\D$\logs\Users_logs_$curr_month.txt"	<# Variable Contain Log file path #>
$flagfile 	= "\\$srv_Directory\D$\logs\Users_$curr_month.txt"	<# Variable Contain flags file path #>
$no_of_logons 	= 1						        <# number of logon and logoff you want to get collect, put whatever number you want #>

<# if flags file does not exsist, create it #>
if(!(Test-Path $flagfile))
{ New-Item -ItemType "file" -Path $flagfile }

[bool] $compFlagVal = 0						<# Boolean (True,False) Variable to tell that this computer is already on our log file #>
$compFlagStr 	= Select-String -Path $flagfile -pattern $yoyo	<# Variable to search in flags file for the word and print it if exist #>

<# If My flag file Contains that ComputerName to print "True" ~ 1 or "false" ~ 0 #>
if($NULL -eq $compFlagStr){ 
<# if $comFlagStr == $NULL then Computer Name "Not Found" in flagfile #>
$compFlagVal=0}
else{$compFlagVal=1}

<# Work on the Computers "Not Found" in flagfile #>
if(!($compFlagVal)){
Get-WinEvent -Computer "$koko" -FilterHash @{LogName='system';providername='Microsoft-Windows-Winlogon'} -MaxEvents $no_of_logons |
Select-Object @{n="User";e={(New-Object System.Security.Principal.SecurityIdentifier $_.Properties.Value[1]).Translate([System.Security.Principal.NTAccount])}},@{n="Action";e={if($_.ID -eq 7001) {"Logon"} else {"Logoff"}}},@{n="Time";e={$_.timecreated}},@{n="Computer";e={$koko}},@{n="TimeCommandRun";e={(Get-Date).ToString()}} | Format-Table -Wrap -AutoSize >> $logfile
$yoyo >> $flagfile }
