@echo off
title Hiding "This PC" and Recycle Bin from Desktop
color 0A
echo 🔧 Applying settings...

:: Hide "This PC" in NewStartPanel (modern Start menu)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
/v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 1 /f

:: Hide "This PC" in ClassicStartMenu (just in case)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
/v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 1 /f

:: Hide Recycle Bin
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" ^
/v {645FF040-5081-101B-9F08-00AA002F954E} /t REG_DWORD /d 1 /f

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" ^
/v {645FF040-5081-101B-9F08-00AA002F954E} /t REG_DWORD /d 1 /f

:: Restarting Explorer to apply changes
echo 🔄 Restarting Explorer...
taskkill /f /im explorer.exe >nul
timeout /t 1 >nul
start explorer.exe

echo ✅ Icons are now hidden from desktop!
pause
