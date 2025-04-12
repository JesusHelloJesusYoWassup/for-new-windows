@echo off
title Customizing Windows Settings
color 0A
echo 🔧 Applying settings...

:: Hide "This PC" and Recycle Bin from Desktop

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

:: Install a list of apps using winget
@echo off
echo Installing applications...

winget install --id Discord.Discord -e --silent
echo Installed Discord.

winget install --id Spotify.Spotify -e --silent
echo Installed Spotify.

winget install --id spicetify -e --silent
echo Installed Spicetify.

winget install --id Telegram.TelegramDesktop -e --silent
echo Installed Telegram.

winget install --id Opera.OperaGX -e --silent
echo Installed Opera GX.

winget install --id 7zip.7zip -e --silent
echo Installed 7-Zip.

winget install --id Notepad++.Notepad++ -e --silent
echo Installed Notepad++.

winget install --id Valve.Steam -e --silent
echo Installed Steam.

winget install --id Skillbrains.Lightshot -e --silent
echo Installed Lightshot.

echo ✅ Done!
pause

:: Disable Enhance Pointer Precision (mouse acceleration)
REG ADD "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
REG ADD "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
REG ADD "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

:: Set minimal keyboard repeat delay and maximum speed
REG ADD "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
REG ADD "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f

:: Enable dark theme for File Explorer
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f

:: Restart Explorer to apply changes
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

:: Apply automatic login for the user (you must manually specify the user credentials)
:: WARNING: Use with caution, as storing passwords in plain text is insecure.
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "YourUserName" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d "YourPassword" /f

:: Display message to the user
echo Changes applied. Logging out in 10 seconds...
timeout /t 3 /nobreak >nul

:: Automatically log off and log back in
shutdown.exe /l

:: Exit script
exit
