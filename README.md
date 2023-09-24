# Monitor-Users-logs
<dl>
        <dt>📂 File1 : 'Domain Users logs into Domain Computers.ps1'</dt>
        <dd>This Powershell Script is made to Monitor whenever any Domain user login to any Domain Computer  
            
 through Group Policy Object (GPO) to write in log file that have the data similar to the following form :  </dd>
        
User      |         Action | Time                 | Computer   |   TimeCommandRun      
----      |         ------ | ----                 | --------   |   --------------      
Your-Domain\User1 | Logon  | 9/19/2023 8:30:48 AM | Computer1  |   9/19/2023 2:01:23 PM
</dl>
<dl>
        <dt>📂 File2 : 'Domain Users Logs on Computers 'with time limit'.ps1'</dt>
        <dd>This Powershell Script is the same as above file except that this code set a time limit
                
 if this User data is collected for example this month once then do not collect it again.</dd>
</dl>
