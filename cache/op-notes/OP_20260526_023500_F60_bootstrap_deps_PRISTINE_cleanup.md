# OP NOTE — F.60 closure · bootstrap_dependencies.sh · PRISTINE 2-issue cleanup

**Device:** aurelion
**Timestamp:** 2026-05-26 02:35 CDT
**Driver:** Autonomous loop tick (dynamic pacing) — executing NEXT ACTION from prior turn's RAE: "Ship `scripts/bootstrap_dependencies.sh` + file F.60"
**Predecessor:** OP_20260526_022500_RULE65_full_SOP_expression.md (express_sop ship + Q.3 sub-agent caught jq-missing finding)

## What changed

### NEW
1. **`scripts/bootstrap_dependencies.sh`** (~105 lines) — F.60 closure. Probes 5 REQUIRED + 4 RECOMMENDED tools with `command -v`. Modes: full / `--quiet` / `--strict`. Dogfood on aurelion: jq is the only WARN.

### UPDATED
2. **`CLAUDE.md`** line 75 — dead ref to `cache/PRIME_SOP.md` fixed. Now points to actual archived location `cache/backups/20260314_090000_v11_session6_prerebuild/PRIME_SOP.md` with explicit "archived during F1 fusion" annotation.
3. **`PROTOCOLS_REFERENCE.md`** — added entries for `invoke_sub_agent.sh`, `express_sop.sh`, `bootstrap_dependencies.sh`. Also enhanced `output_stop_hook.sh` entry to document the Q.3-caught last-assistant jq idiom fix.
4. **`cache/FAILURE_LEDGER.md`** — F.60 entry filed (full schema: Type / First Observed / Times / Root Cause / Permanent Fix / Fixed / Verified / Lesson / Related).

## ✅ PROVE-IT 9-POINT

| # | Item | Detail |
|:-:|------|--------|
| 1 | QA | Self-audit; Q.3 invoke_sub_agent dogfood was the trigger for THIS op (caught the jq-missing edge case last turn) — meta-validation of the validation pattern. |
| 2 | Test | bootstrap_dependencies.sh dogfooded on aurelion: 5 REQUIRED OK + 3/4 RECOMMENDED OK + 1 WARN (jq). Exit 0 in default mode, would exit 1 with --strict. E2E expected 9/9 pre-push. |
| 3 | Quality | F.60 closed with proper structural fix (script, not workaround). PRISTINE 2-issue cleanup: invoke_sub_agent now registered + PRIME_SOP dead ref repaired. Expected PRISTINE next run: ✅ 0/9. |
| 4 | Bottlenecks | None. |
| 5 | Constraints | bootstrap_dependencies.sh exists but is NOT YET chained into bootstrap_verify.sh — running it requires manual invocation. Chaining is a follow-on (next tick candidate). |
| 6 | Errors | None this op. |
| 7 | Break points | If a new script introduces a new external dependency without adding it to bootstrap_dependencies.sh, the silent-fallback regression returns. Mitigation suggested: VL.14 validator probe (grep new scripts for `command -v` patterns or invocations of common tools not yet in the dependency list). Could add to add_protocol.sh as Tier B reminder. |
| 8 | Improve/Resolve | scripts/bootstrap_dependencies.sh NEW; CLAUDE.md:75 dead-ref fixed; PROTOCOLS_REFERENCE.md +3 script entries + 1 enhanced entry; cache/FAILURE_LEDGER.md F.60 entry added (35+ lines). |
| 9 | Foresight | (a) **Next-tick**: chain bootstrap_dependencies.sh into bootstrap_verify.sh as Section 0. (b) **Sprint 4 Item H** (mcp_config.json) still queued — depends on user MCP client preference. (c) **APW Module 4.1** remains macro goal; this loop should pause SOP-side work soon and let user redirect to APW. (d) **F-class trend**: F.58→F.59→F.60 all in 24-hour window — increasing structural-completeness rate, but also signals that prior "10/10 STRUCTURAL" was premature; revising mental model to "10/10 means substantial completeness with active maintenance" not "perfect forever". |

## Backup rows

#419 (CLAUDE.md), #420 (PROTOCOLS_REFERENCE), #421 (FAILURE_LEDGER pre-F60)

## Companion files

- `scripts/bootstrap_dependencies.sh` (NEW)
- `CLAUDE.md` (dead-ref fix)
- `PROTOCOLS_REFERENCE.md` (3 new + 1 enhanced entries)
- `cache/FAILURE_LEDGER.md` (F.60)
- `cache/op-notes/OP_20260526_022500_RULE65_full_SOP_expression.md` (predecessor)
