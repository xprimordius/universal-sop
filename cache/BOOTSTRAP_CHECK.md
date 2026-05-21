# 🚀 BOOTSTRAP_CHECK — Comprehensive Boot-Up Self-Test
# VERSION: 2.0 | F.17 fix 2026-05-21 | Per Alan: "checklist for literally everything in detail with check marks"
# THIS FILE IS THE SPEC. `scripts/bootstrap_verify.sh` IS THE RUNNER.

---

## 🎯 PURPOSE (Why This Exists)

Alan's rule (2026-05-21): **Bootstrap must show a literal check mark for everything — agents, operations, SOPs, pre-SOPs, sub-SOPs, prime SOPs, scripts, hooks, goal tracking. Full transparency. Embedded in the file itself, like a system boot-up.**

This file:
1. **Lists every component that must be verified at session start** (the spec)
2. **Maps each to a verification method** (script check, grep check, manual surface)
3. **Provides the filled-in template AI surfaces in STEP 2** (boot screen)

Result: every Claude session opens with a literal `[OK]`-style boot sequence proving every part of the system is loaded and current. No silent failures. No "I think it's all there." Mechanical proof.

---

## ⚡ HOW TO USE (1 command + 1 paste)

### Step A — Run the mechanical verifier
```bash
bash scripts/bootstrap_verify.sh
```

This runs **67 mechanical checks** across 11 categories and prints a filled-in checklist. Exit code: `0` if all pass, `1` if any fail.

### Step B — Surface the output in STEP 2

Paste the script's output verbatim under your STEP 2 confirmation. Then add the conceptual checks (Section 12 below — macro/micro goals, last decisions, fusion status from memory) that scripts can't verify.

### Step C — If any ❌ or ⚠️ → investigate before continuing
Do NOT proceed to user task until either:
- All ❌ are resolved, OR
- The user explicitly accepts the failure (logged in FAILURE_LEDGER)

---

## 📋 THE 12-SECTION BOOT-UP CHECKLIST (Spec)

Every check below is verified at session start. Sections 1–11 are **mechanical** (script-driven). Section 12 is **conceptual** (AI fills in from cache reads).

---

### 🆔 Section 1 — Identity & Git State (4 checks)

| ✅ | Component | How Verified | Expected |
|:--:|-----------|--------------|----------|
| [ ] | Device name registered | `git config user.name` matches `Alan (device)` | `Alan (mac-main)` etc. |
| [ ] | Device email tagged | `git config user.email` contains `+device` tag | `alan+mac-main@local` |
| [ ] | Pre-commit hook path | `git config core.hooksPath` = `.githooks` | `.githooks` |
| [ ] | On main branch | `git branch --show-current` | `main` |

**Why:** F.15 protections (multi-device identity + append-only safety) only work if device naming + hook path are configured. Without these, commits anonymize + hooks bypass silently.

---

### 🤖 Section 2 — Active Agents (4 checks)

| ✅ | Agent | Role | File |
|:--:|-------|------|------|
| [ ] | **Controller** | Orchestration + cache manager (F4 fusion of Oversight + Cache Manager) | `agents/controller.md` |
| [ ] | **Validator-Merged** | Layer 1 — POVP + completeness + simplicity + cross-ref | `agents/validator-merged.md` |
| [ ] | **Karen** | Layer 2 reality check + script enforcement verification (F.16) | `agents/karen-reality-check.md` |
| [ ] | **Paradox Resolver** | On-demand — SCIO/APW tension resolution | `agents/paradox-resolver.md` |

**Why:** Active agent count = 4 (was 7 in March, fused down via F4 + F5). If a file is missing, the workflow that references it breaks.

**Archived (do NOT use):** `agents/archive/jenny-sop-verifier.md`, `oversight-executive.md`, `cache-manager.md`

---

### 📋 Section 3 — SOP Architecture (8 checks)

| ✅ | File | Purpose |
|:--:|------|---------|
| [ ] | `UNIVERSAL_SOP_PROMPT.md` | Active rulebook v1.3 (6 stages, 16 SubSOPs, 4 Ensurance) |
| [ ] | `PROTOCOLS_REFERENCE.md` | Full names + acronyms for every protocol |
| [ ] | `STANDALONE_SOP.md` | Self-contained external rulebook (MIT, shippable) |
| [ ] | `SESSION_START.md` | Bootstrap entry point (canonical) |
| [ ] | `CLAUDE.md` | Project config — redirects to SESSION_START |
| [ ] | `USER_PROFILE.md` | Alan's communication preferences |
| [ ] | `DEVICE_REGISTRY.md` | Multi-device naming registry (F.15) |
| [ ] | `MULTI_DEVICE_GIT_PROTOCOL.md` | 7 Golden Rules for multi-device hygiene |

---

### 🧩 Section 4 — SubSOPs (16 checks, all enumerated)

Every SubSOP must be present in PROTOCOLS_REFERENCE.md with full name + acronym.

| ✅ | ID | Full Name | Role |
|:--:|:--:|-----------|------|
| [ ] | SP.1 | **MagNet** (Magnetic Visual Engagement Protocol) | Visual standard — tables, emojis, scannable |
| [ ] | SP.2 | **Door Scan** (Door Scanning Pattern Protocol) | Emoji → brief → detail funnel |
| [ ] | SP.3 | **TTE** (Token Threshold Engine) | Budget math — GREEN/YELLOW/RED/CRITICAL |
| [ ] | SP.4 | **SCP** (System Change Protocol) | How to safely modify the SOP itself |
| [ ] | SP.5 | **FSP** (Fidelity Substantiation Protocol) | Every claim has evidence |
| [ ] | SP.6 | **IAC** (Intent Alignment Check) | Understanding Check before execution |
| [ ] | SP.7 | **Insights Protocol** | Surface present-adjacent helpful context |
| [ ] | SP.8 | **Protocol Visibility Protocol** | No hidden mechanics — surface every protocol used |
| [ ] | SP.9 | **FE** (Foresight Engine) | Predict next problems + solutions, priority-tagged |
| [ ] | SP.10 | **SCC** (Self-Compliance Check) | "Did I follow my OWN SOP rules?" |
| [ ] | SP.11 | **QAC** (Quality Assurance Check) | "Is the output structurally well-formed?" |
| [ ] | SP.12 | **HFR** (Honest Failure Report) | Root cause + permanent fix when something failed |
| [ ] | SP.13 | **SHR** (System Health Report) | Multi-dimensional scorecard |
| [ ] | SP.14 | **RPT** (Repeated Prompt Tracker) | Catch when user asks 2+ times |
| [ ] | SP.15 | **EEP** (Execution Enforcement Protocol) | Execute, don't acknowledge — no future tense |
| [ ] | SP.16 | **PCG** (Prompt Completion Gate) | Pre-send: every prompt item has execution proof |

**Why each is verified:** PROTOCOLS_REFERENCE.md is the source of truth (Rule #11 mandate). If an entry is missing, full-name + acronym enforcement breaks.

---

### 🛡️ Section 5 — Ensurance System (4 checks)

| ✅ | ID | Full Name | Role |
|:--:|:--:|-----------|------|
| [ ] | EN.1 | **Output Skeleton** (Structural Anti-Decay Mechanism) | Mandatory sections never silently dropped |
| [ ] | EN.2 | **Priority 10** (Cognitive Load Reduction) | Top-10 attention rules, surfaced every output |
| [ ] | EN.3 | **Checkpoint Cycle** (Attention Reset) | Re-anchor after long sections |
| [ ] | EN.4 | **Pulse Check** (Compliance Pulse Check) | 10-second mechanical pre-send audit (P1-P17) |

**Why:** Without Ensurance, the SOP decays after 4–6 outputs (DC.1-DC.5 documented in PROJECT_HISTORY). EN.1-EN.4 are the structural anti-decay layer that survives attention depletion.

---

### 🗄️ Section 6 — Active Cache Files (5 + 2 dirs)

Post-F2 fusion (2026-05-21) — APW caches archived to `cache/legacy/`.

| ✅ | File | Purpose |
|:--:|------|---------|
| [ ] | `cache/SESSION_STATE.md` | Current position + decisions log + token usage |
| [ ] | `cache/CONTINUATION.md` | Latest session handoff |
| [ ] | `cache/BACKUP_LOG.md` | All backups indexed (~30+ entries) |
| [ ] | `cache/FAILURE_LEDGER.md` | Unified REPEAT + FAILURE log (F8 fusion) |
| [ ] | `cache/RPT_LOG.md` | Deprecated redirect → FAILURE_LEDGER |
| [ ] | `cache/BOOTSTRAP_CHECK.md` | This file (the spec) |
| [ ] | `cache/legacy/` (dir) | Archived APW-era files (F1 + F2 fusions) |
| [ ] | `cache/backups/` (dir) | Historical snapshots before edits (D32) |

---

### ⚙️ Section 7 — Scripts / Mechanical Enforcement Layer (7 checks)

Same-brain self-audit has a ceiling (~8.5/10 friction). Scripts close the gap.

| ✅ | Script | Enforces |
|:--:|--------|----------|
| [ ] | `scripts/compliance_check.sh` | Rule #11 full-name enforcement (F.14) |
| [ ] | `scripts/consistency_check.sh` | Version drift detection |
| [ ] | `scripts/setup_device.sh` | One-command device registration (F.15) |
| [ ] | `scripts/append_only_check.sh` | History file protection (F.15) |
| [ ] | `scripts/check_device_activity.sh` | Multi-device audit (F.15) |
| [ ] | `chat_archive/archive_chat.sh` | Session JSONL snapshot |
| [ ] | `scripts/bootstrap_verify.sh` | THIS comprehensive boot self-test (F.17) |

---

### 🪝 Section 8 — Git Hooks (1 check)

| ✅ | Hook | Enforces |
|:--:|------|----------|
| [ ] | `.githooks/pre-commit` | Mechanical layer — runs compliance + consistency + append-only on every commit (F.16). Cannot bypass without `--no-verify`. |

---

### 🔀 Section 9 — Fusion Execution Status (8 checks)

Phase A + B SAFE fusions. All must be EXECUTED.

| ✅ | Fusion | What |
|:--:|--------|------|
| [ ] | **F1** | Historical SOPs (PRIME_SOP, BRIDGE_SOP, SOP_FULL_REFERENCE) → `cache/legacy/` |
| [ ] | **F2** | 9 APW-era cache files → `cache/legacy/` (active cache 14 → 5) |
| [ ] | **F4** | Oversight + Cache Manager → fused into Controller (~1.5K saved/session) |
| [ ] | **F5** | Jenny standalone → archived to `agents/archive/` |
| [ ] | **F7** | Wrap-Up cluster (FE + Insights + SHR) formalized in PROTOCOLS_REFERENCE |
| [ ] | **F8** | RPT + HFR unified → FAILURE_LEDGER.md |
| [ ] | **F10** | TTE (Token Threshold Engine) + LTM (Live Token Monitor) Token System documented as cluster |
| [ ] | **F11** | MagNet + Door Scan + Protocol Visibility → Visual System cluster |

**Not executed (by design):**
- F3 (Validator + Karen merge) — REJECTED (theater compliance risk)
- F6 (16 → 10 SubSOPs) — DOCUMENTATION ONLY
- F9 (EEP + PCG) — KEPT SEPARATE (timing precision)
- F12 (SCC + QAC + EN.4) — KEPT SEPARATE BY DESIGN (lens distinction)

---

### 🎯 Section 10 — Goal Tracking (F.13, 3 checks)

| ✅ | Component | Where Verified |
|:--:|-----------|----------------|
| [ ] | MACRO GOAL section in SESSION_STATE | `cache/SESSION_STATE.md` |
| [ ] | MICRO GOAL section in SESSION_STATE | `cache/SESSION_STATE.md` |
| [ ] | GOAL STATUS section in SESSION_STATE | `cache/SESSION_STATE.md` |

**Why:** F.13 root cause was O1 OBJECTIVE DRIFT — 14 sessions on SOP while APW course (the macro goal) paused. Structural fix: every step header must surface MACRO + MICRO from SESSION_STATE.

---

### 📊 Section 11 — Harness Drift Detection (2 checks)

Compensates for stale `claudeMd` injection (the harness may show v3.9.2 / 32 D-rules — those are HISTORICAL APW-era references, not current state).

| ✅ | Check | Expected |
|:--:|-------|----------|
| [ ] | UNIVERSAL_SOP_PROMPT.md contains "v1.3" | ✓ |
| [ ] | UNIVERSAL_SOP_PROMPT.md contains "16 SubSOPs" | ✓ |

---

### 🧠 Section 12 — Conceptual Checks (AI Fills In From Cache Reads)

The script CANNOT verify these. AI must surface them from SESSION_STATE + CONTINUATION + FAILURE_LEDGER reads.

| ✅ | Check | Source | Surface In STEP 2 |
|:--:|-------|--------|------------------|
| [ ] | MACRO goal read aloud | SESSION_STATE GOAL TRACKING | 🎯 line |
| [ ] | MICRO goal read aloud | SESSION_STATE GOAL TRACKING | 📌 line |
| [ ] | Macro Status (drift / on-track) | SESSION_STATE GOAL STATUS | 📊 line |
| [ ] | Last 3 decisions read | SESSION_STATE decisions log | "Last decisions" lines |
| [ ] | Current position read | SESSION_STATE CURRENT POSITION | "Current position" line |
| [ ] | Macro-level next action | SESSION_STATE GOAL TRACKING | ▶️ line |
| [ ] | Micro-level next action | SESSION_STATE GOAL TRACKING | ▶️ line |
| [ ] | Failure ledger count surfaced | FAILURE_LEDGER (F.1–F.N) | "Repeated failures" line |
| [ ] | Latest session handoff understood | CONTINUATION.md Session N block | (internalize) |
| [ ] | Token budget posted | LTM running estimate | Token budget line |

---

## ✅ STEP 2 CONFIRMATION TEMPLATE (Per SESSION_START)

After running the verifier + surfacing conceptual checks, AI sends this to user:

```
🚀 BOOT-UP SELF-TEST
SOP: v1.3 loaded | 16 SubSOPs + EN.1-EN.4 | 4 agents | 5 cache files

[paste bootstrap_verify.sh output here — all 67 mechanical checks]

🧠 CONCEPTUAL CHECKS (Section 12 — AI-sourced from cache):
🎯 MACRO: [from SESSION_STATE GOAL TRACKING]
📌 MICRO: [from SESSION_STATE GOAL TRACKING]
📊 Macro Status: [from GOAL STATUS]
Current position: [from CURRENT POSITION]
Last 3 decisions:
  • [decision 1]
  • [decision 2]
  • [decision 3]
▶️ Macro-level next action: [from GOAL TRACKING]
▶️ Micro-level next action: [from GOAL TRACKING]
Repeated failures to avoid: F.1–F.N (count from FAILURE_LEDGER)
Token budget: ~XK loaded / 200K | Status: 🌱 GREEN

✅ ALL SYSTEMS GO — Ready for your task.
```

If verifier exits non-zero, **DO NOT** confirm "ALL SYSTEMS GO." Surface the failed items and ask Alan whether to fix or proceed.

---

## 🛡️ FAILURE MODES THIS CHECKLIST PREVENTS

| 🚨 Failure | 🛡️ Catch |
|-----------|----------|
| Stale `claudeMd` says SOP v3.9.2 | Section 11 — version check from on-disk file |
| AI forgets one of 16 SubSOPs | Section 4 — every SP.1–SP.16 enumerated |
| Agent file deleted accidentally | Section 2 — file existence checked |
| Pre-commit hook deactivated | Section 1 — `core.hooksPath` checked |
| Device commits anonymized | Section 1 — `user.name` format checked |
| Goal tracking absent (O1 drift) | Section 10 + 12 — MACRO/MICRO surfaced literally |
| Fusion silently undone | Section 9 — fusion-marker grep per fusion |
| Scripts deleted | Section 7 — every script existence + executable bit checked |
| Cache file deleted | Section 6 — every active cache verified |
| FAILURE_LEDGER stale count | Section 12 — count surfaced in STEP 2 |

---

## 📜 EVOLUTION LOG

| 📅 Date | 🔀 Change |
|---------|----------|
| 2026-05-21 (v2.0) | **F.17 fix** — converted from "expected answers" Q&A table to comprehensive boot-up checklist with mechanical verifier. 67 mechanical + 10 conceptual = 77 total checks. |
| 2026-05-21 (v1.0) | Created per sub-agent test #6 (FT7.7) recommendation as Q&A self-verification |

---

## 🎯 USAGE PATTERN

**On EVERY session start:**
```bash
git pull && bash scripts/bootstrap_verify.sh
```

Then in STEP 2, paste the output verbatim + add Section 12 conceptual lines.

**If you skip this:** you risk shipping with a silent failure (missing agent, broken hook, stale fusion). The mechanical checks cost ~3 seconds. The cost of NOT checking is hours of debugging downstream.

**Read time:** ~60 seconds (skim the spec). **Run time:** ~3 seconds (the script).

---

*SOP v1.3 | This file: BOOTSTRAP_CHECK.md v2.0 (F.17) | Comprehensive boot self-test | 2026-05-21*
