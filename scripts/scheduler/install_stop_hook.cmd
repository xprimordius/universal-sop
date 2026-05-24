@echo off
REM ============================================================
REM  install_stop_hook.cmd — installs Claude Code Stop hook
REM
REM  Adds hooks.Stop entry to ~/.claude/settings.json pointing at
REM  scripts/scheduler/on_claude_stop.cmd in this repo.
REM
REM  USER RUNS THIS MANUALLY — Claude's auto-mode classifier blocks
REM  self-modification of agent config (correct safety guard).
REM
REM  Idempotent — safe to re-run.
REM ============================================================

setlocal enabledelayedexpansion

set SETTINGS=%USERPROFILE%\.claude\settings.json
set HOOK_CMD=%USERPROFILE%\universal-sop\scripts\scheduler\on_claude_stop.cmd

echo Installing Claude Code Stop hook...
echo   Settings file: %SETTINGS%
echo   Hook target:   %HOOK_CMD%
echo.

if not exist "%SETTINGS%" (
  echo ERROR: %SETTINGS% does not exist. Run Claude Code at least once first.
  exit /b 1
)

if not exist "%HOOK_CMD%" (
  echo ERROR: %HOOK_CMD% does not exist. Make sure repo is cloned to %USERPROFILE%\universal-sop
  exit /b 1
)

REM Backup settings before edit
copy /Y "%SETTINGS%" "%SETTINGS%.bak" >nul
echo Backed up: %SETTINGS%.bak

REM Use PowerShell + ConvertFrom-Json to merge (idempotent)
powershell -nop -Command ^
  "$s = Get-Content '%SETTINGS%' -Raw | ConvertFrom-Json;" ^
  "if (-not $s.hooks) { $s | Add-Member -NotePropertyName hooks -NotePropertyValue ([pscustomobject]@{}) -Force };" ^
  "if (-not $s.hooks.Stop) { $s.hooks | Add-Member -NotePropertyName Stop -NotePropertyValue @() -Force };" ^
  "$exists = $s.hooks.Stop | Where-Object { $_.handler.command -eq '%HOOK_CMD:\=\\%' };" ^
  "if (-not $exists) {" ^
  "  $entry = [pscustomobject]@{ matcher = '.*'; handler = [pscustomobject]@{ type = 'command'; command = '%HOOK_CMD:\=\\%' } };" ^
  "  $s.hooks.Stop = @($s.hooks.Stop) + $entry;" ^
  "  $s | ConvertTo-Json -Depth 10 | Set-Content '%SETTINGS%' -Encoding UTF8;" ^
  "  Write-Host '[OK] Stop hook installed' } else { Write-Host '[OK] Already installed (idempotent)' }"

echo.
echo Verify with:
echo   type "%SETTINGS%"
echo.
echo To uninstall:
echo   copy "%SETTINGS%.bak" "%SETTINGS%"
endlocal
