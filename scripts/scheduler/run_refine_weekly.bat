@echo off
REM REFINE Weekly Cycle — invoked by Windows Task Scheduler
REM Per SP.20 REFINE | F.30 scheduling | agents/chiron.md
REM Runs review -> extract -> foresee sequence (intervene + note + evolve manual per v1.0 spec)

"C:\Program Files\Git\bin\bash.exe" --login -c "cd $HOME/universal-sop && bash scripts/refine_review.sh && bash scripts/refine_extract.sh && bash scripts/refine_foresee.sh > cache/chiron/refine_$(date +%%Y%%m%%d).log 2>&1"
