@echo off
:: ====================================
:: Close all open windows
:: ====================================
Powershell.exe -Command "Get-Process | Where-Object {$_.MainWindowTitle -ne ''} | stop-process"
pause