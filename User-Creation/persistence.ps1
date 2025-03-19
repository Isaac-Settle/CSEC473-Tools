$credentials= @{
    username = "foxtrot1"
    password = ConvertTo-SecureString "Password" -AsPlainText -Force
    username2 = "foxtrot2"
    password2 = ConvertTo-SecureString "Password" -AsPlainText -Force
    username3 = "foxtrot3"
    password3 = ConvertTo-SecureString "Password" -AsPlainText -Force
    username4 = "foxtrot4"
    password4 = ConvertTo-SecureString "Password" -AsPlainText -Force
    username5 = "foxtrot5"
    password5 = ConvertTo-SecureString "Password" -AsPlainText -Force
}
$credentials | Export-Clixml -Path C:\Windows\System32\fi-FI\credentials.xml