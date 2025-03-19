#!/bin/bash

# Generates SSH keys for IPs to prevent needing to ssh to an ip before running sshpass. Also removes any present keys to avoid conflicts.
ssh-keygen -R 10.10.1.1
ssh-keyscan -H 10.10.1.1 >> ~/.ssh/known_hosts

#testing
#ssh-keygen -R 192.168.178.102
#ssh-keyscan -H 192.168.178.102 >> ~/.ssh/known_hosts
#sshpass -p "test" ssh LCoramar@192.168.178.102 'powershell "New-LocalUser -Name "test1" -Password (ConvertTo-SecureString "test" -AsPlainText -Force)"; "echo test1 > \system32\Grey-team\logbook.txt"; shutdown /r /t 0'

# Uses sshpass to ssh to an IP using the default provided password and executes a powershell command to change the password.
sshpass -p "Guard!an_7th" ssh CAgrupnin@10.10.1.1 'powershell "Set-LocalUser -Name "CAgrupnin" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > \system32\Grey-team\logbook.txt"; shutdown /r /t 0'
sshpass -p "alchemist" ssh artificer@10.10.1.1 'powershell "Set-LocalUser -Name "artificer" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > \system32\Grey-team\logbook.txt"; shutdown /r /t 0'
