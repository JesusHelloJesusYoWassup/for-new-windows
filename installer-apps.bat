@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$apps = @(
    @{Name='Discord';ID='Discord.Discord'},
    @{Name='Spotify';ID='Spotify.Spotify'},
    @{Name='Spicetify';ID='spicetify'},
    @{Name='Telegram';ID='Telegram.TelegramDesktop'},
    @{Name='Opera GX';ID='Opera.OperaGX'},
    @{Name='7-Zip';ID='7zip.7zip'},
    @{Name='Notepad++';ID='Notepad++.Notepad++'},
    @{Name='Steam';ID='Valve.Steam'},
    @{Name='Lightshot';ID='Skillbrains.Lightshot'}
); foreach ($app in $apps) {
    Write-Host \"Устанавливаю $($app.Name)...\";
    winget install --id $($app.ID) -e --silent
}; Write-Host '✅ Готово!'"
pause
