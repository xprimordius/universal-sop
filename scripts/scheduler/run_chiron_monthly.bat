@echo off
REM Chiron Monthly Audit — invoked by Windows Task Scheduler
REM Per F.30 + agents/chiron.md | Registered via schtasks (see chiron.md for command)
REM Portable across Windows devices via $HOME (Git Bash translates to %USERPROFILE%)

"C:\Program Files\Git\bin\bash.exe" --login -c "cd $HOME/universal-sop && bash scripts/chiron_run.sh > cache/chiron/cron_$(date +%%Y%%m%%d).log 2>&1"
