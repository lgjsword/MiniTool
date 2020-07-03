@echo off 
echo Start setting up IE proxy
::proxy ip & port
set ie_proxy=192.168.100.211:7890
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "%ie_proxy%" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "localhost;127.*;10.*;172.16.*;172.17.*;172.18.*;172.19.*;172.20.*;172.21.*;172.22.*;172.23.*;172.24.*;172.25.*;172.26.*;172.27.*;172.28.*;172.29.*;172.30.*;172.31.*;172.32.*;192.168.*;<local>" /f
ipconfig /flushdns  
start "" "C:\Program Files\Internet Explorer\iexplore.exe"  
taskkill /f /im iexplore.exe  
echo Proxy setting is completed, press any key to close.
pause>nul