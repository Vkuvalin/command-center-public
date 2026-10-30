@echo off
setlocal EnableExtensions DisableDelayedExpansion

rem Keep PowerShell's output readable in a UTF-8 console where supported.
chcp 65001 >nul 2>&1

set "CC_SCRIPT=%~dp0scripts\command-center.ps1"
if not exist "%CC_SCRIPT%" (
    >&2 echo Command Center script was not found: "%CC_SCRIPT%"
    goto :launcher_error
)

where pwsh.exe >nul 2>&1
if not errorlevel 1 goto :run_pwsh

where powershell.exe >nul 2>&1
if not errorlevel 1 goto :run_windows_powershell

>&2 echo Neither pwsh.exe nor powershell.exe is available on PATH.
goto :launcher_error

:run_pwsh
pwsh.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%CC_SCRIPT%" %*
set "CC_EXIT_CODE=%ERRORLEVEL%"
goto :launcher_done

:run_windows_powershell
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%CC_SCRIPT%" %*
set "CC_EXIT_CODE=%ERRORLEVEL%"
goto :launcher_done

:launcher_error
set "CC_EXIT_CODE=1"

:launcher_done
if "%CC_EXIT_CODE%"=="0" exit /b 0
>&2 echo Command Center exited with code %CC_EXIT_CODE%.
pause
exit /b %CC_EXIT_CODE%
