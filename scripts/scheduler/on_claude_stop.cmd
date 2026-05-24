@echo off
REM ============================================================
REM  on_claude_stop.cmd — fires when Claude Code session ends.
REM
REM  Stop hook target — configured in ~/.claude/settings.json
REM  Per Aurelius on_claude_stop.cmd pattern (DELIVERABLE A from A+B+C bundle)
REM
REM  Does THREE things in order:
REM    1. Backgrounds session_capture (writes session note to cache/sessions/)
REM    2. Runs pulse_check.sh (--quiet, exit code → JSON)
REM    3. Echoes JSON to Claude Code UI ("Captured + pulse N/5" toast)
REM
REM  Why this matters:
REM    Before this hook, capturing session state required manual CONTINUATION.md
REM    writes. Pulse Check was self-check by same model. Now it's automatic
REM    on every session end — Tier 3 of F.19 ARCHITECTURALLY CLOSED.
REM ============================================================

setlocal

set REPO=%USERPROFILE%\universal-sop
set BASH=C:\Program Files\Git\bin\bash.exe
set CAPTURE_LOG=%REPO%\cache\sessions\stop_hook.log

REM Ensure log directory exists
if not exist "%REPO%\cache\sessions" mkdir "%REPO%\cache\sessions" 2>nul

REM 1. Background session capture (non-blocking)
start "Universal SOP session capture" /B "%BASH%" --login -c "cd $HOME/universal-sop && bash scripts/sync_status.sh >> cache/sessions/stop_hook.log 2>&1 && date >> cache/sessions/stop_hook.log"

REM 2. Run pulse_check.sh quiet mode + capture exit
"%BASH%" --login -c "cd $HOME/universal-sop && bash scripts/pulse_check.sh --quiet 2>/dev/null"
set PULSE_EXIT=%ERRORLEVEL%

REM 3. JSON output back to Claude Code UI
if %PULSE_EXIT%==0 (
  echo {"systemMessage": "Session captured + Pulse 5/5 PASS"}
) else (
  echo {"systemMessage": "Session captured + Pulse FAILED — investigate"}
)

endlocal
