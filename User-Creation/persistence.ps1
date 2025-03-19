$credentials= @{
    username = "foxtrot1"
    password = ConvertTo-SecureString "f0xtr0t_backup_PA55" -AsPlainText -Force
    username2 = "foxtrot2"
    password2 = ConvertTo-SecureString "f0xtr0t2_backup_PA55" -AsPlainText -Force
    username3 = "foxtrot3"
    password3 = ConvertTo-SecureString "f0xtr0t3_backup_PA55" -AsPlainText -Force
    username4 = "foxtrot4"
    password4 = ConvertTo-SecureString "f0xtr0t4_backup_PA55" -AsPlainText -Force
    username5 = "foxtrot5"
    password5 = ConvertTo-SecureString "f0xtr0t5_backup_PA55" -AsPlainText -Force
}
$credentials | Export-Clixml -Path C:\Windows\System32\fi-FI\credentials.xml
