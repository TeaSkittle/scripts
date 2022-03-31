:: =======================================================================
:: Author: Travis Dowd
:: Date: 12/23/2021
:: Description: Automatically set up virtual adapters for secondary NICs,
::              useful for setting up and testing routers.
:: =======================================================================
@ECHO OFF
CLS
COLOR 0F
SETLOCAL ENABLEDELAYEDEXPANSION
SET DefaultNIC=Ethernet 2
SET /A Index=1

:: Check if user is Admin
NET SESSION >NUL 2>&1
IF %errorLevel% == 0 (
	ECHO.
) ELSE (
	ECHO Must be ran as admin!
	ECHO.
	COLOR 0C
	PAUSE
	COLOR 0F
	EXIT /B 0
)

:: Set Adapter's IP info
netsh int ipv4 show interfaces
SET /p Adapter=Please enter network adapter name:
netsh interface ipv4 set address "%Adapter%" static 192.168.0.100 255.255.255.0

:: Set IP aliases
netsh interface ipv4 add address "%Adapter%" 192.168.0.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.1.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.2.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.3.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.4.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.8.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.11.100 255.255.255.0
netsh interface ipv4 add address "%Adapter%" 192.168.88.20 255.255.255.0

:: Exit 
ECHO Secondary NIC configured
ECHO.
PAUSE
COLOR 0F
EXIT /B 0
