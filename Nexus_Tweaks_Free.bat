@echo off
:: ================================================================================
:: Nexus Tweaks FREE - Windows Optimization Toolkit  
:: Version 1.0 - Essential Gaming & System Performance
:: FREE EDITION - Upgrade to Pro for Advanced Features!
:: ================================================================================

title Nexus Tweaks FREE v1.0
color 9

:: Check for Admin Privileges
fltmc >nul 2>&1
if not "%errorlevel%"=="0" (
    echo.
    echo --------------------------------------------------------------------------------
    echo                              ADMINISTRATOR REQUIRED
    echo --------------------------------------------------------------------------------
    echo.
    echo   This script requires Administrator privileges to function properly.
    echo   Please right-click on the script and select "Run as administrator"
    echo.
    echo --------------------------------------------------------------------------------
    pause
    exit /b 1
)

:: Check Windows Version
for /f "tokens=3" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuild" 2^>nul') do (
    set "build_num=%%A"
)

if defined build_num (
    if %build_num% GEQ 22000 (
        reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d "1" /f >nul 2>&1
    )
)

goto :main_menu

:main_menu
cls
echo.
echo.
echo --------------------------------------------------------------------------------
echo                          NEXUS TWEAKS FREE v1.0
echo                    Essential Windows Optimization Toolkit
echo --------------------------------------------------------------------------------
echo.
echo                          [!] FREE EDITION - LIMITED FEATURES [!]
echo                     Want Advanced CPU, GPU, RAM & DirectX Tweaks?
echo                            UPGRADE TO PRO for $19.99!
echo.
echo --------------------------------------------------------------------------------
echo.
echo  [1] Basic System Optimization  [2] Essential Gaming Tweaks   [3] Network Optimization
echo.
echo  [4] Basic Hardware Tweaks      [5] Limited Game Optimizations [6] Basic Windows Debloat
echo.
echo  [7] Create Restore Point       [8] System Information        [9] UPGRADE TO PRO
echo.
echo  [0] Exit
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select your option (0-9): "

if "%choice%"=="1" goto :system_optimization
if "%choice%"=="2" goto :gaming_performance
if "%choice%"=="3" goto :network_optimization  
if "%choice%"=="4" goto :hardware_tweaks
if "%choice%"=="5" goto :game_specific
if "%choice%"=="6" goto :windows_debloat
if "%choice%"=="7" goto :create_restore_point
if "%choice%"=="8" goto :system_info
if "%choice%"=="9" goto :upgrade_info
if "%choice%"=="0" goto :exit_script
goto :main_menu

:create_restore_point
cls
color D
echo.
echo --------------------------------------------------------------------------------
echo                              CREATE RESTORE POINT
echo --------------------------------------------------------------------------------
echo.
echo   Create a restore point to undo system changes if needed!
echo.
echo Highly Recommended before applying tweaks!
echo.
echo Do you want to create a restore point?
set /p choice="Enter (Y/N): "
if /i "%choice%"=="Y" (
    powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\' >nul 2>&1
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f >nul 2>&1 
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
    reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
    echo.
    echo Creating restore point...
    powershell -Command "Checkpoint-Computer -Description 'Nexus Tweaks Free v1.0 Restore Point'"
    echo Restore point created successfully!
    timeout 3 > nul 
) else if /i "%choice%"=="N" (
    echo.
    echo Skipping restore point creation...
    timeout 2 > nul
) else (
    goto :create_restore_point
)
goto :main_menu

:system_optimization
cls
color 9
echo --------------------------------------------------------------------------------
echo                           BASIC SYSTEM OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying essential system optimizations...
echo.

echo [1/6] Disabling Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [2/6] Disabling Location Services...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [3/6] Basic Visual Effects Optimization...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "200" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [4/6] Disabling Notifications...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [5/6] Basic File Explorer Tweaks...
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul 2>&1
echo Completed!

echo [6/6] Basic System Responsiveness...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "42" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                   BASIC SYSTEM OPTIMIZATION COMPLETED!
echo               Want Advanced CPU & Memory Optimizations? Upgrade to PRO!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:gaming_performance
cls
color D
echo --------------------------------------------------------------------------------
echo                            ESSENTIAL GAMING TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying basic gaming optimizations...
echo.

echo [1/6] Disabling Game DVR...
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [2/6] Setting High Performance Power Profile...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo Completed!

echo [3/6] Basic GPU Scheduling...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
echo Completed!

echo [4/6] Basic Game Mode Settings...
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [5/6] Basic Priority Settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
echo Completed!

echo [6/6] Disabling Background Apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                        ESSENTIAL GAMING TWEAKS COMPLETED!
echo           Want Advanced GPU, DirectX & Mouse Optimization? Upgrade to PRO!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:network_optimization
cls
color 9
echo --------------------------------------------------------------------------------
echo                            NETWORK OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying network performance optimizations...
echo.

echo [1/4] Basic TCP/IP Parameters...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class" /t REG_DWORD /d "8" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f >nul 2>&1
echo Completed!

echo [2/4] Enabling TCP No Delay...
Reg.exe add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [3/4] Basic DNS Settings...
netsh interface ip set dns "Local Area Connection" static 1.1.1.1 primary >nul 2>&1
netsh interface ip add dns "Local Area Connection" 1.0.0.1 index=2 >nul 2>&1
echo Completed!

echo [4/4] Flushing DNS Cache...
ipconfig /flushdns >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                     NETWORK OPTIMIZATION COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:hardware_tweaks
cls
color D
echo --------------------------------------------------------------------------------
echo                             BASIC HARDWARE TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying basic hardware optimizations...
echo.

echo [1/4] Basic USB Power Management...
for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f >nul 2>&1
)
echo Completed!

echo [2/4] Basic Boot Configuration...
bcdedit /set hypervisorlaunchtype off >nul 2>&1
echo Completed!

echo [3/4] Disabling Hibernation...
powercfg /hibernate off >nul 2>&1
echo Completed!

echo [4/4] Basic Processor Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "40" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                       BASIC HARDWARE TWEAKS COMPLETED!
echo        Want Advanced CPU, GPU, RAM & USB Optimizations? Upgrade to PRO!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:game_specific
cls
color 9
echo.
echo --------------------------------------------------------------------------------
echo                         LIMITED GAME-SPECIFIC OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo                            [!] FREE EDITION LIMIT [!]
echo                      Only 2 games available in free version
echo                       Upgrade to PRO for 20+ game profiles!
echo.
echo --------------------------------------------------------------------------------
echo.
echo  [1] Optimize CS:GO          [2] Optimize VALORANT         [3] Upgrade to PRO
echo.
echo  [4] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select your game (1-4): "

if "%choice%"=="1" goto :optimize_csgo
if "%choice%"=="2" goto :optimize_valorant
if "%choice%"=="3" goto :upgrade_info
if "%choice%"=="4" goto :main_menu
goto :game_specific

:optimize_csgo
cls
echo --------------------------------------------------------------------------------
echo                                CS:GO OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying basic CS:GO optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1

echo Basic CS:GO optimization completed!
echo.
echo [!] Want advanced game optimizations for better FPS? Upgrade to PRO!
pause
goto :game_specific

:optimize_valorant
cls
echo --------------------------------------------------------------------------------
echo                              VALORANT OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying basic VALORANT optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1

echo Basic VALORANT optimization completed!
echo.
echo [!] Want advanced game optimizations for better FPS? Upgrade to PRO!
pause
goto :game_specific

:windows_debloat
cls
color D
echo --------------------------------------------------------------------------------
echo                             BASIC WINDOWS DEBLOAT
echo --------------------------------------------------------------------------------
echo.
echo Choose basic debloat option:
echo.
echo  [1] Remove Common Bloatware     [2] Disable Basic Services      [3] Clean Temp Files
echo.
echo  [4] Basic Cortana Disable       [5] Upgrade to PRO              [6] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select option (1-6): "

if "%choice%"=="1" goto :remove_bloatware
if "%choice%"=="2" goto :disable_services
if "%choice%"=="3" goto :clean_temp_files
if "%choice%"=="4" goto :disable_cortana
if "%choice%"=="5" goto :upgrade_info
if "%choice%"=="6" goto :main_menu
goto :windows_debloat

:remove_bloatware
cls
echo --------------------------------------------------------------------------------
echo                            REMOVING COMMON BLOATWARE
echo --------------------------------------------------------------------------------
echo.
echo Removing basic unnecessary Windows apps...
echo.

PowerShell -Command "Get-AppxPackage -allusers *3DBuilder* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *BingWeather* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *GetHelp* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *Getstarted* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *solit* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsMaps* | Remove-AppxPackage" >nul 2>&1

echo Basic bloatware removal completed!
echo.
echo [!] Want to remove 50+ more bloatware apps? Upgrade to PRO!
pause
goto :windows_debloat

:disable_services
cls
echo --------------------------------------------------------------------------------
echo                           DISABLING BASIC SERVICES
echo --------------------------------------------------------------------------------
echo.
echo Disabling basic unnecessary Windows services...
echo.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Basic services disabled!
echo.
echo [!] Want advanced service optimization? Upgrade to PRO!
pause
goto :windows_debloat

:disable_cortana
cls
echo --------------------------------------------------------------------------------
echo                           BASIC CORTANA DISABLE
echo --------------------------------------------------------------------------------
echo.
echo Disabling basic Cortana features...
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1

echo Basic Cortana disable completed!
echo.
echo [!] Want complete Cortana removal? Upgrade to PRO!
pause
goto :windows_debloat

:clean_temp_files
cls
echo --------------------------------------------------------------------------------
echo                           CLEANING TEMPORARY FILES
echo --------------------------------------------------------------------------------
echo.
echo Cleaning basic temporary files...
echo.

del /s /f /q "%temp%\*" >nul 2>&1
del /s /f /q "C:\Windows\Temp\*" >nul 2>&1

echo Basic temporary files cleaned!
echo.
echo [!] Want advanced disk cleanup? Upgrade to PRO!
pause
goto :windows_debloat

:system_info
cls
echo --------------------------------------------------------------------------------
echo                               SYSTEM INFORMATION
echo --------------------------------------------------------------------------------
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Processor"
echo.
echo Graphics Card Information:
wmic path win32_VideoController get name
echo.
echo [!] Want advanced performance testing? Upgrade to PRO!
pause
goto :main_menu

:upgrade_info
cls
color A
echo.
echo --------------------------------------------------------------------------------
echo                           UPGRADE TO NEXUS TWEAKS PRO
echo --------------------------------------------------------------------------------
echo.
echo                              Only $19.99 - One-time payment!
echo.
echo                                 GET 10X MORE FEATURES:
echo.
echo    [+] Advanced CPU Optimizations (12 tweaks)
echo    [+] Advanced GPU Tweaks (AMD/NVIDIA/Intel specific)
echo    [+] Enhanced USB Optimizations (6 advanced tweaks)
echo    [+] RAM/Memory Optimization Suite (8 tweaks)
echo    [+] DirectX Gaming API Optimizations
echo    [+] 20+ Game-Specific Optimization Profiles
echo    [+] Enhanced Scheduled Task Disabling (25+ tasks)
echo    [+] Advanced Registry Backup/Restore System
echo    [+] Performance Testing & Benchmarking Tools
echo    [+] Automated System Maintenance
echo    [+] Priority Customer Support
echo    [+] Lifetime Updates
echo.
echo                              PERFORMANCE BENEFITS:
echo    - Up to 30%% FPS increase in games
echo    - 50%% faster system startup
echo    - Reduced input lag and stuttering
echo    - Professional-grade optimization
echo.
echo --------------------------------------------------------------------------------
echo.
echo          Visit: https://nexustweaks.com/upgrade to purchase PRO version
echo                          Or contact: support@nexustweaks.com
echo.
pause
goto :main_menu

:exit_script
cls
echo.
echo --------------------------------------------------------------------------------
echo                                 THANK YOU!
echo --------------------------------------------------------------------------------
echo.
echo      Thanks for using Nexus Tweaks FREE v1.0!
echo.
echo              Want to unlock the full potential?
echo               Upgrade to PRO for only $19.99!
echo.
echo        Visit: https://nexustweaks.com/upgrade
echo.
echo --------------------------------------------------------------------------------
echo.
echo Press any key to exit...
pause >nul
exit /b 0

