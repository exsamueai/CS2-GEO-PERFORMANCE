@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Gashvit faili Administrator-is uflebit!
    pause
    exit /b
)
echo ===================================================
echo   System Cache & Junk Cleaner - Advanced Optimization
echo ===================================================
echo.
echo [1/12] Cleaning NVIDIA Shader Cache...
taskkill /F /IM nvcontainer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
del /f /s /q "%LocalAppData%\NVIDIA\DXCache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\NVIDIA\GLCache\*.*" >nul 2>&1
del /f /s /q "%AppData%\NVIDIA\ComputeCache\*.*" >nul 2>&1
del /f /s /q "%ProgramData%\NVIDIA Corporation\NV_Cache\*.*" >nul 2>&1
echo [2/12] Cleaning AMD Shader Cache...
del /f /s /q "%LocalAppData%\AMD\DxCache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\AMD\GLCache\*.*" >nul 2>&1
echo [3/12] Cleaning DirectX Shader Cache...
del /f /s /q "%LocalAppData%\D3DSCache\*.*" >nul 2>&1
echo [4/12] Cleaning System & User Temp Files...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
rmdir /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
echo [5/12] Cleaning Windows Prefetch...
del /f /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
echo [6/12] Cleaning Crash Dumps & Log Files...
del /f /s /q "%LocalAppData%\CrashDumps\*.*" >nul 2>&1
del /f /s /q "C:\Windows\MEMORY.DMP" >nul 2>&1
del /f /s /q "C:\Windows\Minidump\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Logs\*.*" >nul 2>&1
echo [7/12] Flushing DNS & Resetting Sockets...
ipconfig /flushdns >nul 2>&1
ipconfig /registerdns >nul 2>&1
netsh winsock reset >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*.*" >nul 2>&1
echo [8/12] Cleaning Gaming Platform Caches...
del /f /s /q "%LocalAppData%\Steam\htmlcache\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\EpicGamesLauncher\Saved\webcache\*.*" >nul 2>&1
echo [9/12] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo [10/12] Cleaning Delivery Optimization Cache...
del /f /s /q "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache\*.*" >nul 2>&1
echo [11/12] Cleaning Windows Font Cache...
net stop FontCache >nul 2>&1
del /f /s /q "%WinDir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" >nul 2>&1
net start FontCache >nul 2>&1
echo [12/12] Cleaning Explorer Thumbnail Cache...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul
del /f /s /q /a "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start explorer.exe
echo.
echo ===================================================
echo   SUCCESS! Advanced System Cache Cleaned Successfully!
echo ===================================================
echo.
pause
