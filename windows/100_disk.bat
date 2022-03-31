:: ==================================================================================
:: Author: Travis Dowd
:: Date: 12-22-2020   
::
:: Description: Fix disk running at 100% usage in Windows 10
::  A hacky solution to temporarily fix the issue:
::   1. Place script at C:\100_disk.bat
::   2. Create shorcut to script and force admin: https://www.cnet.com/how-to/always-run-a-program-in-administrator-mode-in-windows-10/
::   3. Place shortcut in shell:startup
:: ==================================================================================
@ECHO OFF
:: Disable services
net.exe stop superfetch
sc config superfetch start=disabled
net.exe stop "Windows search"
sc config "WSearch" start=disabled
sc stop "WSearch"
net.exe stop "DiagTrack"
sc config "DiagTrack" start=disabled
sc stop "DiagTrack"
net.exe stop "wuauserv"
sc config "wuauserv" start=disabled
sc stop "wuauserv"
net.exe stop "BITS"
sc config "BITS" start=disabled
sc stop "BITS"
