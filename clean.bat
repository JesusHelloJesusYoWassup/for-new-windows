@echo off
setlocal EnableDelayedExpansion

:: Define TEMP directory
set "tempDir=%TEMP%"

:: Calculate TEMP folder size before cleanup
echo Calculating TEMP folder size before cleanup...
set /a sizeBefore=0
for /R "%tempDir%" %%F in (*) do (
    set /a sizeBefore+=%%~zF
)

:: Delete all files and folders in TEMP
echo Cleaning TEMP folder...
del /s /f /q "%tempDir%\*" >nul 2>&1
for /d %%D in ("%tempDir%\*") do rd /s /q "%%D" >nul 2>&1

:: Calculate TEMP folder size after cleanup
set /a sizeAfter=0
for /R "%tempDir%" %%F in (*) do (
    set /a sizeAfter+=%%~zF
)

:: Calculate freed space in MB
set /a freedBytes=sizeBefore - sizeAfter
set /a freedMB=freedBytes / 1048576


:: Final report
echo.
echo ==============================
echo TEMP folder cleaned successfully!
echo Freed space: !freedMB! MB
echo ==============================

:: Wait for 2 seconds before closing the window
timeout /t 2 /nobreak >nul
exit
