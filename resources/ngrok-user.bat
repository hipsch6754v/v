@echo off
diskperf -Y >nul
sc start audiosrv >nul
net user koolisw $Env:WINDOWS_USER_PASSWORD /add >nul
net localgroup administrators koolisw /add >nul
net user koolisw /active:yes >nul
echo All done! Connect your VM using RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo NGROK Services is not Running