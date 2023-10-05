# Monitor-Users-logs
<dl>    
        <picture>
          <img alt="Monitor logs on Domain computers" src="https://i.imgur.com/jn2p7Mj.png">
        </picture>    
        <dt>📂 File1 : 'Domain Users logs into Domain Computers.ps1'</dt>
        <dd>This Powershell Script is made to Monitor whenever any Domain user logon to any Domain Computer  
            
 through Group Policy Object (GPO) to write in log file that have the data similar to the following form :  </dd>
        
User      |         Action | Time                 | Computer   |   TimeCommandRun      
----      |         ------ | ----                 | --------   |   --------------      
Your-Domain\User1 | Logon  | 9/19/2023 8:30:48 AM | Computer1  |   9/19/2023 2:01:23 PM
</dl>

> [!NOTE]<br>
> You MUST edit the script by your values of those variables :<br><br>
> $srv_Directory : &ensp; server IP Address or Server Name, Where you put your logs files.<br>
> $logfile :  &ensp; The Log Path, The Log file.<br>

<dl>
        <dt>📂 File2 : 'Domain Users Logs on Computers 'with time limit'.ps1'</dt>
        <dd>This Powershell Script is the same as above file except that this code set a time limit <em>for example :</em>
                
 if this User data was collected this month once, Then do not collect it again.</dd>
</dl>


<dd> 📄 Note : This Code only collect Domain Users Logs on Domain Computers,

&ensp; &ensp; &ensp; &ensp; &ensp; &ensp;Not from computers outside the Domain.</dd>

📜 Credits : 
