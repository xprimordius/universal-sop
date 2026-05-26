@echo off
REM ============================================================
REM  install_output_stop_hook.cmd — manual installer for MTL RULE 6 mechanical enforcement
REM
REM  Stop hook target — configured in ~/.claude/settings.json
REM  Per user 2026-05-26: "fix this to perfect it"
REM  Closes the last 0.05/10 of quintessence — convention → code at output runtime
REM
REM  WHY MANUAL:
REM    Claude Code's auto-mode classifier blocks direct settings.json modification
REM    (correctly — user controls their own runtime config). User runs this once.
REM
REM  WHAT THIS DOES:
REM    1. Backs up existing ~/.claude/settings.json (if any)
REM    2. Merges a "Stop" hook entry pointing at scripts/output_stop_hook.sh
REM    3. Coexists with any existing Stop hook (Aurelius on_claude_stop.cmd) — both fire
REM
REM  USAGE (from user, ONE time per device):
REM    C:\Users\light\Documents\The Beginning\universal-sop\scripts\scheduler\install_output_stop_hook.cmd
REM
REM  UNINSTALL: edit ~/.claude/settings.json manually, remove the "validator_output_stop" entry.
REM ============================================================

setlocal enabledelayedexpansion

set "SETTINGS_DIR=%USERPROFILE%\.claude"
set "SETTINGS_FILE=%SETTINGS_DIR%\settings.json"
set "HOOK_SCRIPT=%~dp0..\output_stop_hook.sh"
set "TIMESTAMP=%date:~10,4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "TIMESTAMP=%TIMESTAMP: =0%"

echo ============================================================
echo  INSTALL OUTPUT_STOP_HOOK — MTL RULE 6 mechanical enforcement
echo ============================================================
echo  Hook script: %HOOK_SCRIPT%
echo  Settings:    %SETTINGS_FILE%
echo.

REM Create .claude dir if missing
if not exist "%SETTINGS_DIR%" (
  mkdir "%SETTINGS_DIR%"
  echo Created %SETTINGS_DIR%
)

REM Backup existing settings.json if it exists
if exist "%SETTINGS_FILE%" (
  copy "%SETTINGS_FILE%" "%SETTINGS_FILE%.backup_%TIMESTAMP%" > nul
  echo Backed up existing settings.json to settings.json.backup_%TIMESTAMP%
) else (
  echo No existing settings.json — will create fresh.
  echo {} > "%SETTINGS_FILE%"
)

echo.
echo MANUAL STEP REQUIRED ^(auto-mode blocks settings.json edits^):
echo.
echo Please edit %SETTINGS_FILE% and add the following to the "hooks" section:
echo.
echo   {
echo     "hooks": {
echo       "Stop": [
echo         {
echo           "matcher": "",
echo           "hooks": [
echo             {
echo               "type": "command",
echo               "command": "bash '%HOOK_SCRIPT:\=/%'"
echo             }
echo           ]
echo         }
echo       ]
echo     }
echo   }
echo.
echo If a "Stop" array already exists ^(e.g. Aurelius on_claude_stop^),
echo APPEND the new hook entry alongside it — both will fire.
echo.
echo After saving, restart Claude Code for the hook to take effect.
echo.
echo To verify it's active:
echo   1. Make any Claude output ^(or wait for the next response^)
echo   2. Check cache/OUTPUT_LOG.md — a new row should appear automatically
echo   3. If validator detects ^>=3 FAILs, the response will be BLOCKED and re-prompted
echo.
echo ============================================================

endlocal
