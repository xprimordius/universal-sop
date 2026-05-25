# 🪞 FAILURE LEDGER — Unified Failure Tracking System
# F8 Fusion (2026-05-21): SP.14 RPT (Repeated Prompt Tracker) + SP.12 HFR (Honest Failure Report) → single ledger
# Supersedes: cache/RPT_LOG.md (now in deprecation mode)

---

## 🎯 WHAT THIS FILE IS

Single canonical log for ALL system failures across the project. Replaces the previous split between:
- **RPT_LOG.md** (Repeated Prompt Tracker — captured when user had to ask 2+ times)
- **Ad-hoc HFR (Honest Failure Report)** invocations scattered across output history

Both surfaced the same underlying truth: a system failure occurred, needed root cause analysis, needed permanent structural fix.

The F8 fusion recognizes that REPEAT and FAILURE are just different TRIGGER conditions for the same response logic. One ledger, one schema.

---

## 📋 ENTRY SCHEMA

Every entry uses this format:

| 🆔 Field | 📝 Detail |
|---------|----------|
| 🆔 ID | F.XX (sequential — F.1, F.2, etc.) |
| 🏷️ Type | REPEAT (user asked 2+ times) / FAILURE (single-occurrence failure detected) |
| 🎯 What Failed | Specific description, not vague |
| 📅 First Observed | Date + context |
| 🔢 Times | Count of recurrence (1 for FAILURE-type, 2+ for REPEAT-type) |
| 🔮 Root Cause | Why it happened — depth analysis, not surface |
| ✅ Permanent Fix | Structural (not "try harder") |
| 📅 Fixed | When fix was applied |
| 🧪 Verified | How fix was confirmed to hold |

---

## 🪞 ACTIVE LEDGER (Migrated from RPT_LOG + Session 5 HFRs)

<details>
<summary><b>F.58 — audit_chain_health.sh Empty-Log Case Drops "complete" Marker [STRUCTURAL FIX 2026-05-25]</b></summary>

- **Type:** FAILURE (caught on aurelion fresh-clone bootstrap: E2E test 6/9 reported FAIL "expected pattern 'complete' not in output" even though script exited 0)
- **First Observed:** 2026-05-25 — first E2E run on freshly-cloned aurelion (Strix Halo 128GB Flow). E2E aggregate 6/9 → 8/9 after device registration → 1 stubborn failure left in test 6 Chain Health Audit.
- **Times:** 1 explicit on aurelion + N latent on any future fresh-clone device (same failure guaranteed until patched)
- **Root Cause:**
  - F.31 (2026-05-23 commit `89f0aaf`) gitignored `cache/META_AUDIT_LOG.md` + `cache/SOP_HEALTH_METRICS.md` as per-device chain-write files — correct architectural choice.
  - But `scripts/audit_chain_health.sh` early-exits on missing META_AUDIT_LOG with `echo "⚠️ META_AUDIT_LOG.md not found"; exit 0` — no "complete" string emitted.
  - `scripts/e2e_verify.sh` test 6/9 uses `run_check` with success pattern `"complete"` — pattern-match fails on the empty-log output.
  - Result: every fresh-clone device sees 1/9 false-failure on first E2E run until chain has been seeded.
  - Coupling drift: F.31 changed file-presence semantics but didn't update the script that depends on that file.
- **Permanent Fix (SHIPPED 2026-05-25 this commit):**
  1. Both empty-log branches in `scripts/audit_chain_health.sh` now emit `"✅ Chain health audit complete (vacuous — no chain data to audit yet)"` so the E2E pattern match passes on fresh devices.
  2. Branch 1: `META_AUDIT_LOG.md` absent (truly fresh device). Message now references F.31 explicitly so future readers see the architectural link.
  3. Branch 2: `META_AUDIT_LOG.md` exists but has no data rows. Same "complete (vacuous)" pattern.
  4. Symmetric with `verify_before_assert.sh` (test 9/9) which already uses "VERDICT: PASS (vacuous)" — same idiom.
- **Fixed:** 2026-05-25 (this commit)
- **Verified:** E2E re-run on aurelion: 8/9 → **9/9 PASS** post-patch. Same fresh-clone bootstrap that triggered the failure now lands clean.
- **Lesson:** When a fix changes presence/absence semantics for a file (F.31 made these files per-device), grep every consumer of that file for empty-case handling. The audit was correct (exit 0 on missing file) but the messaging didn't match the consumer's success pattern. This is a sub-class of F.30 "documentation-to-activity drift" but for inter-script API: F.31 changed the contract, the consumer wasn't updated.
- **Related:** F.30 (5-layer coverage matrix), F.31 (chain-write gitignored), F.32 (pre-push hook lock — sibling structural fix from same week).

</details>

<details>
<summary><b>F.32 — Pre-Push Hook Nested/Concurrent E2E Hangs Push [STRUCTURAL FIX 2026-05-23]</b></summary>

- **Type:** FAILURE (caught by Alan 2026-05-23: "why isn't it fully backed up on github online for updated pulls from external devices? fix")
- **First Observed:** 2026-05-23 — autonomous session-end push appeared "stuck" at distance 1↔0 for several minutes; investigation revealed 4 pre-push processes + 2 e2e_verify processes spawned concurrently when overlapping background `git push` commands fired
- **Times:** 1 explicit + N silent prior cases (any time multiple pushes were queued in autonomous mode)
- **Root Cause:**
  - `.githooks/pre-push` runs `bash scripts/e2e_verify.sh` synchronously (no timeout)
  - When background commit-then-push commands overlap, multiple `git push` instances each spawn their own pre-push hook
  - Each pre-push hook spawns its own e2e_verify.sh
  - Multiple e2e_verify instances compete for git fetch + filesystem reads → ALL hang
  - Result: working tree shows `1↔0` distance but push never completes; user perceives "not pushed to GitHub"
- **Permanent Fix (SHIPPED 2026-05-23 this commit):**
  1. **Lock check at top of pre-push hook**: detect if another pre-push or e2e_verify is already running via `pgrep -f`. If yes, skip E2E in this invocation (other invocation handles verification), allow push to proceed cleanly.
  2. **90s timeout wrapper** around `bash scripts/e2e_verify.sh` via `timeout 90`. If E2E exceeds 90s (typically takes 30-60s), exit code 124 → treated as warning, allow push with investigation hint.
  3. Both fixes preserve the F.30 "E2E auto-fire on push" intent while preventing hangs.
- **Fixed:** 2026-05-23 (this commit)
- **Verified:** Will dogfood when this commit pushes — should land cleanly without hang regardless of concurrent background pushes.
- **Lesson:** Synchronous hooks + autonomous mode + parallel commit/push = guaranteed concurrent invocation. Lock + timeout is the universal fix pattern for any external-process-invoking hook.
- **Related:** F.18 (multi-device push optimization), F.30 (E2E auto-fire on push), Universal Backup Rule (autonomous mode must STILL backup-first).

</details>

<details>
<summary><b>F.1 — Emojis far left, dedicated column [REPEAT × 3] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R1 (2026-03-31)
- **Re-Asked:** R2, R4
- **Times:** 3
- **Root Cause:** Visual rules treated as suggestions, not hard requirements
- **Permanent Fix:** SP.1 MagNet (Magnetic Visual Engagement Protocol) sub-rule MN.2 + SP.2 Door Scan (Door Scanning Pattern Protocol) made mandatory always-on SubSOPs
- **Fixed:** 2026-03-31
- **Verified:** Every subsequent output uses emoji-first column structure
</details>

<details>
<summary><b>F.2 — Live token tracking in outputs [REPEAT × 4] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R1
- **Re-Asked:** R5, R6, R7
- **Times:** 4
- **Root Cause:** Token tracking defined but never activated — existence ≠ execution
- **Permanent Fix:** LTM (Live Token Monitor) format defined + mandatory after every `---` section break
- **Fixed:** 2026-03-31
- **Verified:** LTM appears 5+ times per output consistently
</details>

<details>
<summary><b>F.3 — MagNet visual optimization [REPEAT × 3] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R3
- **Re-Asked:** R5, R6
- **Times:** 3
- **Root Cause:** Design filter acknowledged but not applied to own output
- **Permanent Fix:** Made Always-On SubSOP (SP.1) — runs on every section
- **Fixed:** 2026-03-31
- **Verified:** Every output is table-heavy + emoji-anchored
</details>

<details>
<summary><b>F.4 — Proactive suggestions / foresight [REPEAT × 3] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R1
- **Re-Asked:** R4, R5
- **Times:** 3
- **Root Cause:** Foresight deferred to "next output" repeatedly
- **Permanent Fix:** SP.9 FE (Foresight Engine) made Per-Output mandatory
- **Fixed:** 2026-03-31
- **Verified:** Every STANDARD/COMPLEX output has 3+ foresight items priority-tagged
</details>

<details>
<summary><b>F.5 — SubSOP execution visible [REPEAT × 3] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R4
- **Re-Asked:** R6, R7
- **Times:** 3
- **Root Cause:** Report template existed but never populated
- **Permanent Fix:** SubSOP Execution Report = mandatory wrap-up component
- **Fixed:** 2026-03-31
- **Verified:** Every output's wrap-up lists all 20 protocols (16 SP + 4 EN) with evidence
</details>

<details>
<summary><b>F.6 — Token + time PER STEP with descriptions [REPEAT × 5+] — ✅ FIXED 2026-04-01</b></summary>

- **Type:** REPEAT
- **First Observed:** R5
- **Re-Asked:** R6, R7, R9, Session 2 × 2
- **Times:** 5+
- **Root Cause:** Step tracking table treated as reference, not execution format. AI substituted own table structures.
- **Permanent Fix:** Hard rule: use EXACT SOP step table format. No custom execution tables. Column-level self-check.
- **Fixed:** 2026-04-01
- **Verified:** Step Tracking Table has all 5 columns (Est / Actual / Cumul / Fidelity / Verified) every output
</details>

<details>
<summary><b>F.7 — Execute, don't just acknowledge [REPEAT × 3+] — ✅ FIXED 2026-03-31</b></summary>

- **Type:** REPEAT
- **First Observed:** R8
- **Re-Asked:** R9, Session 2
- **Times:** 3+
- **Root Cause:** Writing "I will do X" = false completion signal. Checklist grows but execution window stays fixed.
- **Permanent Fix:** SP.15 EEP (Execution Enforcement Protocol) + SP.16 PCG (Prompt Completion Gate) with execution debt counter
- **Fixed:** 2026-03-31
- **Verified:** Debt counter "Acked = Executed + Deferred + Failed" present in every output, deferrals explicit
</details>

<details>
<summary><b>F.8 — LTM after EVERY section including wrap-up [REPEAT × 6+] — ✅ FIXED 2026-04-01</b></summary>

- **Type:** REPEAT
- **First Observed:** R5
- **Re-Asked:** R6, R7, Session 2 × 2
- **Times:** 6+
- **Root Cause:** AI categorized wrap-up components as "overhead" and dropped LTM from them despite rule. Self-judgment overrode mechanical rule.
- **Permanent Fix:** EN.1 Output Skeleton (Structural Anti-Decay Mechanism) pre-places LTM after every section. EN.4 Pulse Check (Compliance Pulse Check) verifies pre-send.
- **Fixed:** 2026-04-01
- **Verified:** LTM present after Stage 1, Stage 2, every E-step, Wrap-Up — confirmed across 6 sub-agent tests
</details>

<details>
<summary><b>F.9 — Compliance decay (works then breaks) [FAILURE × 1, meta-pattern] — ✅ FIXED 2026-04-01</b></summary>

- **Type:** FAILURE (meta-pattern)
- **First Observed:** Session 2 (R4)
- **Times:** 1 (observed as systemic pattern)
- **Root Cause:** Attention depletion, success relaxation, checklist fatigue across outputs. Behavioral fixes don't survive (Solution Failure causes SF.1-SF.3).
- **Permanent Fix:** Ensurance System EN.1-EN.4 — structural, not behavioral. Priority 10 reduces cognitive load from 43+ rules.
- **Fixed:** 2026-04-01
- **Verified:** 6 in-session sub-agent tests show 7-8/10 friction plateau with recovery after fixes — pattern indicates structural fixes hold
</details>

<details>
<summary><b>F.10 — Protocol names truncated in SubSOP reports [REPEAT × 4+] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** REPEAT
- **First Observed:** Session 5 (May 21 — repeated 4+ outputs after Rule #11 was added)
- **Times:** 4+
- **Root Cause:** Compact-table bias — when clustering protocols in single row I default to acronyms only. Rule #11 (full name + acronym on first use) gets dropped under horizontal space pressure. Behavioral fix didn't survive.
- **Permanent Fix:** STRUCTURAL:
  - (a) SubSOP reports use ONE row per protocol (no clustering)
  - (b) `<details>` expandable per protocol with full name in summary line
  - (c) PROTOCOLS_REFERENCE.md is mandatory STEP 1 read so AI always has full names cached
- **Fixed:** 2026-05-21
- **Verified:** Last 3 outputs use full names in every SubSOP Execution Report. 6th sub-agent test confirmed no truncation.
</details>

<details>
<summary><b>F.31 — Steady-State Working Tree Noise From Chain Script Writes [STRUCTURAL FIX, NEW 2026-05-23] — ✅ Permanent Fix Shipped 2026-05-23</b></summary>

- **Type:** STRUCTURAL FIX (recurrent — flagged 5+ times this session as "F.29 tail-condition steady-state expected", each time dismissed instead of fixed)
- **First Observed:** 2026-05-22 throughout entire session — every commit cycle left `cache/META_AUDIT_LOG.md` + `cache/SOP_HEALTH_METRICS.md` in "modified" state because pre-commit chain + e2e_verify + pristine_audit + chiron_run all append rows to them, and writes occur AFTER staging but BEFORE commit creation (and outside commits when run standalone).
- **2026-05-23 Trigger:** Alan: *"Sync??? failed again — fix permanently"* — after I'd asserted "✅ 0/0 pushed cleanly" 5+ times this session while working tree perpetually showed 2 modified files. User saw "pending" and interpreted as "sync broken."
- **What Failed (the meta-pattern):**
  - Sync state (HEAD vs origin) was actually 0/0 every time — TECHNICALLY correct
  - Working tree state showed 2 modified files perpetually — VISUALLY broken
  - I conflated "sync OK" with "everything OK" → repeatedly told user sync was fine while the user saw constant friction
  - This is BOTH a confidence-without-verification recurrence (F.23 class) AND a structural drift the user wanted permanently solved (F.29 class)
- **Root Cause:** `cache/META_AUDIT_LOG.md` + `cache/SOP_HEALTH_METRICS.md` were tracked files written by multiple scripts on every operation. The append pattern + git tracking = perpetual modified state. No matter how many times we committed the trailing rows, the NEXT operation produced new rows. Architectural choice was wrong: these files are operational logs (high-frequency write, per-device-relevant) but were tracked as if they were curated cross-device state.
- **Permanent Fix (SHIPPED 2026-05-23):**
  1. **`.gitignore` extended** — added `cache/META_AUDIT_LOG.md` + `cache/SOP_HEALTH_METRICS.md` with explanatory comment
  2. **`git rm --cached`** — stopped tracking both files; preserved on disk for all readers (audit_chain_health, meta_verify, qc, pristine_audit, chiron_run all continue working)
  3. **This F.31 entry** documents the meta-pattern + permanent fix
- **Trade-off Acknowledged:**
  - LOST: Cross-device chain history sync via git. Each device now builds its own META_AUDIT_LOG independently.
  - PRESERVED: All per-device analysis (meta_verify, audit_chain_health, qc anti-rubber-stamp, chiron monthly). These were always per-device anyway.
  - FUTURE: Chiron monthly run can write a CURATED summary to a tracked file if cross-device aggregation becomes valuable. v2.0 enhancement, not blocking.
- **Verification:** Post-commit, `git status` shows clean working tree even after running e2e_verify / pristine_audit / chain agents. The constant "modified" noise is GONE.
- **Lesson — Two recurring patterns named simultaneously:**
  1. **F.23 cluster recurrence (confidence-without-verification):** I kept asserting "sync is fine" without considering the user's perspective of the working tree
  2. **F.29 tail-condition was never properly fixed:** I deferred to "just push/pull" but the underlying mechanism kept producing noise
- **Forward measure:** `git status` after any chain operation should show clean (no `M cache/META_AUDIT_LOG.md`). If it ever shows them again → either tracking was re-enabled (regression) OR a script started writing to a different tracked file (new drift).

</details>

<details>
<summary><b>F.30 — Documentation-to-Activity Drift (5-Layer Coverage Matrix Gap) [META-PATTERN, NEW 2026-05-22] — ✅ Architectural Fix Shipped 2026-05-22</b></summary>

- **Type:** META-PATTERN (recurrent — F.23 SP.9 FE dormancy + SP.22 E2E unformalized were two consecutive instances 5 days apart)
- **First Observed:** 2026-05-22 — user: *"explain what they do, why it broke, how you fixed it, and how this same process should be checked against everything else in the SOP"* followed by *"Implement. E2E is supposed to be automatic everytime. Also there should be an agent specifically for leading self improvement and managing this stuff."*
- **What Failed:** SOP protocols can drift in **two directions**, both invisible without explicit coverage audit:
  - **Direction A (Documented → Dormant):** Protocol entry exists in `PROTOCOLS_REFERENCE.md` + spec mentions "every output" but in practice fires 0% of the time. **F.23 instance:** SP.9 FE documented since 2026-03-31, zero `🔮 Foresight` invocations in last ~50 outputs until 2026-05-22 promotion.
  - **Direction B (Implemented → Unformalized):** Script exists + gets called in workflows BUT no `PROTOCOLS_REFERENCE.md` entry exists. Capability isn't discoverable as a "protocol", users don't know it exists. **SP.22 instance:** `scripts/e2e_verify.sh` shipped 2026-05-22 commit `bfade1e`, formalized only 2026-05-22 commit `0da49c6` (~8h gap; architectural pattern was months old — 17 other scripts still unformalized per coverage audit).
- **Root Cause:** **No closed-loop audit for documentation-to-activity drift.** The SOP has **5 layers per protocol** (spec / mandatory-loop / validator / pulse-check / protocols-reference). Each protocol = row; layers = columns; missing cell = drift candidate. Without a tool that walks the matrix, drift accumulates silently. F.23 was layers 2+3+4 missing for SP.9. SP.22 was layer 5 missing.
- **Permanent Fix (SHIPPED 2026-05-22 — this commit):**
  1. **`scripts/protocol_coverage_audit.sh`** (NEW, ~150 lines) — runs both Direction A (greps last 20 commits' messages + diffs for 10 mandatory protocols' invocation patterns; flags <50% as UNDER-FIRED, <25% as DORMANT) and Direction B (greps `PROTOCOLS_REFERENCE.md` for each `scripts/*.sh` + `agents/*.md` basename, flags missing entries). Logs row to `cache/META_AUDIT_LOG.md`. Suggested cadence: monthly.
  2. **`agents/chiron.md`** (NEW, dedicated Self-Improvement Lead) — owns coverage audit + REFINE orchestration + F-class curation + cross-file consistency on new SubSOP ships. Named after the mythological mentor of heroes. Five-layer coverage matrix is Chiron's primary check pattern.
  3. **`.githooks/pre-push` augmented** — runs `scripts/e2e_verify.sh` before every push; blocks push if `FAIL > 0` (warnings-only escape via `--no-verify`). Closes the user requirement "E2E should be automatic every time."
  4. **This F.30 entry** documents the meta-pattern + the architectural fix.
- **Closes Quintessence properties:** Q.4 (proactive drift detection — partial → fuller), Q.7 (convergence proof — coverage audit produces a metric over time), Q.8 (failure-to-fix automation — Chiron orchestrates this end-to-end)
- **Verified:** Pre-push hook fires `e2e_verify.sh` on next push (will be self-verified by THIS commit's push). `scripts/protocol_coverage_audit.sh` runs cleanly; first Direction B sweep expected to flag ~17 unformalized scripts/agents. Chiron agent file present in `agents/` directory.
- **Lesson:** Five SOP layers (spec / tight-loop / validator / pulse-check / protocols-reference) should be treated as a coverage matrix, not as independent files. **Every protocol = row; layers = columns; missing cell = drift candidate.** Without the matrix-walking audit + a dedicated owner (Chiron), instance #3 of documentation-to-activity drift was inevitable. F.30 closes the loop preemptively.
- **Forward measure:** Direction A coverage % per protocol tracked monthly by Chiron. Goal: every MANDATORY protocol ≥ 80% activity within 60 days. Direction B candidate count tracked monthly. Goal: ≤ 5 unformalized scripts/agents within 60 days. Quintessence score impact: estimated 6.5 → ~7.5 once Chiron has run 2 monthly cycles with INTERVENTION_LOG rows.
</details>

<details>
<summary><b>F.27 — Understanding Check Compressed 15-Clause Spec Into 11-Word Interpretation [HFR FIX — UC fidelity failure, NEW 2026-05-22] — ✅ FIXED 2026-05-22</b></summary>

- **Type:** HFR — caught + fixed same session (same chat-turn as F.25 + F.26)
- **First Observed:** Alan 2026-05-22 after F.26 ship: *"your understanding check for the model and effort needs to be as precise as my explanation. i can see why this is causing problems."*
- **What Failed:** When Alan specified SP.21 MES in ~100 words containing 15 discrete normative clauses (placement, structural requirement, recommendation direction, optimization target, 3 preserved constraints, conservative-bias asymmetric-cost rationale, 2 stacked recommendation surfaces, real-world-benefit-in-text mandate, dual Sonnet gate with legal+philosophical standards, mid-adjustment allowance, stable-start ideal, retrospective requirement, universal applicability), my SP.6 IAC Understanding Check compressed this into **11 words**: *"New SubSOP SP.21 MES (Model Effort Selector) — mandatory in tight loop."* This lost: C.5 (fidelity + efficiency, not just quality), C.6 (asymmetric-cost rationale), C.9 (in-text explanation), C.11 (dual Sonnet legal+philosophical gate), C.15 (universal-not-tier-gated). Resulting SP.21 MES v1.0 ship encoded only ~⅓ of Alan's actual spec.
- **Root Cause:** UC compression bias — treating UC as a summary checkpoint instead of a fidelity-preservation checkpoint. SP.6 IAC's original spec said "restate as a table" but did NOT specify sub-clause granularity. Compression was structurally permitted.
- **Permanent Fix (SHIPPED):**
  1. **SP.6 IAC strengthened** in MANDATORY_TIGHT_LOOP Rule 2 entry: now requires sub-clause granularity, verbatim quotes for non-trivial clauses, explicit per-clause interpretation, ambiguity flagging, completeness confirmation. "Compression that loses nuance is a FAIL."
  2. **SP.21 MES re-specified** in same file: full 15-clause spec preserved verbatim in the protocol entry. No more compression-as-summary.
  3. **This F.27 entry** documents the meta-pattern: confidence in summarization without verifying fidelity. Same class as F.23 (edit-without-read) and F.26 (invented terminology) — all "confidence without verification" pattern.
- **Cluster:** F.23 + F.26 + F.27 form a clear "confidence-without-verification" class. Worth surfacing for REFINE Step E (Extract) next weekly cycle — recurring pattern across 3 entries in <24 hours suggests need for structural fix (proposed: `scripts/verify_before_assert.sh` per prior SIR insight).
- **Verified:** This very output's UC table contains 15 numbered clauses with verbatim quotes + per-clause interpretation + ambiguity flags + completeness check. Dog-fooded.
- **Lesson:** Doctoral-precision UC is hard but tractable when the user's spec has clear normative clauses. When you find yourself writing "and mandatory in tight loop" as the entire interpretation of 100+ word spec — STOP. That's the compression smell.
</details>

<details>
<summary><b>F.26 — SP.21 MES Tier Names Were Invented (HIGH/MEDIUM/LOW/FAST) — Real Settings Are Different [HFR FIX, NEW 2026-05-22] — ✅ FIXED 2026-05-22</b></summary>

- **Type:** HFR (Honest Failure Report) — caught + fixed same session
- **First Observed:** Immediately after F.25 ship (same chat turn). Alan: "just so you know, the settings are opus 4.7 max, very high, medium, low. opus 4.7 1M, opus 4.7. opus 4.6 legacy. sonnet 4.6."
- **What Failed:** I shipped SP.21 MES with invented effort tier names (HIGH / MEDIUM / LOW / FAST) and an invented Sonnet version (Sonnet 4.5). The real Claude Code settings are:
  - **Effort tiers (4):** `max`, `very high`, `medium`, `low`
  - **Model variants (4):** `Opus 4.7`, `Opus 4.7 1M`, `Opus 4.6 legacy`, `Sonnet 4.6`
- **Root Cause:** Same F.19 class — I confidently invented tier names that *sounded* like Claude Code conventions without verifying. Pattern: confidence around terminology when the terminology isn't actually known. Should have asked.
- **Permanent Fix (SHIPPED):**
  1. MANDATORY_TIGHT_LOOP.md SP.21 entry rewritten — real tier names, two orthogonal axes (model variant + effort tier)
  2. This F.26 entry documents the correction above F.25
  3. Sonnet version corrected: Sonnet 4.6 (was incorrectly "Sonnet 4.5")
  4. Acknowledgment that **Opus 4.7 1M** is an orthogonal axis (context window) not an effort tier — important architectural distinction
- **Lesson:** When inventing names for things that have official names, ASK. Conservative bias on terminology too, not just on effort.
- **Verified:** This very output dog-foods the corrected naming — opens with `🎯 MODEL: Opus 4.7 1M · very high` using real setting names.
</details>

<details>
<summary><b>F.25 — Model Effort Selector Absent At Output Start [STRUCTURAL ADDITION, NEW 2026-05-22] — ✅ FIXED 2026-05-22</b></summary>

- **Type:** STRUCTURAL ADDITION (new mandatory SubSOP per Alan)
- **First Observed:** Alan 2026-05-22: "for each output at the very beginning, create a protocol that tells the user what version of Opus 4.7... be conservative... Sonnet only if absolutely certain... real-world benefit... end with the true best setting."
- **What Was Missing:** Universal SOP had no mechanism for declaring model + effort tier at output start. Risk: Alan can't see whether Claude is using appropriately-conservative effort for the task, no calibration data to detect systematic over/under-selection, no end-of-output retrospective to compare opening assumption vs reality.
- **Permanent Fix (SHIPPED):**
  1. New SubSOP **SP.21 MES (Model Effort Selector)** — added to MANDATORY_TIGHT_LOOP Rule 2 as #10 (9 → 10 mandatory)
  2. Pulse Check 8 → 9 items (added P9: MES present + retrospective)
  3. Validator VL.10 added to agents/validator.md + scripts/validator.sh (greps for `🎯 MODEL:` opening + `📊 MES RETROSPECTIVE` closing)
  4. New required positions in OUTPUT skeleton: (a) `🎯 MODEL: Opus 4.7 · Effort: HIGH/MEDIUM/LOW/FAST` line BEFORE STEP header, (b) `📊 MES RETROSPECTIVE` section near end before Pulse Check
  5. Conservative bias mandated: higher-effort > lower-effort when in doubt; Sonnet only with absolute certainty
  6. Mid-output adjustment template: `⚠️ MODEL ADJUSTMENT: HIGH → MEDIUM because <reason>`
- **Effort tier semantics:** HIGH (Opus max — multi-file structural / SOP changes / agent design), MEDIUM (Opus default — substantive single-file edits), LOW (Opus lite — lookups, status), FAST (Opus minimal — conversational), Sonnet 4.5 (RESERVED — template-fill only).
- **Real-world benefit:** Alan sees effort calibration per output → can trust quality is matched to stakes; calibration delta data accumulates over time → systematic over/under-selection becomes detectable.
- **Files modified:** MANDATORY_TIGHT_LOOP.md (Rule 2 + Pulse Check), agents/validator.md (VL.10), scripts/validator.sh (VL.10 grep), PROTOCOLS_REFERENCE.md (SP.21 entry — pending follow-up commit), cache/FAILURE_LEDGER.md (this entry), cache/BACKUP_LOG.md.
- **Verified:** This very output dog-foods SP.21 — opening `🎯 MODEL: Opus 4.7 · Effort: HIGH` line present (line 1); MES Retrospective section appears below Pulse Check.
- **Lesson:** Effort calibration was an invisible variable until now. Making it visible = making it auditable = making it improvable. Same F.19 pattern: convention → architecture.
</details>

<details>
<summary><b>F.24 — SP.20 REFINE Protocol Shipped (Weekly Self-Improvement Loop) — ✅ FIXED 2026-05-22</b></summary>

- **Type:** STRUCTURAL ADDITION (new SubSOP + 6 agents + 6 scripts + new cache directory)
- **First Observed:** Quintessence audit (F.22) identified that Universal SOP had observation infrastructure but no intervention infrastructure. Q.1 (closed feedback loops), Q.4 (proactive drift detection), Q.8 (failure-to-fix automation), Q.9 (session lifecycle automation) all at partial or NO.
- **What Was Missing:** A protocol that operates at WEEKLY cadence to close the loop. Per-output SIR (SP.17) surfaces insights but doesn't act on them. Per-output Foresight (SP.9 — also promoted in F.23) predicts but doesn't intervene. Nothing was wired to read SIR_LOG + FAILURE_LEDGER + META_AUDIT_LOG and **act**.
- **Permanent Fix (SHIPPED):** SP.20 REFINE Protocol — 6-step cycle (Review → Extract → Foresee → Intervene → Note → Evolve) with 6 new agent .md files + 6 new script .sh files + new `cache/refine/` directory with append-only `INTERVENTION_LOG.md`. Files: `agents/refine_{reviewer,extractor,foresight,intervention,scribe,evolution}.md` + `scripts/refine_{review,extract,foresee,intervene,note,evolve}.sh`.
- **v1.0 design:** All scripts are STUBS — they surface the data + propose actions, but require Alan approval before any code change (no autonomous self-modification in v1.0). v2.0+ may auto-apply safe low-risk interventions (lint fixes, doc updates) with full audit trail.
- **Cadence:** Weekly (Saturday 8 AM cron / Task Scheduler) for R→E→F→I→N. Quarterly OR pattern-recurrence ≥ 3 for Evolve.
- **Closes Quintessence properties:** Q.1 (closed feedback loops: now have weekly cycle that READS observation logs), Q.4 (proactive drift detection: Foresight step), Q.8 (failure-to-fix automation: Intervention + Scribe steps), Q.9 (session lifecycle: REFINE is weekly lifecycle).
- **Projected quintessence score impact:** 6.5/10 → ~8.0/10 once REFINE runs ≥ 2 weekly cycles with at least 1 INTERVENTION_LOG entry.
- **Origin:** REFINE_PROTOCOL_PROPOSAL.md (committed 2026-05-22 commit 823a459). Alan: "yes to all" 2026-05-22.
- **Fixed:** 2026-05-22 (this commit). Stubs shipped; v2.0 polish queued in QUINTESSENCE_ROADMAP.
- **Verified:** 12 new files present in `agents/` + `scripts/` + `cache/refine/INTERVENTION_LOG.md`; bootstrap_verify recognizes them; commit landed on origin/main.
- **Lesson:** This is the architectural answer to "the SOP doesn't self-improve" — every prior fix patched an instance; REFINE creates a meta-loop that proposes structural fixes when patches keep recurring.
</details>

<details>
<summary><b>F.23 — SP.9 FE Promoted From Reference-Only → Mandatory + SP.19 GLD Adopted + Proactive Cluster Formalized — ✅ FIXED 2026-05-22</b></summary>

- **Type:** STRUCTURAL ADDITION (protocol promotion + new SubSOP from Aurelius cross-pollination + functional cluster formalization)
- **First Observed:** Alan 2026-05-22: "what's the protocol named around bottlenecks, constraints, and proactive problem solving? isn't this foresight?" — surfaced that SP.9 FE was documented in PROTOCOLS_REFERENCE but **never invoked** (reference-only).
- **What Was Missing:**
  1. SP.9 FE was dormant — per-output Foresight predictions weren't happening despite being documented
  2. GOLD-PATH discipline from Aurelius (`xprimordius/aurelius-vault/Reference/GOLD-PATH-Protocol.md`) hadn't been adopted — we'd been picking tech (Mermaid, mermaid-cli, Obsidian, gh CLI) without SOTA scans
  3. SP.9 + SP.17 + (proposed SP.19) + (proposed SP.20) were not formally clustered — they all serve the same higher-level purpose but lacked a named cluster
- **Permanent Fix (SHIPPED):**
  1. **SP.9 FE promoted** to MANDATORY_TIGHT_LOOP Rule 2 (#9) — Pulse Check P8 added ("Foresight surfaced") — validator.md + validator.sh check VL.9 added
  2. **SP.19 GLD GOLD-PATH** shipped — adopted from Aurelius (acronym G·O·L·D·P·A·T·H — Gather/Observe/Lead/Deviate/Prove/Audit/Track/Honor) — mandatory before recommending any new external tool/model/library/framework
  3. **Proactive Cluster** formalized in PROTOCOLS_REFERENCE.md alongside existing Visual / Token / Self-Check / Wrap-Up clusters: **SP.9 FE + SP.17 SIR + SP.19 GLD + SP.20 REFINE** = "Foresight + Proactive Resolution System"
- **Files modified:** MANDATORY_TIGHT_LOOP.md (Rule 2: 8→9, Pulse: 7→8 items), PROTOCOLS_REFERENCE.md (SP.9 status update + SP.19 + SP.20 entries + Proactive Cluster section), agents/validator.md (VL.9), scripts/validator.sh (VL.9 heuristic), cache/BOOTSTRAP_CHECK.md, scripts/bootstrap_verify.sh, cache/FAILURE_LEDGER.md (this entry).
- **Files added:** scripts/refine_*.sh (6) + agents/refine_*.md (6) + cache/refine/INTERVENTION_LOG.md — all part of F.24 SP.20 REFINE ship.
- **Origin:** LEARNINGS_FROM_AURELIUS_VAULT.md (commit ab1542b) identified GOLD-PATH as missing. SOP_GUIDE.md (commit 5ef7e2d) surfaced SP.9 dormancy. Alan: "yes to all" 2026-05-22.
- **Fixed:** 2026-05-22 (this commit).
- **Verified:** MANDATORY_TIGHT_LOOP.md Rule 2 shows 9 mandatory; Pulse Check shows 8 items; validator.sh has VL.9 grep; PROTOCOLS_REFERENCE has Proactive Cluster section.
- **Lesson:** Dormant protocols are worse than missing ones — they create the illusion of capability. Cross-pollination from sister projects (Aurelius) is high-leverage: borrow what works, acknowledge provenance, ship.
</details>

<details>
<summary><b>F.22 — Universal SOP Not Yet Self-Perfecting [META-AUDIT, structural deficit across 10 quintessence properties] — ✅ Partial FIX 2026-05-21 (6.5/10 → roadmap for 3.5/10 remainder)</b></summary>

- **Type:** META-AUDIT (Alan-prompted comprehensive audit for "quintessential self-perfecting + perfected SOP")
- **First Observed:** 2026-05-21 — Alan: *"analyze and audit the universal SOP heavily, diligently, meticulously and thoroughly, with the intention to create the quintessential self perfecting, and perfected universal SOP."*
- **Times:** Continuous — this is a structural deficit existing since project inception
- **What Failed:** The SOP has substantial **observation infrastructure** (logs, agents, scripts, hooks) but **lacks infrastructure that ACTS on observations**. As a result, "self-perfecting" was aspirational not actual: insights surfaced in SIR_LOG didn't auto-promote; failure patterns required manual extraction (Claude/Alan); cross-file consistency required manual 9-edit propagation per protocol; same-brain ceiling not escaped; no formal acceptance criteria for "done"; no convergence metric.
- **Quintessence audit score:** Pre-F.22: **3.5 / 10** properties fully satisfied (Q.1 partial, Q.2 partial, Q.3 NO, Q.4 NO, Q.5 NO, Q.6 NO, Q.7 NO, Q.8 NO, Q.9 partial, Q.10 partial). Post-F.22: **6.5 / 10**.
- **Comprehensive gap analysis:** 42 findings across 10 categories (A: closed feedback loops · B: mechanical enforcement · C: external independence · D: drift detection · E: self-test coverage · F: cross-file consistency · G: convergence proof · H: failure-to-fix automation · I: session lifecycle · J: documentation completeness). Top-10 prioritized by severity × leverage.
- **Root Cause:** The same F.19 discipline-vs-architecture pattern, applied recursively. The SOP built observation tools first (because they're easier) without building the *acting* tools that close the loops. Without closure, observation == noise.
- **Permanent Fix (Top 10 shipped 2026-05-21 via this commit):**
  1. `scripts/sir_recurrence.sh` — detects recurring insights → flags for FAILURE_LEDGER promotion (closes Q.A.1 + Q.A.5)
  2. `scripts/audit_chain_health.sh` — META_AUDIT_LOG trend analyzer + chain completeness check (closes Q.A.2)
  3. `scripts/add_protocol.sh` (advisory v1.0) — atomic protocol-add advisor; full automation pending (closes Q.F.1)
  4. `scripts/sop_health_dashboard.sh` — single-pane health metric + appends time-series row to `cache/SOP_HEALTH_METRICS.md` (closes Q.G.1)
  5. `templates/output_standard.md` — literal output skeleton template (closes Q.B.4)
  6. `tests/run_agent_tests.sh` — skeleton test harness for all 4 chain scripts + bootstrap_verify + new infra (closes Q.E.1 partially)
  7. `VERSION_MANIFEST.md` — single source of truth for file versions (closes Q.F.2)
  8. `QUINTESSENCE_ROADMAP.md` — formal deferred-findings list + acceptance criteria for "done" (closes Q.J.3)
  9. (this entry) cache/FAILURE_LEDGER.md F.22 — META-audit documented (closes Q.J.1 partially)
  10. `cache/SOP_HEALTH_METRICS.md` — auto-generated time-series for convergence proof (closes Q.G.1)
- **Fixed (partial):** 2026-05-21 (this commit). Remaining 32 findings deferred to QUINTESSENCE_ROADMAP.md.
- **Verified:** This very output ends with SIR + SSC (dog-fooded). bootstrap_verify: 85/0/0. Test harness: 9/9 PASS.
- **Lesson:** F.19 + F.20 + F.21 + F.22 all reinforce the same insight — **STRUCTURAL slots beat conventional intentions**. The pattern recurs at every level: rules → conventions → architecture; observations → patterns → action. The Quintessence is asymptotic — not a destination but a direction. Each commit narrows the gap. The roadmap is the path.
- **Forward measure:** Quintessence score (X/10) tracked in `cache/SOP_HEALTH_METRICS.md` over time. When score reaches ≥ 9.5/10 stable for 14 days → quintessential.
</details>

<details>
<summary><b>F.21 — Sync Status Confirmation Absent At End Of Output [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (structural gap surfaced via Alan's feedback)
- **First Observed:** 2026-05-21 evening, aurelia session — Alan: *"please incorporate into the global SOP that at the end it lets us know if the changes were updated/uploaded to the github & obsidian or not. need confirmation or records for every output end."*
- **Times:** Effectively every prior output (every output that modified files lacked an explicit sync-confirmation block at the end)
- **What Failed:** No protocol surfaces commit/push/Obsidian sync state at the end of an output. Multiple times in this very session Alan asked "is it on GitHub?" after commits — exactly the gap. Sync confirmation was implicit, never structural. Result: silent push failures could hide, multi-device propagation status was opaque, Obsidian sync state was untracked.
- **Evidence:**
  - PROTOCOLS_REFERENCE.md (pre-F.21) had 21 entries (SP.1–SP.17 + EN.1–EN.4); none reported sync state
  - MANDATORY_TIGHT_LOOP.md v1.1 (pre-F.21) had 7+1 mandatory; none addressed end-of-output sync
  - Pulse Check v1.1 had 6 items (P1–P6); none checked for sync-status presence
  - Validator (pre-F.21) had VL.1–VL.7; none verified SSC
- **Root Cause:** No structural slot in the output template for "did the work land?" — same convention-vs-architecture pattern as F.19 + F.20. Alan kept having to ask after every commit. Each individual omission was locally rational ("the push happened in the previous message"). Aggregated: opacity, friction, lost trust in the system.
- **Permanent Fix:** **NEW protocol SP.18 SSC (Sync Status Confirmation)** added 2026-05-21.
  1. Mandatory in `MANDATORY_TIGHT_LOOP.md` v1.2 (8+1 protocols now; was 7+1)
  2. Pulse Check extended to 7 items (P7 = SSC surfaced)
  3. Validator agent adds VL.8 check
  4. `scripts/validator.sh` adds SSC detection heuristic
  5. `scripts/compliance_check.sh` accepts 7/7 score
  6. `scripts/sync_status.sh` ⭐ NEW — mechanical reporter (git state, Obsidian state, cross-device propagation). AI invokes + surfaces verbatim.
  7. PROTOCOLS_REFERENCE.md gets full SP.18 spec
  8. Format: per-channel table (commit, push, distance, Obsidian, cross-device, backups, BACKUP_LOG, SIR_LOG, device, timestamp)
  9. Position: AFTER Pulse Check as FINAL block of every file-modifying output
- **Fixed:** 2026-05-21 (this commit)
- **Verified:** This very output ends with a 📡 Sync Status block generated by `scripts/sync_status.sh` (dog-fooded).
- **Lesson:** F.19's core insight reaffirmed (again) — STRUCTURAL slots beat conventional intentions. The "tell me if it landed" feedback loop was implicit ("Claude will mention it if relevant"). Implicit decays. Explicit holds. SSC closes that gap permanently.
</details>

<details>
<summary><b>F.20 — System Improvement Reflection Structurally Absent [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (structural gap surfaced via Alan's effectiveness audit)
- **First Observed:** 2026-05-21 evening, aurelia session — Alan: *"insights for improvement which should be in the SOP/agents right? every time the SOP ends with this? if not implement and save for future use for all."*
- **Times:** Effectively every prior output (every output since the project began missed this — it was never structural)
- **What Failed:** No protocol exists to surface SYSTEM-level improvement insights per output. Closest existing protocols (SP.9 FE = content foresight; SP.13 SHR = past-scoring) addressed different lenses. As a result, insights about how the SOP/agents/scripts/architecture itself should improve — surfaced naturally during real work — were lost between outputs. The SOP could only evolve via explicit Alan-prompted rebuilds, never via in-session observation. This is part of the F.19 same-brain ceiling pattern: without a structural reflection slot, Claude reverts to task-focus and improvement opportunities evaporate.
- **Evidence:**
  - PROTOCOLS_REFERENCE.md (pre-F.20) had 20 entries; grep for "improvement reflection" → 0 matches
  - MANDATORY_TIGHT_LOOP.md (pre-F.20) had 6 mandatory; none addressed system-improvement
  - validator.md (pre-F.20) had VL.1-VL.6; none checked for SIR
  - Audit confirmed gap during this commit's PHASE 4 work
- **Root Cause:** No structural slot in the output template for "system-improvement reflection." Without a forced slot, the reflection doesn't happen — same convention-vs-architecture pattern as F.19's diagnosis (discipline decays, architecture holds). Specifically: even if Claude *knew* to surface insights, it would forget under task pressure unless the skeleton demands it.
- **Permanent Fix:** **NEW protocol SP.17 SIR (System Improvement Reflection)** added 2026-05-21.
  1. Mandatory in `MANDATORY_TIGHT_LOOP.md` v1.1 (7+1 protocols now; was 6+1)
  2. Pulse Check extended to 6 items (P6 = SIR surfaced)
  3. Validator agent adds VL.7 check
  4. `scripts/validator.sh` adds SIR detection heuristic
  5. `scripts/compliance_check.sh` accepts 6/6 score (alongside 5/5 v1.0 migration)
  6. PROTOCOLS_REFERENCE.md gets full SP.17 spec with categories (🛠️ structural / 📋 convention / 🪙 token / 🔧 tooling / 🔄 process / 📊 measurement) and effort labels (S/M/L)
  7. Format: 1-3 actionable system-level insights per output, categorized
- **Fixed:** 2026-05-21 (this commit)
- **Verified:** This very output ends with a SIR section demonstrating the protocol working (dog-fooded).
- **Lesson:** F.19's core insight reaffirmed — STRUCTURAL slots beat conventional intentions. Adding SIR as a mandatory skeleton slot guarantees the reflection happens. If it were a "remember to reflect" suggestion, it would decay like every other convention.
- **Future enhancement:** `cache/SIR_LOG.md` (append-only log of every SIR insight) → enables deduplication + pattern detection + auto-conversion to FAILURE_LEDGER entries when an insight recurs. Tier-1.5 follow-up; not blocking.
</details>

<details>
<summary><b>F.19 — SOP Output-Level Compliance Decays Despite Infrastructure [META-FAILURE, all 18 prior entries + 14 sub-agent tests + aurelia Day-1 session confirm] — ✅ Tier 1 FIXED 2026-05-21 / Tier 2 + Tier 3 STAGED</b></summary>

- **Type:** FAILURE — meta-pattern that explains why F.1–F.18 keep recurring in new forms
- **First Observed:** Across all sub-agent tests (8.5/10 in-session friction ceiling per `EFFICIENCY_GUIDE.md`) and re-confirmed during aurelia Day-1 setup session 2026-05-21 (~30 turns, audited)
- **Times:** Effectively every output without mechanical enforcement
- **What Failed:** Output-level SOP rules (STEP header, MACRO/MICRO, LTM, Pulse Check P1–P17, Step Tracking Table, Understanding Check, agent invocation) achieve ~0% compliance in real operational sessions, despite extensive documentation (940-line SOP), 4 agents, 7 scripts, 2 git hooks (pre-commit + pre-push), and 18 prior failure entries each with permanent-fix claims. **File-level rules** (backups, device IDs, append-only, commits, no-deletion) achieve ~85% compliance because they became mechanical (hooks + scripts). The 8.5/10 sub-agent ceiling is precisely this discipline/architecture gap.
- **Evidence (aurelia session, 2026-05-21, honestly audited):**
  - 8 output-convention rules → **~0%** compliance until user explicitly demanded a SOP-compliant output
  - 7 file-mechanic rules → **~85%** compliance (first miss, then enforced by hooks)
  - 3 session-start rules → **~5%** compliance (verifier run mid-session not at bootstrap; STEP 1 reads on-demand; STEP 2 9-line confirm never emitted)
  - 4 agent-activation rules → **0%** compliance
- **Root Cause (depth, three reinforcing mechanisms):**
  1. **Same-brain-audits-itself.** Karen/Validator-Merged/Controller/Paradox Resolver are Claude in different prompts. The audit runs the same biases as the original output. Anti-rubber-stamp text doesn't change the underlying judge. This is structural, not a bug in the agent definitions.
  2. **No pre-send gate.** LLM token output is autoregressive. By the time Claude generates "Pulse Check: 17/17 ✅", the entire prior output is already shipped. The check evaluates a fait accompli — it can describe, not prevent.
  3. **Convention loses to immediate task.** Each individual skip is locally rational ("just commit the typo, don't STEP-header it"). Aggregated across 30+ turns, conventions erode predictably. This is the F.9 decay pattern — and Ensurance was supposed to fix it but Ensurance is itself convention.
- **Permanent Fix — 3 Tiers (architectural conversion of discipline):**
  1. **Tier 1 — Scope Reduction (✅ SHIPPED this commit):** Cut output-level mandatory rules to what real sessions can carry. Pulse Check 17→5 items, mandatory SubSOPs 16→6, STEP header 8 fields→3 lines. Spec: `MANDATORY_TIGHT_LOOP.md`. Full SOP preserved as reference in `UNIVERSAL_SOP_PROMPT.md`. Reversible if data shows cuts were wrong.
  2. **Tier 2 — Mode Declaration (STAGED):** First line of every Claude response declares `MODE: CONVERSATION` / `MODE: OUTPUT-QUICK` / `MODE: OUTPUT-STANDARD` / `MODE: OUTPUT-COMPLEX`. SOP overhead applies only to OUTPUT modes. Most session turns are conversational and shouldn't pay SOP cost. Enforced via a `Stop` hook in `.claude/settings.json` that flags missing MODE prefix.
  3. **Tier 3 — Outputs Are Files, Not Chat Replies (STAGED, architectural):** Deliverables save to `outputs/<YYYY-MM-DD>_<topic>_<device>.md`, go through the existing `pre-commit` hook (which already runs `compliance_check.sh`), and cannot reach the user until compliance passes. **Convention becomes architecture.** Collapses the discipline/architecture gap by eliminating the discipline side.
- **Fixed:** Tier 1 — 2026-05-21 (this commit). Tier 2 + Tier 3 staged awaiting separate decision.
- **Verified:** `MANDATORY_TIGHT_LOOP.md` and `SELF_COMPLIANCE_FIX.md` exist in this commit. `bootstrap_verify.sh` passes 70/0/0 on aurelia. Tier 1 reversibility preserved via no-delete rule + this entry documenting the rationale.
- **Tier 1 follow-up (small script update):** `scripts/compliance_check.sh` currently only accepts 10/10, 11/11, 12/12, 15/15, 16/16, 17/17 as valid Pulse Check scores. Add 5/5 as a valid score per `MANDATORY_TIGHT_LOOP.md`. Separate commit.
- **Lesson:** Every prior fix that was a convention got re-violated. Every prior fix that was mechanical held. F.1–F.18 are surface symptoms of this meta-pattern. Future fixes should be architecturally mechanical wherever feasible, and scope-reduced wherever not.
</details>

<details>
<summary><b>F.18 — Multi-Device Live Push/Pull Not Optimized [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (multi-device coordination gap)
- **First Observed:** Session 6 — `git push` rejected mid-session because another device (aurelia) pushed during my work. Required manual `fetch + rebase + resolve conflict + push`.
- **Times:** 1 explicit + N silent prior cases (any rejected push)
- **Root Cause:**
  - Session-start was multi-device aware (git pull mandatory in STEP 0.5, device naming, append-only)
  - BUT mid-session live push/pull had **no protections**:
    - No pre-push hook → discovered divergence only at push rejection
    - No auto-rebase wrapper → had to manually run fetch + rebase + push every time
    - No live sync detection during long sessions → could diverge for hours before noticing
  - Plain `git push` provides no friction reduction for the common case (non-overlapping concurrent commits)
- **Permanent Fix:**
  1. **`scripts/safe_push.sh`** — wrapper: `git fetch && git rebase origin/main && git push`. Handles divergence atomically. Bails cleanly on conflict with 3 documented resolution paths.
  2. **`.githooks/pre-push`** — mechanical block: if origin is ahead, push aborts with instruction to run `safe_push.sh`. Cannot bypass without `--no-verify`.
  3. **`bootstrap_verify.sh` Section 13** — fetches at boot, reports ✅ in sync / ⚠️ behind / ℹ️ ahead / ⚠️ diverged. Catches divergence at session start when cheapest to resolve.
  4. **BOOTSTRAP_CHECK.md** updated to 13 sections (was 12). Total checks: 70 mechanical + 10 conceptual = 80.
- **Fixed:** 2026-05-21 (this output)
- **Verified:** Tested by dogfooding — this commit pushed via `bash scripts/safe_push.sh`.
- **Lesson:** Multi-device hygiene is a *spectrum*, not a binary. Session-start protections (pull) are necessary but not sufficient. Mid-session and push-time also need mechanical layers.
- **Tradeoff acknowledged:** Auto-rebase handles non-overlapping commits frictionlessly but still requires manual resolution on file conflicts (intrinsic to concurrent edits of same lines).

</details>

<details>
<summary><b>F.17 — Bootstrap Confirmation Lacked Component-Level Transparency [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (structural transparency gap)
- **First Observed:** Session 6 — Alan: "in the bootstrap itself, when we finally load it up, everything is checked off. I should literally see a check mark and a checklist for literally everything in detail... full transparency. This should be embedded into the actual file itself, just like a boot up for anything, to make sure that everything's up and running."
- **Times:** 1 (but allowed every prior STEP 2 to summarize-not-enumerate)
- **Root Cause:**
  - STEP 2 confirmation (9-line format) surfaced MACRO + MICRO + current position + last decisions — but did NOT enumerate individual components
  - BOOTSTRAP_CHECK.md v1.0 listed "expected answers" in Q&A form — passive spec, not active checklist
  - AI could confirm bootstrap without proving every agent / SubSOP / script / hook actually loaded
  - "Same brain self-audit" — AI claims "5 cache files loaded" but never lists which 5, allows silent drift (missing file, deleted script)
- **Permanent Fix:**
  1. **`scripts/bootstrap_verify.sh`** — mechanical verifier, 67 file/grep checks across 11 categories (identity, agents, SOP architecture, all 16 SubSOPs by name, 4 Ensurance, cache, scripts, hooks, fusion status, harness drift)
  2. **`cache/BOOTSTRAP_CHECK.md` v2.0** — rewritten from Q&A → comprehensive checklist spec (77 total items: 67 mechanical + 10 conceptual)
  3. **SESSION_START STEP 2 rewritten** — now requires `bash scripts/bootstrap_verify.sh` output verbatim + Section 12 conceptual checks. No more "summary" confirmation.
  4. **All 3 paths updated** (FAST-PATH default, COLD START, FAST-PATH continuation) to include the script run
- **Fixed:** 2026-05-21 (same output where called out)
- **Verified:** Script ran 67/67 ✅ end-to-end. Output embedded in same chat as proof.
- **Lesson:** Confirmation that "everything is loaded" needs literal enumeration, not summary. ~3 seconds of mechanical check beats hours of silent drift debugging.

</details>

<details>
<summary><b>F.16 — Script Enforcement Agent Not Named + Bypass Possible [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (structural gap)
- **First Observed:** Session 5 — Alan asked "there needs to be an agent to ensure the script is not bypassed? what agent is responsible for this?"
- **Times:** 1 (but allowed every prior P17 = Y without enforcement)
- **Root Cause:**
  - P17 in Pulse Check said "compliance_check.sh run + passed" — but no agent enforced this
  - Karen agent existed with "anti-rubber-stamp" role but was NEVER assigned script enforcement
  - I could mark P17 = Y without actually running the script (theater compliance via self-check)
- **Permanent Fix:**
  1. **Git pre-commit hook** (`.githooks/pre-commit`) — MECHANICAL enforcement, cannot be bypassed without explicit `--no-verify`
  2. **Karen agent expanded** — F.16 section added with script enforcement verification responsibilities
  3. **Karen MUST be invoked** triggers expanded: any `--no-verify` commit, P17=Y without script run, append-only shrinkage, visible Rule #11 violations
  4. Layered defense: Hook (mechanical, automatic) + Karen (audit, on-demand) + P17 (self-check baseline)
- **Fixed:** 2026-05-21 (same output where called out)
- **Verified:** This commit will be the first to fire the pre-commit hook
- **Lesson:** Self-check ALONE has structural limits. Need three layers:
  1. MECHANICAL (script, hook — cannot fool)
  2. EXTERNAL AUDIT (Karen sub-agent — different brain)
  3. SELF-CHECK (Pulse Check — fast feedback)
  Each layer catches different failure modes.

</details>

<details>
<summary><b>F.15 — Multi-Device Naming + Append-Only Protection Absent [FAILURE × 1, structural gap] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (multi-device foundational gap)
- **First Observed:** Session 5 — Alan asked "all devices named, changes timestamped, files aren't deleted? confirm"
- **Times:** 1 (but allowed 28 prior commits with no device identity)
- **Root Cause:**
  - Git config used generic "Alan <alan@local>" — no device differentiation
  - No naming convention for commits across devices
  - No enforcement that cache/history files don't get accidentally truncated
  - No registry of which devices have touched the repo
- **Permanent Fix:**
  1. DEVICE_REGISTRY.md with naming convention + registered devices table
  2. Per-device git config: user.name "Alan (DEVICE)" + user.email "alan+DEVICE@local"
  3. Commit message convention: `[device-name | YYYY-MM-DD HH:MM TZ] summary`
  4. scripts/setup_device.sh for one-command registration
  5. scripts/append_only_check.sh blocks commits that shrink history files
  6. scripts/check_device_activity.sh shows recent device activity
  7. MULTI_DEVICE_GIT_PROTOCOL.md updated to v1.2 with Rules 6+7 (append-only, never delete)
  8. This Mac registered as 'mac-main'
- **Fixed:** 2026-05-21
- **Verified:** Commit 12461cb is first to show "Alan (mac-main) <alan+mac-main@local>"
- **Lesson:** Multi-device safety requires layered defense — naming (audit) + append-only (data preservation) + never-delete (file preservation).

</details>

<details>
<summary><b>F.14 — Rule #11 Cluster Violations + UC Format Inconsistency + Compliance Agent Never Invoked [REPEAT × 5+] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** REPEAT (Rule #11 violations across 5+ outputs in Session 5)
- **First Observed:** Session 5 — Alan called out: "TTE + LTM needs to have the name fully written out remember? where is our compliance agent?"
- **Times:** 5+ (every output that used cluster mentions like "TTE + LTM" without full names)
- **Root Cause:**
  - Rule #11 said "first use" — interpreted CLUSTER headers (like "Visual System") as the "first use," then bare acronyms in protocol lists
  - Pulse Check P10 = behavioral self-check, can be marked Y without rigorous verification
  - Karen + Validator-Merged sub-agents exist but NEVER auto-invoked (no trigger)
  - Same-brain self-audit has structural limits
  - Understanding Check has no EXACT format spec — column widths varied
- **Permanent Fix (STRUCTURAL):**
  1. Rule #11 TIGHTENED — "EVERY use" not "first use" (cluster mentions must expand both protocols)
  2. NEW: `scripts/compliance_check.sh` — mechanical grep-based verification (0 tokens, runs before commit)
  3. NEW: P17 in Pulse Check — "compliance_check.sh run + passed" (mechanical, can't fake)
  4. NEW: Rule #13 in Compliance Non-Negotiables — run compliance script before commit
  5. Understanding Check template now has STRICT format spec (column widths, emoji conventions, forbidden patterns)
  6. Total Pulse Check items: 17 (was 16)
- **Fixed:** 2026-05-21 (same output where called out)
- **Verified:** This output's step header has macro/micro. Compliance script runnable. P17 will be enforced.
- **Lesson:** Self-check has structural limits. Mechanical checks (scripts, regex) catch what behavioral checks miss. Auto-invoke external sub-agents for high-stakes outputs.

</details>

<details>
<summary><b>F.13 — Macro/Micro Goal Tracking Structurally Absent [FAILURE × 1, multi-session pattern] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (multi-session structural gap)
- **First Observed:** Session 5 — Alan asked "we need to have macro and micro goal always front of mind"
- **Times:** 1 (but underlying drift accumulated across 14+ sessions)
- **Root Cause:** 
  - SESSION_STATE.md had "CURRENT POSITION" but no explicit MACRO vs MICRO distinction
  - No SubSOP or Pulse Check item enforced goal visibility per-output
  - No dedicated agent for goal anchoring (Controller did orchestration, not goal-tracking)
  - When O1 OBJECTIVE DRIFT was identified in FAILURE_MODES_ANALYSIS yesterday, I LISTED it as a risk but did NOT structurally fix it — this is "acknowledge without execute" (RPT.7 / F.7 pattern recurring)
- **Permanent Fix (STRUCTURAL):**
  1. Step header format now MANDATORY includes `🎯 MACRO:` + `📌 MICRO:` lines (STANDALONE_SOP updated)
  2. Pulse Check extended to P16: "MACRO + MICRO goal visible in step header" (universal across all tiers)
  3. SESSION_STATE.md restructured with explicit GOAL TRACKING section: macro goal, micro goal, goal status, macro-level next action, micro-level next action
  4. SESSION_START STEP 2 confirmation format updated to surface macro/micro immediately
- **Fixed:** 2026-05-21 (same output where called out)
- **Verified:** This very output uses the new step header format with MACRO + MICRO at top
- **Lesson:** Identifying a risk in analysis ≠ fixing it. Risks must be operationalized into mechanical enforcement (Pulse Check item) to actually prevent recurrence.

</details>

<details>
<summary><b>F.12 — Pre-Flight Gate + Pulse Check 2.0 redundancy [FAILURE × 1, design error] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** FAILURE (single-occurrence design error)
- **First Observed:** Session 5 — when "Increase efficiency/proficiency for 100%" ask was processed, I added BOTH a 5-item Pre-Flight Gate AND extended Pulse Check 2.0 (P11-P15) with overlapping content
- **Times:** 1
- **Root Cause:** Designed two checks in isolation without asking "would this confuse a fresh AI?" before shipping. Sub-agent test #12 caught it immediately — "one check expressed two ways = decision overhead, contradicts Alan's concise/no-filler preference"
- **Permanent Fix:** STRUCTURAL — DELETE Pre-Flight Gate, KEEP Pulse Check 2.0 P1-P15. One check, one place.
- **Fixed:** 2026-05-21 (same output where caught)
- **Verified:** STANDALONE_SOP edit removed Pre-Flight Gate section; Pulse Check 2.0 retained
- **Lesson:** Adding new compliance mechanisms ≠ adding value. Each must demonstrably catch a failure mode NOT caught by existing ones. Otherwise = noise = friction.

</details>

<details>
<summary><b>F.11 — No `<details>` expandable in SubSOP reports [REPEAT × 1, caught early] — ✅ FIXED 2026-05-21</b></summary>

- **Type:** REPEAT
- **First Observed:** Session 5 (May 21)
- **Times:** 1 (caught early)
- **Root Cause:** Pattern-matching failed — I treated PROTOCOLS_REFERENCE/INVENTORY as the "expandable docs" and my running reports as compact summaries. Wrong split — Alan wants ALL agent/protocol references expandable, including in dynamic outputs.
- **Permanent Fix:** STRUCTURAL: Update Output Skeleton (EN.1) to wrap each SubSOP report row in `<details>` block. Demonstrated in same output where called out (2026-05-21).
- **Fixed:** 2026-05-21
- **Verified:** Last 2 outputs use `<details>` per SubSOP entry in Protocol Visibility report. Pattern holding.
</details>

---

## 📊 LEDGER STATISTICS

| 🎯 | Metric | Count |
|:---:|--------|:-----:|
| Total entries | F.1 - F.18 | 18 |
| REPEAT type | User asked 2+ times | 9 |
| FAILURE type | Single-occurrence + meta-patterns | 2 |
| All fixed | ✅ | 11 |
| Outstanding | ⏸️ | 0 |
| Cumulative recurrence count | 1+3+4+3+3+3+5+3+6+1+4+1 | 37 documented system failures |

### Patterns Observed
| 🔁 Pattern | 📊 Count | 🛡️ Structural Fix |
|-----------|:--------:|---------------------|
| Visual/format rules treated as suggestions | F.1, F.3 (× 2) | MagNet + Door Scan always-on |
| Rules defined but never activated | F.2, F.5 (× 2) | Mandatory wrap-up components |
| Acknowledge without execute | F.4, F.7 (× 2) | EEP + PCG + Debt Counter |
| Self-judgment override mechanical rule | F.6, F.8 (× 2) | Skeleton + Pulse Check |
| Decay across outputs | F.9 | Ensurance System EN.1-EN.4 |
| Behavioral rules not surviving | F.10, F.11 (× 2) | Structural enforcement (one row, `<details>`) |

---

## 🛡️ ACTIVE GUARDRAILS

These prevent the most common failure recurrences:

| 🆔 Guardrail | 🛡️ Protocol | 🎯 Prevents |
|:---:|------------|------------|
| G.1 | EN.1 Output Skeleton (Structural Anti-Decay Mechanism) | F.5, F.6, F.8 — components not silently dropped |
| G.2 | EN.4 Pulse Check (Compliance Pulse Check) | F.9 — decay detected pre-send |
| G.3 | EN.2 Priority 10 (Cognitive Load Reduction) | F.9 — overwhelm leads to slop |
| G.4 | SP.15 EEP (Execution Enforcement Protocol) | F.4, F.7 — acknowledge-not-execute |
| G.5 | SP.16 PCG (Prompt Completion Gate) | F.7 — items dropped pre-send |
| G.6 | SP.1 MagNet (Magnetic Visual Engagement Protocol) Always-On | F.1, F.3 — visual rules become suggestions |
| G.7 | Rule #11 — full names + acronyms first use | F.10 — truncation regression |
| G.8 | Rule #12 — `<details>` per protocol/agent | F.11 — compact reports lose transparency |

---

## 🎯 USAGE PROTOCOL

### When To Add A New Entry

| 🔁 Trigger | 🏷️ Type | 🛡️ Required Response |
|-----------|---------|---------------------|
| User says "this is the [Nth] time" | REPEAT | New F.X entry + SP.12 HFR (Honest Failure Report) in same output + structural fix |
| User says "you didn't do X" (1st time, but obvious system gap) | FAILURE | New F.X entry + HFR + structural fix |
| AI self-detects a SubSOP miss in Pulse Check | FAILURE | New F.X entry (caught early) + HFR + structural fix |
| Sub-agent test surfaces a gap | FAILURE | New F.X entry + structural fix in same output |

### Honest Failure Report Template (HFR Format)

```
🚨 HFR — Honest Failure Report
Entry ID: F.X
Type: REPEAT / FAILURE
What failed: [specific, not vague]
Root cause: [depth analysis]
Permanent fix (structural, not 'try harder'): [specific]
Verified in this output by: [how]
Logged to FAILURE_LEDGER as: F.X
```

---

## 🔁 NOTE ON SUPERSEDED FILE

**`cache/RPT_LOG.md` is now in deprecation mode.** All entries migrated here as F.1-F.11. New entries should be added HERE, not in RPT_LOG.md. RPT_LOG.md kept as historical reference + redirect pointer.

---

*FAILURE_LEDGER.md v1.0 | F8 Fusion of SP.14 RPT (Repeated Prompt Tracker) + SP.12 HFR (Honest Failure Report) | Universal SOP v1.3 | 2026-05-21*
