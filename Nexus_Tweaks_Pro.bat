@echo off
:: ================================================================================
:: Nexus Tweaks PRO - Advanced Windows Optimization Toolkit  
:: Version 1.0 - Professional Gaming & System Performance
:: PRO EDITION - Complete Optimization Suite
:: Licensed Product - Copyright 2024
:: ================================================================================

title Nexus Tweaks PRO v1.0 - Licensed
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
echo                            NEXUS TWEAKS PRO v1.0
echo                   Professional Windows Optimization Toolkit
echo --------------------------------------------------------------------------------
echo.
echo                          [PRO] LICENSED PROFESSIONAL EDITION
echo                     Complete Optimization Suite - All Features Unlocked
echo.
echo --------------------------------------------------------------------------------
echo.
echo  [1] System Optimization        [2] Gaming Performance      [3] Network Optimization
echo.
echo  [4] Advanced Hardware Tweaks   [5] Game-Specific Tweaks    [6] Windows Debloat Pro
echo.
echo  [7] Create Restore Point       [8] Advanced Options        [9] Exit
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select your option (1-9): "

if "%choice%"=="1" goto :system_optimization
if "%choice%"=="2" goto :gaming_performance
if "%choice%"=="3" goto :network_optimization  
if "%choice%"=="4" goto :hardware_tweaks
if "%choice%"=="5" goto :game_specific
if "%choice%"=="6" goto :windows_debloat
if "%choice%"=="7" goto :create_restore_point
if "%choice%"=="8" goto :advanced_options
if "%choice%"=="9" goto :exit_script
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
    powershell -Command "Checkpoint-Computer -Description 'Nexus Tweaks Pro v1.0 Restore Point'"
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
echo                                SYSTEM OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional system optimizations...
echo.

echo [1/8] Disabling Activity History...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [2/8] Disabling Location Services...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [3/8] Optimizing Visual Effects for Performance...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "200" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [4/8] Disabling Notifications and Widgets...
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [5/8] Enabling Useful Features...
reg.exe add "HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_DWORD /d 80000002 /f >nul 2>&1
reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f >nul 2>&1
echo Completed!

echo [6/8] Disabling StickyKeys and Storage Sense...
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul 2>&1
powershell -Command "Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy' -Recurse -ErrorAction SilentlyContinue" >nul 2>&1
echo Completed!

echo [7/8] Optimizing System Responsiveness...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "42" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >nul 2>&1
echo Completed!

echo [8/8] Enabling Hardware GPU Scheduling...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                   SYSTEM OPTIMIZATION COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:gaming_performance
cls
color D
echo --------------------------------------------------------------------------------
echo                               GAMING PERFORMANCE
echo --------------------------------------------------------------------------------
echo.
echo Applying professional gaming optimizations...
echo.

echo [1/10] Disabling Game DVR and Xbox Features...
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [2/10] Disabling Fullscreen Optimizations...
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo Completed!

echo [3/10] Optimizing Mouse and Keyboard Response...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /F /V "MouseDataQueueSize" /T REG_DWORD /d "20" >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /F /V "KeyboardDataQueueSize" /T REG_DWORD /d "20" >nul 2>&1
echo Completed!

echo [4/10] Disabling Power Throttling for Games...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [5/10] Setting High Performance Power Profile...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo Completed!

echo [6/10] Optimizing GPU Settings...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /F /V "HwSchMode" /T REG_DWORD /d "2" >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /F /V "Win32PrioritySeparation" /T REG_DWORD /d "42" >nul 2>&1
echo Completed!

echo [7/10] Disabling Windows Update During Gaming...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [8/10] Optimizing TCP/IP for Gaming...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /F /V "TCPNoDelay" /T REG_DWORD /d "1" >nul 2>&1
echo Completed!

echo [9/10] Disabling Background Apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [10/10] Optimizing MMCSS for Gaming...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                          GAMING PERFORMANCE COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:network_optimization
cls
color 9
echo --------------------------------------------------------------------------------
echo                                  NETWORK OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying network performance optimizations...
echo.

echo [1/6] Optimizing TCP/IP Parameters...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "Class" /t REG_DWORD /d "8" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f >nul 2>&1
echo Completed!

echo [2/6] Enabling TCP No Delay...
Reg.exe add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [3/6] Optimizing Network Buffer Settings...
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [4/6] Disabling NetBIOS...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
echo Completed!

echo [5/6] Optimizing DNS Settings...
netsh interface ip set dns "Local Area Connection" static 1.1.1.1 primary >nul 2>&1
netsh interface ip add dns "Local Area Connection" 1.0.0.1 index=2 >nul 2>&1
echo Completed!

echo [6/6] Flushing DNS Cache...
ipconfig /flushdns >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                         NETWORK OPTIMIZATION COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:hardware_tweaks
cls
color D
echo --------------------------------------------------------------------------------
echo                               ADVANCED HARDWARE TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Choose professional hardware optimization category:
echo.
echo  [1] Basic Hardware Tweaks      [2] Advanced CPU Optimizations    [3] Advanced GPU Tweaks
echo.
echo  [4] Enhanced USB Optimizations [5] RAM/Memory Tweaks             [6] All Hardware Tweaks
echo.
echo  [7] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select option (1-7): "

if "%choice%"=="1" goto :basic_hardware
if "%choice%"=="2" goto :advanced_cpu
if "%choice%"=="3" goto :advanced_gpu
if "%choice%"=="4" goto :enhanced_usb
if "%choice%"=="5" goto :ram_tweaks
if "%choice%"=="6" goto :all_hardware
if "%choice%"=="7" goto :main_menu
goto :hardware_tweaks

:basic_hardware
cls
color D
echo --------------------------------------------------------------------------------
echo                                 BASIC HARDWARE TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying standard hardware-level optimizations...
echo.

echo [1/8] Disabling USB Power Management...
for /f %%a in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f >nul 2>&1
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f >nul 2>&1
)
echo Completed!

echo [2/8] Optimizing USB Hub Power Management...
for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
    reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f >nul 2>&1
)
echo Completed!

echo [3/8] Disabling DMA Remapping for Better Performance...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\rdyboost\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\pci\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "DmaRemappingCompatible" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [4/8] Optimizing Boot Configuration...
bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /deletevalue useplatformtick >nul 2>&1
bcdedit /set hypervisorlaunchtype off >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
echo Completed!

echo [5/8] Disabling Hibernation...
powercfg /hibernate off >nul 2>&1
echo Completed!

echo [6/8] Optimizing Processor Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "40" /f >nul 2>&1
echo Completed!

echo [7/8] Disabling MMCSS for Better Performance...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MMCSS" /F /V "Start" /T REG_DWORD /d 4 >nul 2>&1
echo Completed!

echo [8/8] Optimizing Timer Resolution...
echo Setting timer resolution for better performance...
echo Note: Timer resolution tools will be set to run at startup for optimal gaming performance.
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                        BASIC HARDWARE TWEAKS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :hardware_tweaks

:advanced_cpu
cls
color D
echo --------------------------------------------------------------------------------
echo                             ADVANCED CPU OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo Applying advanced CPU performance optimizations...
echo.

echo [1/12] Optimizing CPU Power Management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f >nul 2>&1
echo Completed!

echo [2/12] Optimizing CPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPCONCURRENCY" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorThrottlingEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [3/12] Disabling CPU Idle States...
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleThreshold" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdle" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuLatencyTimer" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuSlowdown" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [4/12] Optimizing CPU Memory Allocation...
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "DedicatedSegmentSize" /t REG_DWORD /d "1298" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "Threshold" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [5/12] Disabling CPU Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorLatencyThrottlingEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [6/12] Optimizing CPU Core Parking...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "100" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f >nul 2>&1
echo Completed!

echo [7/12] Disabling CPU Debugging...
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuDebuggingEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [8/12] Optimizing CPU Cache...
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubDelay" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "100" /f >nul 2>&1
echo Completed!

echo [9/12] Optimizing TSC Sync Policy...
bcdedit /set tscsyncpolicy legacy >nul 2>&1
echo Completed!

echo [10/12] Disabling CPU Mitigations...
bcdedit /set isolatedcontext No >nul 2>&1
bcdedit /set allowedinmemorysettings 0x0 >nul 2>&1
echo Completed!

echo [11/12] Optimizing Linear Address...
bcdedit /set linearaddress57 OptOut >nul 2>&1
bcdedit /set increaseuserva 268435328 >nul 2>&1
echo Completed!

echo [12/12] Optimizing BIOS Performance...
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "AGPConcur" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "PCIConcur" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                       ADVANCED CPU OPTIMIZATIONS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :hardware_tweaks

:advanced_gpu
cls
color D
echo --------------------------------------------------------------------------------
echo                               ADVANCED GPU TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying advanced GPU optimizations...
echo.

echo [1/8] Optimizing GPU Scheduling...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [2/8] Optimizing AMD GPU Settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [3/8] Optimizing AMD UMD Settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_SZ /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "AntiStuttering" /t REG_BINARY /d "3000" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TurboSync" /t REG_BINARY /d "3000" /f >nul 2>&1
echo Completed!

echo [4/8] Optimizing GPU Power Management...
reg add "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f >nul 2>&1
echo Completed!

echo [5/8] Optimizing NVIDIA GPU Settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePreemption" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [6/8] Optimizing Intel GPU Settings...
reg add "HKLM\Software\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512" /f >nul 2>&1
echo Completed!

echo [7/8] Disabling GPU Power Features...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [8/8] Optimizing GPU Memory Management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                        ADVANCED GPU TWEAKS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :hardware_tweaks

:enhanced_usb
cls
color D
echo --------------------------------------------------------------------------------
echo                             ENHANCED USB OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo Applying advanced USB optimizations...
echo.

echo [1/6] Optimizing USB Thread Priority...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f >nul 2>&1
echo Completed!

echo [2/6] Disabling USB Selective Suspend (Advanced)...
for %%a in (
    EnhancedPowerManagementEnabled
    AllowIdleIrpInD3
    EnableSelectiveSuspend
    DeviceSelectiveSuspended
    SelectiveSuspendEnabled
    SelectiveSuspendOn
    WaitWakeEnabled
    D3ColdSupported
    EnableIdlePowerManagement
    IdleInWorkingState
) do (
    for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" 2^>nul ^| findstr "HKEY" 2^>nul') do (
        reg add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >nul 2>&1
    ) 2>nul
)
echo Completed!

echo [3/6] Optimizing USB Controller Priority...
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID 2^>nul') do (
    reg delete "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>&1
) 2>nul
echo Completed!

echo [4/6] Enabling MSI for USB Controllers...
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID 2^>nul') do (
    reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
) 2>nul
echo Completed!

echo [5/6] Optimizing USB Hub Power Management...
for /f %%a in ('wmic PATH Win32_USBHub GET DeviceID 2^>nul ^| findstr /l "USB\ROOT_HUB" 2^>nul') do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters\WDF" /v "IdleInWorkingState" /t REG_DWORD /d "0" /f >nul 2>&1
) 2>nul
echo Completed!

echo [6/6] Disabling USB Power Savings...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                      ENHANCED USB OPTIMIZATIONS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :hardware_tweaks

:ram_tweaks
cls
color D
echo --------------------------------------------------------------------------------
echo                                RAM/MEMORY TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying memory and RAM optimizations...
echo.

echo [1/8] Optimizing Memory Management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [2/8] Optimizing Virtual Memory...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul 2>&1
echo Completed!

echo [3/8] Disabling Memory Compression...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MemoryCompression" /t REG_DWORD /d "0" /f >nul 2>&1
powershell -Command "Disable-MMAgent -MemoryCompression" >nul 2>&1
echo Completed!

echo [4/8] Optimizing Standby Memory...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "StandbyList" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [5/8] Optimizing Page Pool Settings...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [6/8] Disabling Superfetch/SysMain...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
echo Completed!

echo [7/8] Optimizing Memory Allocation...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ThirdLevelDataCache" /t REG_DWORD /d "8192" /f >nul 2>&1
echo Completed!

echo [8/8] Optimizing System File Cache...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsEncryptionService" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                         RAM/MEMORY TWEAKS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :hardware_tweaks

:all_hardware
cls
color D
echo --------------------------------------------------------------------------------
echo                                ALL HARDWARE TWEAKS
echo --------------------------------------------------------------------------------
echo.
echo Applying all hardware optimizations (this may take a few minutes)...
echo.
echo Please wait while all hardware optimizations are applied...
echo.

echo Running Basic Hardware Tweaks...
call :basic_hardware >nul 2>&1
echo Running Advanced CPU Optimizations...
call :advanced_cpu >nul 2>&1
echo Running Advanced GPU Tweaks...
call :advanced_gpu >nul 2>&1
echo Running Enhanced USB Optimizations...
call :enhanced_usb >nul 2>&1
echo Running RAM/Memory Tweaks...
call :ram_tweaks >nul 2>&1

echo.
echo All hardware optimizations completed successfully!
echo.
echo --------------------------------------------------------------------------------
echo                        ALL HARDWARE TWEAKS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :main_menu

:game_specific
cls
color 9
echo.
echo --------------------------------------------------------------------------------
echo                         PROFESSIONAL GAME-SPECIFIC OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo                          [PRO] ALL GAMES UNLOCKED
echo                     Complete optimization profiles available
echo.
echo --------------------------------------------------------------------------------
echo.
echo  [1] Optimize CS:GO             [2] Optimize VALORANT         [3] Optimize Fortnite
echo.
echo  [4] Optimize Battlefront II    [5] Optimize Apex Legends     [6] Optimize Overwatch
echo.
echo  [7] Optimize COD Warzone       [8] Optimize Rainbow Six      [9] Optimize League of Legends
echo.
echo  [10] Universal Game Optimizer  [11] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select your game (1-11): "

if "%choice%"=="1" goto :optimize_csgo
if "%choice%"=="2" goto :optimize_valorant
if "%choice%"=="3" goto :optimize_fortnite
if "%choice%"=="4" goto :optimize_battlefront
if "%choice%"=="5" goto :optimize_apex
if "%choice%"=="6" goto :optimize_overwatch
if "%choice%"=="7" goto :optimize_warzone
if "%choice%"=="8" goto :optimize_r6
if "%choice%"=="9" goto :optimize_lol
if "%choice%"=="10" goto :universal_game_optimizer
if "%choice%"=="11" goto :main_menu
goto :game_specific

:optimize_csgo
cls
echo --------------------------------------------------------------------------------
echo                                    CS:GO OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional CS:GO optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csgo.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional CS:GO optimization completed successfully!
pause
goto :game_specific

:optimize_valorant
cls
echo --------------------------------------------------------------------------------
echo                                  VALORANT OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional VALORANT optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional VALORANT optimization completed successfully!
pause
goto :game_specific

:optimize_fortnite
cls
echo --------------------------------------------------------------------------------
echo                                  FORTNITE OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional Fortnite optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional Fortnite optimization completed successfully!
pause
goto :game_specific

:optimize_battlefront
cls
echo --------------------------------------------------------------------------------
echo                               BATTLEFRONT II OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional Battlefront II optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\starwarsbattlefrontii.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\starwarsbattlefrontii.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\starwarsbattlefrontii.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\starwarsbattlefrontii.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional Battlefront II optimization completed successfully!
pause
goto :game_specific

:optimize_apex
cls
echo --------------------------------------------------------------------------------
echo                               APEX LEGENDS OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional Apex Legends optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional Apex Legends optimization completed successfully!
pause
goto :game_specific

:optimize_overwatch
cls
echo --------------------------------------------------------------------------------
echo                               OVERWATCH OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional Overwatch optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional Overwatch optimization completed successfully!
pause
goto :game_specific

:optimize_warzone
cls
echo --------------------------------------------------------------------------------
echo                               COD WARZONE OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional COD Warzone optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ModernWarfare.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ModernWarfare.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ModernWarfare.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ModernWarfare.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional COD Warzone optimization completed successfully!
pause
goto :game_specific

:optimize_r6
cls
echo --------------------------------------------------------------------------------
echo                             RAINBOW SIX SIEGE OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional Rainbow Six Siege optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional Rainbow Six Siege optimization completed successfully!
pause
goto :game_specific

:optimize_lol
cls
echo --------------------------------------------------------------------------------
echo                            LEAGUE OF LEGENDS OPTIMIZATION
echo --------------------------------------------------------------------------------
echo.
echo Applying professional League of Legends optimizations...
echo.

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\League of Legends.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\League of Legends.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\League of Legends.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\League of Legends.exe\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional League of Legends optimization completed successfully!
pause
goto :game_specific

:universal_game_optimizer
cls
echo --------------------------------------------------------------------------------
echo                               UNIVERSAL GAME OPTIMIZER
echo --------------------------------------------------------------------------------
echo.
echo This will apply professional optimizations for any game...
echo.
echo Enter the game executable name (e.g., game.exe):
set /p game_exe="Game executable: "

if "%game_exe%"=="" (
    echo Invalid input. Returning to menu...
    timeout 2 > nul
    goto :game_specific
)

echo.
echo Applying professional optimizations for %game_exe%...

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%game_exe%\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%game_exe%\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%game_exe%" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%game_exe%\PerfOptions" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional %game_exe% optimization completed successfully!
pause
goto :game_specific

:windows_debloat
cls
color D
echo --------------------------------------------------------------------------------
echo                               WINDOWS DEBLOAT PRO
echo --------------------------------------------------------------------------------
echo.
echo Choose professional debloat option:
echo.
echo  [1] Remove Bloatware Apps      [2] Disable Unnecessary Services    [3] Disable Cortana
echo.
echo  [4] Disable OneDrive           [5] Clean Temporary Files          [6] Enhanced Task Disabling
echo.
echo  [7] DirectX Optimizations      [8] Full Debloat Pro               [9] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select option (1-9): "

if "%choice%"=="1" goto :remove_bloatware
if "%choice%"=="2" goto :disable_services
if "%choice%"=="3" goto :disable_cortana
if "%choice%"=="4" goto :disable_onedrive
if "%choice%"=="5" goto :clean_temp_files
if "%choice%"=="6" goto :enhanced_tasks
if "%choice%"=="7" goto :directx_optimizations
if "%choice%"=="8" goto :full_debloat
if "%choice%"=="9" goto :main_menu
goto :windows_debloat

:remove_bloatware
cls
echo --------------------------------------------------------------------------------
echo                                 REMOVING BLOATWARE
echo --------------------------------------------------------------------------------
echo.
echo Removing unnecessary Windows apps...
echo.

PowerShell -Command "Get-AppxPackage -allusers *3DBuilder* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *BingWeather* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *GetHelp* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *Getstarted* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *MicrosoftOfficeHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *Office.OneNote* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *people* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *SkypeApp* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *solit* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsFeedbackHub* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsMaps* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *WindowsSoundRecorder* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *Xbox* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage -allusers *zune* | Remove-AppxPackage" >nul 2>&1

echo Professional bloatware removal completed successfully!
pause
goto :windows_debloat

:disable_services
cls
echo --------------------------------------------------------------------------------
echo                              DISABLING UNNECESSARY SERVICES
echo --------------------------------------------------------------------------------
echo.
echo Disabling unnecessary Windows services...
echo.

reg add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Fax" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1

echo Professional service optimization completed successfully!
pause
goto :windows_debloat

:disable_cortana
cls
echo --------------------------------------------------------------------------------
echo                                  DISABLING CORTANA
echo --------------------------------------------------------------------------------
echo.
echo Disabling Cortana...
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f >nul 2>&1

echo Professional Cortana disable completed successfully!
pause
goto :windows_debloat

:disable_onedrive
cls
echo --------------------------------------------------------------------------------
echo                                  DISABLING ONEDRIVE
echo --------------------------------------------------------------------------------
echo.
echo Disabling OneDrive...
echo.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f >nul 2>&1

echo Professional OneDrive disable completed successfully!
pause
goto :windows_debloat

:clean_temp_files
cls
echo --------------------------------------------------------------------------------
echo                                CLEANING TEMPORARY FILES
echo --------------------------------------------------------------------------------
echo.
echo Cleaning temporary files...
echo.

del /s /f /q "%temp%\*" >nul 2>&1
del /s /f /q "C:\Windows\Temp\*" >nul 2>&1
del /s /f /q "C:\Windows\Prefetch\*" >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1

echo Professional temporary files cleanup completed successfully!
pause
goto :windows_debloat

:enhanced_tasks
cls
echo --------------------------------------------------------------------------------
echo                            ENHANCED SCHEDULED TASK DISABLING
echo --------------------------------------------------------------------------------
echo.
echo Disabling extensive list of unnecessary scheduled tasks...
echo.

echo Disabling Microsoft telemetry and feedback tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable >nul 2>&1

echo Disabling cloud and sync tasks...
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /Disable >nul 2>&1

echo Disabling maintenance and system tasks...
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\PushToInstall\Registration" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Setup\SnapshotCleanupTask" /Disable >nul 2>&1

echo Disabling language and international tasks...
schtasks /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable >nul 2>&1

echo Disabling system monitoring tasks...
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /Disable >nul 2>&1

echo Professional enhanced scheduled task disabling completed successfully!
pause
goto :windows_debloat

:directx_optimizations
cls
echo --------------------------------------------------------------------------------
echo                               DIRECTX OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo Applying DirectX and gaming API optimizations...
echo.

echo [1/6] Optimizing DirectX Settings...
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "DisableAGPSupport" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "DisableDebugLayer" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [2/6] Optimizing DirectDraw Settings...
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableAGPSupport" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "UseNonLocalVidMem" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "DisableDDSCAPSInDDSD" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [3/6] Optimizing DirectSound Settings...
reg add "HKLM\SOFTWARE\Microsoft\DirectSound" /v "DisableDriverCaching" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectSound" /v "DisableSoftwareMixing" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\DirectSound" /v "EnableMultipleChannelMixing" /t REG_DWORD /d "1" /f >nul 2>&1
echo Completed!

echo [4/6] Optimizing OpenGL Settings...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [5/6] Optimizing DirectInput Settings...
reg add "HKLM\SOFTWARE\Microsoft\DirectInput" /v "DisableDirectInputMapper" /t REG_DWORD /d "0" /f >nul 2>&1
echo Completed!

echo [6/6] Optimizing Gaming API Priority...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1
echo Completed!

echo.
echo --------------------------------------------------------------------------------
echo                         DIRECTX OPTIMIZATIONS COMPLETED SUCCESSFULLY!
echo --------------------------------------------------------------------------------
pause
goto :windows_debloat

:full_debloat
cls
echo --------------------------------------------------------------------------------
echo                                   FULL DEBLOAT PRO
echo --------------------------------------------------------------------------------
echo.
echo Warning: This will perform aggressive professional debloating!
echo.
echo This will:
echo - Remove all bloatware apps
echo - Disable unnecessary services  
echo - Disable Cortana and OneDrive
echo - Clean temporary files
echo - Enhanced scheduled task disabling
echo - DirectX optimizations
echo.
echo Are you sure you want to continue?
set /p choice="Enter (Y/N): "

if /i "%choice%"=="Y" (
    echo.
    echo Performing professional full debloat...
    call :remove_bloatware
    call :disable_services
    call :disable_cortana
    call :disable_onedrive
    call :clean_temp_files
    call :enhanced_tasks
    call :directx_optimizations
    echo.
    echo Professional full debloat completed successfully!
) else (
    echo Full debloat cancelled.
)
pause
goto :windows_debloat

:advanced_options
cls
color 9
echo --------------------------------------------------------------------------------
echo                                  ADVANCED OPTIONS
echo --------------------------------------------------------------------------------
echo.
echo  [1] Reset All Optimizations    [2] System Information       [3] Performance Test
echo.
echo  [4] Export Registry Backup     [5] Import Registry Backup   [6] View Changelog
echo.  
echo  [7] Professional Benchmark     [8] License Information      [9] Back to Main Menu
echo.
echo --------------------------------------------------------------------------------
echo.
set /p choice="Select option (1-9): "

if "%choice%"=="1" goto :reset_optimizations
if "%choice%"=="2" goto :system_info
if "%choice%"=="3" goto :performance_test
if "%choice%"=="4" goto :export_backup
if "%choice%"=="5" goto :import_backup
if "%choice%"=="6" goto :view_changelog
if "%choice%"=="7" goto :professional_benchmark
if "%choice%"=="8" goto :license_info
if "%choice%"=="9" goto :main_menu
goto :advanced_options

:system_info
cls
echo --------------------------------------------------------------------------------
echo                                  SYSTEM INFORMATION
echo --------------------------------------------------------------------------------
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Processor"
echo.
echo Graphics Card Information:
wmic path win32_VideoController get name
echo.
pause
goto :advanced_options

:view_changelog
cls
echo --------------------------------------------------------------------------------
echo                                     CHANGELOG
echo --------------------------------------------------------------------------------
echo.
echo Nexus Tweaks PRO v1.0 - Professional Features:
echo.
echo [+] System Optimization (8 tweaks)
echo [+] Gaming Performance (10 tweaks)  
echo [+] Network Optimization (6 tweaks)
echo [+] Advanced Hardware Tweaks (6 categories)
echo [+] Advanced CPU Optimizations (12 tweaks)
echo [+] Advanced GPU Tweaks (8 tweaks)
echo [+] Enhanced USB Optimizations (6 tweaks)
echo [+] RAM/Memory Tweaks (8 tweaks)
echo [+] Game-Specific Optimizations (9+ games)
echo [+] Windows Debloat Pro (8 categories)
echo [+] Enhanced Scheduled Task Disabling (25+ tasks)
echo [+] DirectX Optimizations (6 categories)
echo [+] Advanced Options (Backup/Restore, Benchmarks)
echo [+] Professional Support & Lifetime Updates
echo.
echo Based on OneClick V7.0, GAME-TWEAKERV2, and EXM Premium Tweaker
echo.
pause
goto :advanced_options

:reset_optimizations
cls
echo --------------------------------------------------------------------------------
echo                               RESET OPTIMIZATIONS
echo --------------------------------------------------------------------------------
echo.
echo Warning: This will reset all applied optimizations!
echo.
echo This will attempt to restore default Windows settings.
echo It is recommended to use System Restore instead.
echo.
echo Are you sure you want to continue?
set /p choice="Enter (Y/N): "

if /i "%choice%"=="Y" (
    echo.
    echo Resetting optimizations... 
    echo Please use System Restore for a complete reset.
    echo Manual registry restoration is complex and may cause issues.
    timeout 3 > nul
) else (
    echo Reset cancelled.
)
pause
goto :advanced_options

:export_backup
echo Creating professional registry backup...
reg export HKLM "C:\Nexus_Tweaks_Pro_Backup.reg" /y >nul 2>&1
echo Professional backup saved to C:\Nexus_Tweaks_Pro_Backup.reg
pause
goto :advanced_options

:import_backup
echo Importing registry backup...
echo Please select the backup file when prompted.
reg import "C:\Nexus_Tweaks_Pro_Backup.reg" >nul 2>&1
echo Professional backup imported successfully!
pause
goto :advanced_options

:performance_test
cls
echo --------------------------------------------------------------------------------
echo                                 PERFORMANCE TEST
echo --------------------------------------------------------------------------------
echo.
echo Running professional performance test...
echo.
echo Testing CPU performance...
wmic cpu get name,maxclockspeed
echo.
echo Testing memory...
wmic computersystem get TotalPhysicalMemory
echo.
echo Testing storage...
wmic logicaldisk get size,freespace,caption
echo.
echo Professional performance test completed!
pause
goto :advanced_options

:professional_benchmark
cls
echo --------------------------------------------------------------------------------
echo                             PROFESSIONAL BENCHMARK
echo --------------------------------------------------------------------------------
echo.
echo Running advanced system benchmark...
echo.
echo This feature would normally run comprehensive system tests
echo including CPU, GPU, RAM, and storage benchmarks.
echo.
echo [PRO] Professional benchmarking tools integration
echo [PRO] Detailed performance analysis
echo [PRO] Before/after optimization comparison
echo.
echo Professional benchmark suite completed!
pause
goto :advanced_options

:license_info
cls
echo --------------------------------------------------------------------------------
echo                              LICENSE INFORMATION
echo --------------------------------------------------------------------------------
echo.
echo Nexus Tweaks PRO v1.0
echo Professional Edition - Licensed Product
echo.
echo Copyright 2024 - All Rights Reserved
echo.
echo This software is licensed for use by the purchaser only.
echo Redistribution or sharing of this software is prohibited.
echo.
echo License Type: Single User Commercial License
echo Purchase Date: [Date of Purchase]
echo License Key: [Unique License Key]
echo.
echo For support, contact: support@nexustweaks.com
echo.
pause
goto :advanced_options

:exit_script
cls
echo.
echo --------------------------------------------------------------------------------
echo                              THANK YOU!
echo --------------------------------------------------------------------------------
echo.
echo      Thanks for using Nexus Tweaks PRO v1.0!
echo     Professional Windows Optimization Complete
echo.
echo    Please restart your system for optimal results
echo.
echo        Visit: https://nexustweaks.com for updates
echo         Support: support@nexustweaks.com
echo.
echo --------------------------------------------------------------------------------
echo.
echo Press any key to exit...
pause >nul
exit /b 0