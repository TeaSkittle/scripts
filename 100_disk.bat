:: ==================================================================================
:: Author: Travis Dowd
:: Date: 12-22-2020   
::
:: Description: Fix Disk running at 100% usage in Windows 10
::
:: ==================================================================================
@ECHO OFF
CLS
SETLOCAL EnableDelayedExpansion
COLOR 0F
:: Check for admin rights
NET SESSION >NUL 2>&1
IF %errorLevel% == 0 (
    ECHO.
) ELSE (
    COLOR 0C
    ECHO Run as Admin!
    PAUSE
    COLOR 0F
    EXIT /B 0
)
:: Disable services
net stop "Windows search"
net stop superfetch
net stop w32time
w32tm /unregister
w32tm /register
net start w32time
sc config wuauserv  start=auto
sc config w32time   start=auto
sc config bits      start=auto
sc config cryptsvc  start=auto
sc config trustedinstaller start= auto
sc config superfetch start=disabled
sc config "Windows search" start=disabled
:: Delete temp files
del /f /s /q %temp%  
:: Check and fix disk errors
wmic diskdrive get status
sfc /scannow
chkdsk /f /r
defrag c: /u /v  
:: Set power plan to "High Performance"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
:: Disable Windows tips
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /t REG_DWORD /v SubscribedContent-338389Enabled /d 0 /f
:: Configure virtual memory
wmic pagefile list /format:list
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=true 
:: Restart machine
shutdown /r /t 00
