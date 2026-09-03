@echo off


:: Uninstall NVIDIA Telemetry and additional software
echo Uninstalling NVIDIA telemetry and additional software...
powershell -Command "Get-WmiObject -Query \"SELECT * FROM Win32_Product WHERE Name LIKE '%NVIDIA%Telemetry%'\" | ForEach-Object { $_.Uninstall() }"
powershell -Command "Get-WmiObject -Query \"SELECT * FROM Win32_Product WHERE Name LIKE '%NVIDIA%Update%'\" | ForEach-Object { $_.Uninstall() }"
powershell -Command "Get-WmiObject -Query \"SELECT * FROM Win32_Product WHERE Name LIKE '%NVIDIA%Control Panel%'\" | ForEach-Object { $_.Uninstall() }"

:: Remove NVIDIA Services
echo Removing unnecessary NVIDIA services...
sc stop "NvContainerLocalSystem"
sc delete "NvContainerLocalSystem"
sc stop "NvContainerNetworkService"
sc delete "NvContainerNetworkService"
sc stop "NvNetworkService"
sc delete "NvNetworkService"

:: Clean up leftover NVIDIA files
echo Cleaning up leftover NVIDIA files...
rd /s /q "C:\Program Files\NVIDIA Corporation"
rd /s /q "C:\Program Files (x86)\NVIDIA Corporation"
rd /s /q "%localappdata%\NVIDIA"
rd /s /q "%appdata%\NVIDIA"

:: Optionally, you might want to clean up the registry, but be very cautious with this.
:: This example just clears NVIDIA keys; make sure to back up your registry first.
echo Cleaning up NVIDIA registry keys...
reg delete "HKLM\SOFTWARE\NVIDIA Corporation" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\NVIDIA Corporation" /f

:: Notify user of completion
echo NVIDIA driver debloating tasks completed.
pause
