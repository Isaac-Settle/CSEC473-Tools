#!/bin/bash

# Generates SSH keys for IPs to prevent needing to ssh to an ip before running sshpass. Also removes any present keys to avoid conflicts.
ssh-keygen -R 10.10.4.1
ssh-keyscan -H 10.10.4.1 >> ~/.ssh/known_hosts

#testing
#ssh-keygen -R 192.168.178.102
#ssh-keyscan -H 192.168.178.102 >> ~/.ssh/known_hosts
#sshpass -p "test" ssh LCoramar@192.168.178.102 'powershell "New-LocalUser -Name "test4" -Password (ConvertTo-SecureString "test" -AsPlainText -Force)"; "echo test4 > /system32/Grey-team/logbook.txt"; shutdown /r /t 0'

# Uses sshpass to ssh to an IP using the default provided password and executes a powershell command to change the password.
sshpass -p "B3tray3r_Gods" ssh VChloras@10.10.4.1 'powershell "Set-LocalUser -Name "VChloras" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > /system32/Grey-team/logbook.txt"; shutdown /r /t 0'
sshpass -p "wild-magic" ssh sorcerer@10.10.4.1 'powershell "Set-LocalUser -Name "sorcerer" -Password (ConvertTo-SecureString "f0xtr0t_w1nd0ws_PA55" -AsPlainText -Force)"; "echo Vanguard > /system32/Grey-team/logbook.txt"; shutdown /r /t 0'
