#!/bin/bash

# Generates SSH keys for IPs to prevent needing to ssh to an ip before running sshpass. Also removes any present keys to avoid conflicts.
ssh-keygen -R 10.10.2.1
ssh-keyscan -H 10.10.2.1 >> ~/.ssh/known_hosts

#testing
#ssh-keygen -R 192.168.178.102
#ssh-keyscan -H 192.168.178.102 >> ~/.ssh/known_hosts
#sshpass -p "test1" ssh LCoramar@192.168.178.102 'powershell "New-LocalUser -Name "test2" -Password (ConvertTo-SecureString "test" -AsPlainText -Force)"; "echo test2 > /system32/Grey-team/logbook.txt"; shutdown /r /t 0'

#Uses sshpass to ssh to an IP using the default provided password and executes a powershell command to change the password.
sshpass -p "@rchitect_@rcane" ssh LCoramar@10.10.2.1 'powershell "Set-LocalUser -Name "LCoramar" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > /system32/Grey-team/logbook.txt"; shutdown /r /t 0'
sshpass -p "ghostslayer" ssh bloodhunter@10.10.2.1 'powershell "Set-LocalUser -Name "bloodhunter" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > \system32\Grey-team\logbook.txt"; shutdown /r /t 0'
