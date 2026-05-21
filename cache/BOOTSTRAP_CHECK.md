# 🧪 BOOTSTRAP_CHECK — Self-Verification Unit Test
# F7.7 fix 2026-05-21 | Built per sub-agent recommendation
# Read this as the LAST step of bootstrap to verify your understanding matches expected state

---

## 🎯 PURPOSE

After completing SESSION_START.md STEP 1 (reading 7 cache+profile files + this BOOTSTRAP_CHECK as item #8 — 8 total mandatory for COLD START path), read THIS file to verify your mental model matches the project's expected current state. If any answer below doesn't match what you understood from the bootstrap files, you have a comprehension gap that needs investigation BEFORE acting.

**Read time:** ~90 seconds (honest — ~130 lines, was claimed as 30s but sub-agent test #10 corrected). **Catches:** stale-cache pollution, harness-injected drift, misread structural decisions.

---

## ✅ EXPECTED CURRENT STATE (As Of 2026-05-21)

### SOP Version & Architecture
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| What is the active SOP version? | **v1.3** |
| How many stages in the SOP? | **6** (Understand, Measure, Execute, Self-Check, Wrap-Up, Confirm) |
| How many SubSOPs? | **16** (SP.1 through SP.16) |
| How many Ensurance components? | **4** (EN.1 through EN.4) |
| Total protocols + Ensurance? | **20** |
| Is APW course work active? | **NO** — paused, returning after real-device test passes |

### Active Cache (Post-F2 Fusion)
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| How many ACTIVE cache files? | **5** (SESSION_STATE, CONTINUATION, BACKUP_LOG, FAILURE_LEDGER, RPT_LOG-deprecated-redirect) |
| Where are legacy APW cache files? | `cache/legacy/` (9 files + INDEX) |
| What's the unified failure log called? | **FAILURE_LEDGER.md** (NOT RPT_LOG — RPT_LOG is deprecated redirect since F8 fusion) |
| How many FAILURE_LEDGER entries? | **11** (F.1 through F.11) |

### Active Agents (Post-F4+F5 Fusions)
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| How many active agents? | **4** |
| Names? | Controller, Validator-Merged, Karen, Paradox Resolver |
| What was archived in F4? | Oversight Executive + Cache Manager → merged into Controller |
| What was archived in F5? | Jenny (standalone) → role absorbed by Validator-Merged Section A |

### Bootstrap Procedure
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| What's the entry-point file? | **SESSION_START.md** (NOT CLAUDE.md — CLAUDE.md redirects to SESSION_START) |
| How many STEP 1 mandatory reads? | **7** (SESSION_START + SESSION_STATE + CONTINUATION + FAILURE_LEDGER + USER_PROFILE + PROTOCOLS_REFERENCE + UNIVERSAL_SOP_PROMPT) |
| What's the canonical confirmation format? | **SESSION_START STEP 2** — 9-line format starting with `✅ RESUMED` |
| Auto Mode + STEP 3 conflict? | Bootstrap FIRST, then Auto Mode operates |

### Fusion Status (As Of 2026-05-21)
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| F1 (Archive historical SOPs)? | **EXECUTED** — PRIME_SOP, BRIDGE_SOP, SOP_FULL_REFERENCE in cache/legacy/ |
| F2 (APW cache → legacy)? | **EXECUTED** — 9 APW cache files in cache/legacy/ |
| F3 (Validator + Karen merge)? | **REJECTED** — theater compliance risk |
| F4 (Oversight + Cache Manager → Controller)? | **EXECUTED** — single Controller agent |
| F5 (Archive Jenny standalone)? | **EXECUTED** — in agents/archive/ |
| F6 (16 → 10 SubSOPs)? | **DOCUMENTATION ONLY** — clusters via PROTOCOLS_REFERENCE, count unchanged |
| F7 (Wrap-Up cluster)? | **EXECUTED** — formalized in PROTOCOLS_REFERENCE |
| F8 (RPT + HFR → FAILURE_LEDGER)? | **EXECUTED** — unified ledger |
| F9 (EEP + PCG merge)? | **KEPT SEPARATE** — timing precision (during vs pre-send) |
| F10 (TTE + LTM cluster)? | **EXECUTED** — documented as Token System |
| F11 (Visual System cluster)? | **EXECUTED** — MagNet + Door Scan + Protocol Visibility |
| F12 (SCC + QAC + EN.4 merge)? | **KEPT SEPARATE BY DESIGN** — lens distinction |

### Current Top Priority (P0)
| ❓ Question | ✅ Expected Answer |
|------------|-------------------|
| What is canonical P0? | **Real device test of SOP v1.3** using REAL_DEVICE_TEST.md on physical 2nd device |
| Why? | 9 sub-agent in-session tests plateau at 7-8.5/10. Real device closes the validation loop. |
| Approximate time? | ~30-45 min |

---

## 🚨 IF YOUR UNDERSTANDING DOES NOT MATCH

If ANY answer above doesn't match what you understood from the STEP 1 bootstrap, you have one of these problems:

| 🚨 Symptom | 🔮 Likely Cause | 🛡️ Fix |
|-----------|-----------------|--------|
| You think SOP is v3.9.2 / 32 D-rules / 126 prompt items | Read stale harness-injected `claudeMd` block instead of on-disk CLAUDE.md | Re-read on-disk CLAUDE.md AND SESSION_START.md. Honor the Precedence Rule. |
| You think there are 9 cache files / loaded APW caches | Followed legacy CLAUDE.md "MANDATORY SESSION START" instead of SESSION_START.md STEP 1 | Defer to SESSION_START STEP 1 (7 files including USER_PROFILE + PROTOCOLS_REFERENCE) |
| You used "Caches Loaded" 5-line confirmation format | Followed legacy CLAUDE.md confirmation format | Use SESSION_START STEP 2 9-line format |
| You think there are 5+ agents (Oversight, Cache Manager, Jenny) | Read pre-F4/F5 fusion architecture | Re-read INVENTORY.md or controller.md — agents are now 4 |
| You think the failure log is RPT_LOG.md | Read pre-F8 fusion docs | FAILURE_LEDGER.md is the active log; RPT_LOG.md is deprecated redirect |
| You don't know what F2 / Controller / FAILURE_LEDGER mean | Did NOT read SESSION_STATE.md decisions log | Re-read SESSION_STATE — all fusion decisions logged there |
| You're about to start work without WAIT confirmation | Did NOT honor SESSION_START STEP 3 | STOP. Confirm via STEP 2 format. Wait for user. |

---

## 📊 STATE EVOLUTION TIMELINE (Reference)

Recent major changes (most recent first):

| 📅 Date | 🔀 Change |
|---------|----------|
| 2026-05-21 | F2 EXECUTED — APW cache → legacy/ (active cache 14 → 5) |
| 2026-05-21 | F7+F8 EXECUTED — Wrap-Up cluster + FAILURE_LEDGER |
| 2026-05-21 | F4 EXECUTED — Controller fusion (agents 5 → 4) |
| 2026-05-21 | F5 EXECUTED — Jenny archived (after F4) |
| 2026-05-21 | F1 EXECUTED — Historical SOPs → cache/legacy/ |
| 2026-05-21 | RPT.10 + RPT.11 added (truncation + `<details>` patterns), now F.10 + F.11 in FAILURE_LEDGER |
| 2026-05-21 | PROTOCOLS_REFERENCE.md mandatory (Rule #11 — full names) |
| 2026-05-21 | USER_PROFILE.md mandatory (FT.1 fix) |
| 2026-05-21 | SESSION_START Precedence Rule + Auto Mode resolution + STEP 0.5 git pull |
| 2026-05-21 | STANDALONE_SOP.md built + validated SELF-SUFFICIENT |
| 2026-05-18 | GitHub repo initialized (PRIVATE) |
| 2026-04-16 | 4 external consulting docs built |
| 2026-04-01 | SOP v1.2 → v1.3 (Ensurance System EN.1-EN.4 added) |
| 2026-03-31 | Universal SOP v1.0 → v1.2 (16 SubSOPs established across 9 rounds) |
| 2026-03-15 | APW Prime SOP v2.8 (12 stages, 32 D-rules) |

---

## 🎯 USAGE

**When to read this file:**
- After STEP 1 mandatory reads, BEFORE confirming bootstrap
- After major fusions or version bumps (to verify you absorbed the change)
- When in doubt about current state (drift detection)

**When NOT to read this file:**
- Mid-task (it's a checkpoint, not a working reference)
- For protocol mechanics (use PROTOCOLS_REFERENCE.md instead)

**Goal:** ~30-second sanity check that your mental model matches reality.

---

*SOP v1.3 | This file: BOOTSTRAP_CHECK.md v1.0 | Bootstrap self-verification unit test | 2026-05-21 | Per sub-agent test #6 (FT7.7) recommendation*
