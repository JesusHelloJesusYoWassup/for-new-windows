@echo off
echo Устанавливаю приложения...

winget install --id Discord.Discord -e --silent
echo Установлен Discord.

winget install --id Spotify.Spotify -e --silent
echo Установлен Spotify.

winget install --id spicetify -e --silent
echo Установлен Spicetify.

winget install --id Telegram.TelegramDesktop -e --silent
echo Установлен Telegram.

winget install --id Opera.OperaGX -e --silent
echo Установлен Opera GX.

winget install --id 7zip.7zip -e --silent
echo Установлен 7-Zip.

winget install --id Notepad++.Notepad++ -e --silent
echo Установлен Notepad++.

winget install --id Valve.Steam -e --silent
echo Установлен Steam.

winget install --id Skillbrains.Lightshot -e --silent
echo Установлен Lightshot.

echo ✅ Готово!
pause
