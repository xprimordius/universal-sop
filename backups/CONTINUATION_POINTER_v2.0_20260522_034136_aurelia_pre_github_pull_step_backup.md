# 🔗 CONTINUATION POINTER — Resume A New Chat With Full Context
# VERSION: 2.0 | 2026-05-22 | aurelia | Token-cutover handoff at ~790K / 1M
# READ THIS FIRST when starting a new chat to continue the Universal SOP work.

---

## ⚡ PASTE THIS PROMPT VERBATIM INTO THE NEW CHAT

```
I'm continuing the Universal SOP project on this device. Please:

1. Run `bash scripts/bootstrap_verify.sh` — confirm 85+ pass / 0 fail / 0 warn
2. Run `bash scripts/e2e_verify.sh` — confirm current E2E pass count
3. Read `CONTINUATION_POINTER.md` (this file) end-to-end
4. Read `cache/SESSION_STATE.md` for current position
5. Read `cache/CONTINUATION.md` for latest narrative handoff
6. Read `MANDATORY_TIGHT_LOOP.md` — operational ruleset (v1.5.1 doctoral UC + trivial-spec carve-out + SP.21 MES + 9-item Pulse Check)
7. Read `cache/FAILURE_LEDGER.md` last entries — F.22–F.28 are recent
8. Read `cache/SIR_LOG.md` last 10 rows for in-flight improvement insights
9. Read `QUINTESSENCE_ROADMAP.md` — 32 deferred findings + acceptance criteria
10. Run `bash scripts/sop_health_dashboard.sh` and report scorecard

Then surface a STEP 2 confirmation in the 9-line format from SESSION_START.md
with the current quintessence score, what's done, what's next.

After that, wait for my direction — do NOT auto-start work.

⚠️ KEY ACTIVE RULES (don't skip):
  - Every output opens with `🎯 MODEL: <variant> · <tier>` (SP.21 MES — see MANDATORY_TIGHT_LOOP)
  - Every output's Understanding Check uses doctoral precision (sub-clause granularity per SP.6 IAC v1.5.1)
  - Trivial specs (≤1 normative clause OR ≤5 word count OR continuation directive) → 1-row UC is sufficient
  - Every output ends with SIR + Foresight + 9-item Pulse Check + MES Retrospective + Sync Status
  - All file edits: backup BEFORE edit, device-tagged timestamped filename, log to BACKUP_LOG
  - `🎯 MODEL` settings (real, from Claude Code): Effort tiers (max / very high / medium / low) + Model variants (Opus 4.7 / Opus 4.7 1M / Opus 4.6 legacy / Sonnet 4.6). Sonnet 4.6 only when beyond-shadow-of-doubt AND absolute certainty.
```

---

## 📍 PRECISE WHERE-WE-ARE (As Of Commit `66194f4`, 2026-05-22 03:30 CDT)

### Latest commit chain (last 5)

| SHA | What |
|---|---|
| `66194f4` | verify_before_assert.sh (F.23+F.26+F.27 cluster fix) + SP.6 IAC trivial-spec carve-out |
| `375a94b` | F.27 HFR — doctoral re-spec of SP.21 MES + SP.6 IAC strengthening (sub-clause granularity) |
| `5d65986` | F.26 HFR — SP.21 MES tier names corrected (real Claude Code settings) |
| `9b1bd3a` | SP.21 MES initial ship + F.25 |
| `bfade1e` | SOP_GUIDE v1.1 rewrite + E2E verification script |

### Quintessence Score

**6.5 / 10** properties of self-perfecting SOP satisfied (was 3.5/10 at start of F.22 audit).

Tracked in: `cache/SOP_HEALTH_METRICS.md` (time series — append-only).

### Active SOP architecture (current counts)

| Layer | Count | Notes |
|---|:-:|---|
| SubSOPs | 21+ pending entries | SP.1–SP.16 active; SP.17 SIR + SP.18 SSC + SP.21 MES active in MANDATORY_TIGHT_LOOP but **missing formal `<details>` entries in `PROTOCOLS_REFERENCE.md`** |
| SubSOPs proposed (not yet shipped) | 2 | SP.19 GLD (GOLD-PATH from Aurelius), SP.20 REFINE (in `REFINE_PROTOCOL_PROPOSAL.md`) |
| Ensurance | 4 (EN.1–EN.4) | active |
| Active agents | 5 | Controller, Verifier, Validator, QC, Meta-Verifier |
| Archived agents | 10 | `agents/archive/` (APW-era) |
| Scripts | 17+ | latest: `verify_before_assert.sh` |
| Git hooks | 2 | pre-commit (warnings-only chain), pre-push (sync check + safe_push.sh redirect) |
| Failure entries | F.1–F.28 | recent: F.23–F.28 form "confidence-without-verification" cluster |
| Devices registered | 2 | mac-main (MacBook), aurelia (Windows Strix Halo) |
| BACKUP_LOG rows | 267+ | append-only |

---

## 🆕 SHIPPED SINCE F.22 (What's New This Session)

### Newest infrastructure files

| File | Purpose |
|---|---|
| `scripts/verify_before_assert.sh` ⭐ NEW | Architectural fix for F.23+F.26+F.27 confidence-without-verification cluster — 3 heuristic checks (file-state-assertion-without-Read / invented-tier-without-citation / UC compression) |
| `scripts/e2e_verify.sh` | Single-command "is anything broken?" — runs 8 checks, aggregates pass/fail, names the protocol E2E |
| `scripts/sync_status.sh` | Sync Status block generator for SP.18 SSC at end of every output |
| `SOP_GUIDE.md` v1.1 | Plain-English human-readable guide — rewritten per SP.1 MagNet + SP.2 Door Scan (numbered TOC, sub-section numbering, short paragraphs) |
| `SOP_COMPLETE_REFERENCE.html` | Interactive HTML — every protocol + agent + script with dropdowns |
| `LEARNINGS_FROM_AURELIUS_VAULT.md` | Cross-pollination findings — GOLD-PATH protocol + PROVE-IT 9-point + 8 autonomous Python agents pattern |
| `REFINE_PROTOCOL_PROPOSAL.md` | SP.20 spec — Review/Extract/Foresee/Intervene/Note/Evolve weekly cycle for self-improvement |
| `cache/SIR_LOG.md` | Append-only log of System Improvement Reflection rows per output (SP.17 outputs) |

### New + updated protocols

| Protocol | Status | What it does |
|---|---|---|
| **SP.17 SIR** ⭐ NEW (F.20) | Active in MANDATORY_TIGHT_LOOP | Every OUTPUT-STANDARD/COMPLEX ends with 1–3 system-improvement insights (categorized + actionable) |
| **SP.18 SSC** ⭐ NEW (F.21) | Active | Every file-modifying output ends with explicit Sync Status block (commit / push / Obsidian / cross-device state) |
| **SP.21 MES** ⭐ NEW (F.25 → F.26 correction → F.27 doctoral re-spec) | Active — **doctoral spec with 15 verbatim clauses** | Declare `🎯 MODEL: <variant> · <tier>` at literally first content of output. Two orthogonal axes (model variant + effort tier). Conservative bias. Dual Sonnet gate (beyond-reasonable-doubt AND absolute certainty). Mid-output adjustment allowed; stable-start ideal. End-of-output retrospective. Universal — every output. |
| **SP.6 IAC** ⭐ STRENGTHENED (F.27 → F.28) | Active — doctoral precision + trivial-spec carve-out | Sub-clause granularity. Verbatim quotes for non-trivial clauses. Per-clause interpretation + ambiguity + completeness check. Carve-out: ≤1 normative clause OR ≤5 words OR continuation directive → 1-row UC sufficient. |

### F-class entries this session

| F.X | Pattern |
|---|---|
| F.23 | Edit-without-Read pattern (confidence in file state) |
| F.24 | (REFINE proposal docs) |
| F.25 | MES introduction (structural addition) |
| F.26 | MES tier names invented (confidence in vocabulary) |
| F.27 | UC compression (confidence in interpretation) |
| F.28 | Trivial-spec carve-out (over-expansion of trivial specs would be different failure) |

**Cluster:** F.23 + F.26 + F.27 = "confidence-without-verification." Architectural fix shipped: `scripts/verify_before_assert.sh`.

---

## 🎯 IMMEDIATE PENDING QUEUE (Next Chat Priorities)

Surfaced + ranked, ready to ship:

| # | Item | Effort | Priority | Notes |
|:-:|---|:-:|:-:|---|
| 1 | **`compliance_check.sh` Tier-1 fix** — accept 8/8 + 9/9 Pulse Check scores, extend meta-doc exclusion list, optionally relax SCOPE/EST requirement when 3-line STEP header detected | S (~15 min) | 🔴 HIGH | Pending across 6+ commits. Eliminates false-positive noise. Unblocks E2E 7/8 → 8/8. |
| 2 | **`scripts/e2e_verify.sh` adds check #9** — include `verify_before_assert.sh` in chain | XS (~5 min) | 🔴 HIGH | Bundle with #1 |
| 3 | **`PROTOCOLS_REFERENCE.md` add 5 missing entries**: SP.17 SIR + SP.18 SSC + SP.19 GLD + SP.20 REFINE + SP.21 MES (each with `<details>` block, full name + spec + sub-protocol mapping) | M (~25 min) | 🔴 HIGH | Quadruply-pending for SP.21. Discoverability blocker. |
| 4 | **Ship SP.19 GLD (GOLD-PATH from Aurelius)** | M (~30 min) | 🟡 MEDIUM | First real use of `scripts/add_protocol.sh`. Spec in `LEARNINGS_FROM_AURELIUS_VAULT.md`. |
| 5 | **Ship SP.20 REFINE** (6 agent files + 6 scripts as v1.0 stubs + cache/refine/ directory + new FAILURE_LEDGER type "PREEMPTIVE") | L (~4-6h) | 🟡 MEDIUM | Spec complete in `REFINE_PROTOCOL_PROPOSAL.md`. Closes Q.1 + Q.4 + Q.8 + Q.9. Projects 6.5/10 → ~8.0/10. |
| 6 | **Calibrate `verify_before_assert.sh`** | S (~15 min, after ~5 chain runs accumulate) | 🟢 LOW | Need data first |
| 7 | **Fix LTM drift** — add VL.X heuristic to compare LTM in output vs harness-reported tokens; flag >10% drift | S (~15 min) | 🟢 LOW | Drift was +17% this session (estimated 917K, actual 786K) |
| 8 | **Top 2 from F.22 roadmap**: full automation of `add_protocol.sh` + break same-brain ceiling via `Agent` tool | L (4-8h each) | 🟡 MEDIUM | Original F.22 priorities still valid |

---

## 📚 NEW LEARNINGS THIS SESSION (Key Patterns)

### F.19 cluster confirmed at the META level (F.22 found this)

> Rules-as-conventions decay. Rules-as-architecture hold. Apply recursively at every level.

### F.23+F.26+F.27 cluster: "confidence-without-verification"

Three F-class entries in one session:
- F.23: Edit without Read first (file-state confidence)
- F.26: Invented terminology (vocabulary confidence)
- F.27: UC compression (interpretation confidence)

**Architectural fix shipped:** `scripts/verify_before_assert.sh` with 3 heuristic checks.

### Aurelius cross-pollination (`xprimordius/aurelius-vault` + `aurelius-agent-stack`)

- We gave them: **N/M honesty marker** (acknowledged in their PROVE-IT-Protocol.md)
- They gave us: **GOLD-PATH protocol** (proposed SP.19), **Macro+Micro intent framing** (adopted), **PROVE-IT 9-point block** (richer than our Pulse Check)
- They have what we lack: **8+ autonomous Python agents on Windows Task Scheduler** (architectural answer to Q.3 same-brain ceiling)

### Doctoral UC (SP.6 IAC v1.5.1)

Old UC: compress user spec into table summary. Failure mode: lossy.

New UC (doctoral): break user spec into discrete numbered clauses with verbatim quotes + per-clause interpretation + ambiguity flags + completeness check. Carve-out for trivial specs (≤1 clause, ≤5 words, or continuation).

**Template:** see UC table in commit `375a94b` output for the canonical 15-clause example.

### MES (SP.21) with real tier names

`🎯 MODEL: <variant> · <tier>` opens every output:
- **Effort tiers:** max · very high · medium · low
- **Model variants:** Opus 4.7 · Opus 4.7 1M · Opus 4.6 legacy · Sonnet 4.6

Conservative bias: when in doubt, higher effort. Sonnet 4.6 only with DUAL gate (beyond-shadow-of-doubt AND absolute certainty). End-of-output: MES Retrospective with true-best-setting + calibration.

### LTM drift discovery

This session: I estimated 917K when actual was 786K (+17% overestimate). Going forward, mark LTM as `~XXX (±20%)` and reset from authoritative source periodically.

---

## 🗂️ ESSENTIAL READING ORDER (For Fresh Claude)

If bootstrap-verify passes 85+/0/0:

1. **`SESSION_START.md`** — entry point
2. **`MANDATORY_TIGHT_LOOP.md`** ⭐ — operational ruleset (currently v1.5.1: doctoral UC + trivial-spec carve-out + SP.21 MES + 9-item Pulse Check)
3. **`cache/SESSION_STATE.md`** — current position + DECISIONS LOG
4. **`cache/CONTINUATION.md`** — latest narrative handoff
5. **This file (`CONTINUATION_POINTER.md`)** — meta-pointer
6. **`cache/FAILURE_LEDGER.md`** — read **F.22, F.23, F.26, F.27, F.28** for current session context; F.19 for the meta-pattern
7. **`cache/SIR_LOG.md`** — in-flight improvement insights
8. **`QUINTESSENCE_ROADMAP.md`** — 32 deferred findings + 10-item acceptance criteria
9. **`LEARNINGS_FROM_AURELIUS_VAULT.md`** — cross-pollination insights
10. **`REFINE_PROTOCOL_PROPOSAL.md`** — SP.20 spec for next big ship

---

## 🔧 DAILY-USE COMMANDS

```bash
# Single-pane "anything broken?"
bash scripts/e2e_verify.sh

# State at a glance
bash scripts/sop_health_dashboard.sh

# Bootstrap (every session start)
bash scripts/bootstrap_verify.sh

# Verify before assert (catches F.23+F.26+F.27 patterns)
bash scripts/verify_before_assert.sh

# Test harness
bash tests/run_agent_tests.sh

# Multi-device check
bash scripts/check_device_activity.sh 7

# Insight recurrence (run weekly)
bash scripts/sir_recurrence.sh

# Chain health (run weekly)
bash scripts/audit_chain_health.sh

# Safe push (handles divergence atomically)
bash scripts/safe_push.sh

# Drift check
bash scripts/consistency_check.sh
```

---

## ✅ ACCEPTANCE CRITERIA — When Is The SOP "Done"?

From `QUINTESSENCE_ROADMAP.md` — quintessence reached when ALL 10 are true:

1. Bootstrap verify: pass=N, fail=0, warn=0, for last 10 consecutive runs
2. Chain warnings/run < 0.5 over last 20 chain firings
3. Every SubSOP added auto-propagates to all 9+ files (full `add_protocol.sh` automation)
4. At least 1 cross-model audit / week (`scripts/cross_model_audit.sh`)
5. Test harness covers all 4 chain agents with known-good + known-bad fixtures
6. SIR insight recurrence ≥ 2 auto-promotes to FAILURE_LEDGER
7. Session lifecycle (start + mid + end) fully scripted
8. **No Alan-prompted correction needed for 14 consecutive days**
9. Cross-model portability ≥ 95%
10. All 10 quintessence properties at ✅ full (currently 6.5/10)

**Track progress in:** `cache/SOP_HEALTH_METRICS.md`

---

## 📡 SYNC STATUS (At Commit `66194f4`, 2026-05-22 03:30 CDT)

| Channel | Status |
|---|---|
| Git: aurelia ↔ origin/main | ✅ 0/0 in sync |
| GitHub repo | ✅ `xprimordius/universal-sop` (private) |
| mac-main | ⏳ pending pull (multiple commits since last sync there) |
| Obsidian vault | ✅ no conflicts (aurelia .obsidian shared via .gitignore split) |
| Backup files | 270+ in `backups/` |
| BACKUP_LOG | 267+ rows, append-only |
| Last commit | `66194f4` — verify_before_assert.sh + SP.6 IAC carve-out |
| Active token usage (aurelia chat) | ~790K / 1M = 79% — NEW CHAT CUTOVER RECOMMENDED |

---

## 🧭 ONE-LINE SUMMARY

> Universal SOP v1.3 + MANDATORY_TIGHT_LOOP v1.5.1 (10+ active protocols including SP.17 SIR + SP.18 SSC + SP.21 MES, 9-item Pulse Check, doctoral UC with trivial-spec carve-out). Quintessence 6.5/10. Recent F.23+F.26+F.27 confidence-without-verification cluster fixed via `scripts/verify_before_assert.sh`. Aurelius cross-pollination shipped (LEARNINGS doc). Next chat: ship A+C bundle (compliance_check Tier-1 fix + e2e check #9), then PROTOCOLS_REFERENCE 5 missing entries, then SP.19 GLD + SP.20 REFINE.

---

*CONTINUATION_POINTER.md v2.0 | Token-cutover handoff at ~790K / 1M | aurelia | 2026-05-22 | commit 66194f4*
