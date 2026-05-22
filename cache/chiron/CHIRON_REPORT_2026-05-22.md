# 🔬 Chiron Report — 2026-05-22

**Device:** aurelia
**Commit:** a3d4290
**Generated:** 2026-05-22 06:06

---

## Summary

| Metric | Value |
|---|---|
| Drift candidates total | 29 |
| Dormant protocols | 9 |
| SIR rows (lifetime) | 5 |
| SIR rows (this month) | 5 |

---

## Coverage Audit Output

```
═══════════════════════════════════════════════════════════════
🔬 PROTOCOL COVERAGE AUDIT
═══════════════════════════════════════════════════════════════
Device: aurelia  ·  Date: 2026-05-22  ·  Commit: a3d4290

── DIRECTION A: Documented MANDATORY protocols → Activity
   (sampling last 20 commits' messages + diffs)

  ❌ SP.5  FSP   Fidelity Substantiation            0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ SP.6  IAC   Intent Alignment Check             0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ SP.9  FE    Foresight Engine                   2/20 commits ( 10%)  DORMANT (F.23 pattern)
  ❌ SP.12 HFR   Honest Failure Report              0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ SP.15 EEP   Execution Enforcement              0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ SP.17 SIR   System Improvement Reflect         0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ SP.18 SSC   Sync Status Confirmation           4/20 commits ( 20%)  DORMANT (F.23 pattern)
  ❌ SP.21 MES   Model Effort Selector              0/20 commits (  0%)  DORMANT (F.23 pattern)
  ❌ EN.1  Skel  Output Skeleton                    0/20 commits (  0%)  DORMANT (F.23 pattern)
  ✅ EN.4  Pulse Pulse Check                       12/20 commits ( 60%)

── DIRECTION B: scripts/ + agents/ → PROTOCOLS_REFERENCE entry

  ⚠️ 14 script(s) missing formal entry:
       • add_protocol.sh
       • check_device_activity.sh
       • chiron_run.sh
       • meta_verify.sh
       • protocol_coverage_audit.sh
       • qc.sh
       • refine_evolve.sh
       • refine_extract.sh
       • refine_foresee.sh
       • refine_intervene.sh
       • refine_note.sh
       • refine_review.sh
       • setup_device.sh
       • verifier.sh

  ⚠️ 6 agent(s) missing formal entry:
       • refine_evolution.md
       • refine_extractor.md
       • refine_foresight.md
       • refine_intervention.md
       • refine_reviewer.md
       • refine_scribe.md

═══════════════════════════════════════════════════════════════
📊 COVERAGE AUDIT SUMMARY
═══════════════════════════════════════════════════════════════
  Direction A (activity):
    Active (≥50%):       1
    Under-fired (25–49%): 0
    Dormant (<25%):       9
  Direction B (formalization):
    Missing scripts:      14
    Missing agents:       6

Drift candidates total: 29

Suggested cadence: monthly OR before any new SubSOP / new script commit.
Owner: Chiron (agents/chiron.md). File new F-class entry if pattern recurs ≥3 times.
═══════════════════════════════════════════════════════════════
```

---

## Chain Health Output

```
📊 CHAIN HEALTH AUDIT
================================================
Window: last 10 chain-run rows

📋 Per-agent recent activity:
  Verifier: 1 runs · 2 total passes · 6 total warnings
  Validator: 1 runs · 8 total passes · 2 total warnings
  QC: 2 runs · 20 total passes · 2 total warnings
  Meta-Verifier: 3 runs · 17 total passes · 4 total warnings

🔍 Chain completeness check (last 10 rows):
  ⚠️ commit 1c9c076: only 1/4 agents fired

📈 Warning rate: 14 warnings / 10 runs = 1.4 warnings/run
  ✅ Warning rate within expected band (<2.0/run)

================================================
✅ Chain health audit complete. Run periodically (suggested: every 10 commits).
```

---

## Chiron Recommendations (auto-generated)

1. If **Dormant > 0**: review each dormant protocol; either promote enforcement (add Pulse Check item + Validator check) OR deprecate from MANDATORY_TIGHT_LOOP
2. If **unformalized scripts > 5**: schedule batch formalization commit (add PROTOCOLS_REFERENCE entries)
3. If **SIR recurrence ≥ 3** for any insight: promote to FAILURE_LEDGER F-class entry
4. **Weekly REFINE cycle:** run `bash scripts/refine_review.sh && refine_extract.sh && refine_foresee.sh` (separate cadence from this monthly Chiron run)

---

## Owner
[`agents/chiron.md`](../../agents/chiron.md)

## Next Chiron run
1st of next month, ~08:00 (per scheduler entry — see `agents/chiron.md` § Automatic invocation)
