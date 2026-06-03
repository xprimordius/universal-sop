# 🗺️ SYSTEM BRIEF — Universal Output SOP (What We Have + What's Missing)
# VERSION: 1.0 | 2026-06-03 | Built from 3-agent parallel audit (Session 6)
# PURPOSE: The one file that explains the WHOLE system in plain English — with dropdowns, timelines, and an honest gap list.

> **Read this first if you're confused about how everything fits together.** Everything below is collapsible — open only what you need. Numbers are from a real audit (3 sub-agents read every SOP file and graded it), not vibes.

> ⚠️ **CURRENCY NOTE (multi-device).** This brief was authored on **mac-main** against its local state, then rebased onto origin which had **82 newer commits from aurelia**. The aurelia branch has since advanced past some counts cited below: **5 agents** (Controller + Verifier + Validator + QC + Meta-Verifier — not 4), **18 SubSOPs** (SP.17 SIR + SP.18 SSC added — not 16), and **FAILURE_LEDGER at F.61** (not F.18). The *structural findings* (instruction-completeness grades, the 3 contradiction bugs, the 4 legacy orphans, the efficiency map) were taken against the SOP as it stood and remain directionally valid — but re-confirm specific line numbers / counts against the current `UNIVERSAL_SOP_PROMPT.md` before acting. A v1.1 refresh should re-audit the post-aurelia rulebook.

---

## 🎯 30-SECOND MENTAL MODEL

The system is **one rulebook + helpers that keep the rulebook honest.** That's it. Five layers:

```
┌─────────────────────────────────────────────────────────────┐
│  LAYER 0 — BOOTSTRAP      How a new session loads everything  │
│  SESSION_START.md → bootstrap_verify.sh → STEP 2 confirm      │
├─────────────────────────────────────────────────────────────┤
│  LAYER 1 — THE RULEBOOK   What "good output" means            │
│  UNIVERSAL_SOP_PROMPT.md = 6 Stages + 16 SubSOPs + 4 Ensurance│
├─────────────────────────────────────────────────────────────┤
│  LAYER 2 — ENFORCEMENT    Stops the rulebook from decaying    │
│  4 Agents + 8 Scripts + 1 pre-commit + 1 pre-push hook        │
├─────────────────────────────────────────────────────────────┤
│  LAYER 3 — MEMORY         Survives across sessions/devices    │
│  cache/ (5 active files) + chat_archive/ + git/GitHub         │
├─────────────────────────────────────────────────────────────┤
│  LAYER 4 — REFERENCE      Deep detail, loaded on demand only  │
│  PROTOCOLS_REFERENCE + STANDALONE_SOP + legacy/ + guides      │
└─────────────────────────────────────────────────────────────┘
```

**The core idea:** an AI's compliance *decays* after a few outputs (it forgets its own rules). So the system isn't just a rulebook — it's a rulebook **plus structural machinery** (Ensurance + scripts + hooks) that mechanically forces the rules to keep firing. That machinery is the actual innovation.

**Plain-English flow of one output:** Understand the ask → back up files → estimate tokens → execute step-by-step → self-check mid-stream → pulse-check before sending → ship → confirm.

---

## 🧩 HOW THE PIECES RELATE (The Part That Wasn't Clear)

| 🏷️ Term | 🟢 Plain English | 📍 Where it lives |
|---------|------------------|-------------------|
| **Prime SOP** | The ORIGINAL rulebook from the APW-course era (v2.8, 12 stages, 32 "D-rules"). **Retired.** Its good ideas were distilled into the Universal SOP. | `cache/legacy/PRIME_SOP.md` |
| **Bridge SOP** | A transitional spec that birthed the visual rules (MagNet, Door Scan). **Retired.** | `cache/legacy/BRIDGE_SOP.md` |
| **Universal SOP** | The CURRENT active rulebook (v1.3). Project-agnostic. This is what's enforced today. | `UNIVERSAL_SOP_PROMPT.md` |
| **Stage** | One of 6 phases of producing output (Understand → Measure → Execute → Self-Check → Communicate → Confirm). | SOP lines 138–323 |
| **SubSOP (SP.x)** | A specific always-on or on-demand rule (16 of them). E.g. SP.3 = token tracking. | SOP lines 627–642 + dedicated sections |
| **Ensurance (EN.x)** | The 4 anti-decay mechanisms that force the SubSOPs to keep firing. The "immune system." | SOP lines 887–987 |
| **Agent** | A separate AI persona invoked for heavy validation (4 of them). Rare in normal flow. | `agents/` |
| **Script** | A bash file that mechanically checks something (~0 tokens, can't lie). | `scripts/` |
| **Cache** | Markdown files that remember state across sessions. The "save game." | `cache/` |

> **The one-sentence version:** *Prime SOP and Bridge SOP are the grandparents (retired); the Universal SOP is the living rulebook; SubSOPs are its rules; Ensurance + agents + scripts are the enforcement; cache is the memory.*

---

## 📊 INSTRUCTION-COMPLETENESS AUDIT (Your Question: "Do they all have instructions?")

**Audited by a sub-agent that read the full rulebook and graded all 28 items on 5 criteria** (trigger / instructions / output format / example / enforcement).

### 🟢 Headline: 18 ✅ Complete · 9 🟡 Partial · 1 🔴 Name-only

| Layer | ✅ Complete | 🟡 Partial | 🔴 Name-only |
|-------|:----------:|:---------:|:------------:|
| 6 Stages (+1B +3.5 = 8 checkpoints) | 6 | 2 | 0 |
| 16 SubSOPs | 9 | 6 | 1 |
| 4 Ensurance | 3 | 1 | 0 |
| **TOTAL (28)** | **18** | **9** | **1** |

<details>
<summary><b>📋 Full grade table — all 16 SubSOPs (click to expand)</b></summary>

| ID | Name | Verdict | What it has / what's missing |
|----|------|:-------:|------------------------------|
| SP.1 | MagNet (Magnetic Visual Engagement Protocol) | ✅ | Full MN.1–MN.10 rule table w/ self-tests. (No output artifact by design — it's a filter.) |
| SP.2 | Door Scan (Door Scanning Pattern Protocol) | ✅ | Emoji→brief→detail convention specified + enforced in Stage 5. |
| SP.3 | TTE (Token Threshold Engine) | ✅ | **Strongest.** Reserve math, threshold map, hard pre-step gate, numeric example. |
| SP.4 | SCP (System Change Protocol) | 🟡 | Says "show BEFORE vs AFTER" but **no template literal, no example**. Format undefined. |
| SP.5 | FSP (Fidelity Substantiation Protocol) | 🟡 | Names 5 required elements but **no reusable template, no example**. |
| SP.6 | IAC (Intent Alignment Check) | 🟡 | Behavioral check, **no output artifact, no example** — verifiable only by self-report. |
| SP.7 | Insights Protocol | 🔴 | **The one true gap.** No criteria, no method, no format, no example, no enforcement. A name only. |
| SP.8 | Protocol Visibility | 🟡 | Relies on the LTM "SubSOPs ran" line; no standalone format. |
| SP.9 | FE (Foresight Engine) | ✅ | Dedicated FE.1–FE.5 + output literal + enforced via Priority 10. |
| SP.10 | SCC (Self-Compliance Check) | 🟡 | Strong intent + triggers HFR, but **no standalone output template**. |
| SP.11 | QAC (Quality Assurance Check) | 🟡 | Same shape as SCC — purpose defined, **no standalone format/example**. |
| SP.12 | HFR (Honest Failure Report) | ✅ | Dedicated section + table literal + auto-trigger. |
| SP.13 | SHR (System Health Report) | ✅ | Dedicated section + 3-subtable literal. |
| SP.14 | RPT (Repeated Prompt Tracker) | ✅ | Dedicated RPT.1–RPT.5 + output literal + logs to ledger. |
| SP.15 | EEP (Execution Enforcement Protocol) | ✅ | Dedicated EEP.1–EEP.6 + execution-count "MUST be 0" hard gate. |
| SP.16 | PCG (Prompt Completion Gate) | ✅ | Dedicated PCG.1–PCG.6 + debt counter + 2-strike rule. |

</details>

<details>
<summary><b>📋 Stages + Ensurance grades (click to expand)</b></summary>

| ID | Name | Verdict | Note |
|----|------|:-------:|------|
| Stage 1 | Understand | ✅ | Word-by-word checklist + table template. |
| Stage 1B | Pre-Execution Backup | ✅ | 4-step table + save-confirmation literal + hard gate. |
| Stage 2 | Measure | ✅ | 5-step table + LTM literal (placeholder example only). |
| Stage 3 | Execute | ✅ | 5-step table + step-tracking table w/ all columns. |
| Stage 3.5 | Mid-Execution Compliance | 🟡 | 6 remediation checks but **no logged proof-of-run** — unverifiable. |
| Stage 4 | Self-Check | ✅ | 5-step table + Pre-Send Check Log literal. |
| Stage 5 | Communicate | ✅ | 9 standards + output-header literal + acronym example. |
| Stage 6 | Confirm & Improve | 🟡 | "Optimization Cycle" label only — **no full output template, no worked example**. |
| EN.1 | Output Skeleton | ✅ | **The backbone.** Most complete template in the doc (paste-first, fill-after). |
| EN.2 | Priority 10 | ✅ | Ranked 10-item table w/ concrete named rules. |
| EN.3 | Checkpoint Cycle | 🟡 | "Re-read every 3 outputs" but **no counter/proof** — functionally unverifiable. |
| EN.4 | Pulse Check | ✅ | Rapid 10-check + Y/N scoring + "FIX before sending" hard gate. |

</details>

<details>
<summary><b>🔍 The honest verdict (read this)</b></summary>

A cold AI could faithfully run **~80%** of this from the text alone. The strong half (TTE, FE, HFR, SHR, RPT, EEP, PCG, EN.1, EN.2, EN.4) have a clear trigger + dedicated rule table + output literal + a **hard enforcement gate** (a "MUST be 0" counter or a "FIX before send" stop). **EN.1 (skeleton) and EN.4 (pulse check) are what make everything else enforceable** — they're the strongest-specified parts.

The weak ~20% is the **Per-Output quality cluster** (SP.5, SP.6, SP.8, SP.10, SP.11) plus **SP.7**. These live only as one-line registry descriptions and are "enforced" by the AI grading itself in a report row — which is circular (no external artifact to point at). **SP.7 Insights is the single genuinely-undefined protocol.**

The document-wide weakness is **examples**: nearly everything ships a placeholder template (`[X]`, `~XK`) instead of a filled worked example. The AI knows the *shape* but must infer realistic content — so each session improvises slightly differently.
</details>

---

## 🚨 GAPS WE'RE MISSING (Prioritized)

### 🔴 P0 — Contradiction Bugs (fidelity, not bloat — fix first)

These aren't missing features; they're places the system **disagrees with itself**, forcing a reader to load a third file to adjudicate. The irony: the SOP's own "single source of truth" rule is violated inside the SOP.

<details>
<summary><b>🐛 Bug 1 — Pulse Check item count is 10 AND 15 AND 17 simultaneously</b></summary>

- `UNIVERSAL_SOP_PROMPT.md` + `SESSION_START.md` say **10 items** (P1–P10)
- `STANDALONE_SOP.md` says **15** in one place (L631) and **17** in another (L661, adds P16/P17)
- **Impact:** "Pulse Check 10/10" vs "17/17" — the score is meaningless if the denominator drifts. P16 (MACRO/MICRO) and P17 (compliance_check passed) are real additions from F.13/F.14 that never propagated back to the canonical list.
- **Fix:** Pick ONE canonical count (should be **17**, since P16/P17 are live fixes). Define once in UNIVERSAL_SOP. Everyone else points to it.
</details>

<details>
<summary><b>🐛 Bug 2 — GREEN token threshold is &lt;100K in one file, &lt;108K everywhere else</b></summary>

- `CLAUDE.md` (legacy D27 zone) says GREEN `<100K`
- Active SOP says GREEN `<108K`
- **Impact:** Low (the legacy zone is marked historical) but it's a live contradiction in an auto-injected file.
- **Fix:** Move the legacy D27 token-gate block to `cache/legacy/` or delete the stale number.
</details>

<details>
<summary><b>🐛 Bug 3 — Step header has MACRO/MICRO lines in STANDALONE but not UNIVERSAL</b></summary>

- `STANDALONE_SOP.md` step header includes 🎯 MACRO + 📌 MICRO (the F.13 fix)
- `UNIVERSAL_SOP_PROMPT.md` step header does **not**
- **Impact:** The active rulebook is missing the very anti-drift fix that F.13 introduced. A session reading UNIVERSAL (cold start) won't surface macro/micro.
- **Fix:** Port the MACRO/MICRO lines into UNIVERSAL_SOP's step-header definition.
</details>

### 🟡 P1 — Instruction Gaps (protocols that need real instructions)

<details>
<summary><b>📝 SP.7 Insights — define it or demote it</b></summary>

The only 🔴 name-only protocol. Either:
- **(a) Define it:** criteria for what qualifies as an insight + output format + 1 worked example, OR
- **(b) Demote it:** fold into SP.9 Foresight Engine (they overlap) and drop the standalone count to 15 SubSOPs.

Recommendation: **(b)** — it reduces protocol count (efficiency) and removes a phantom.
</details>

<details>
<summary><b>📝 SP.5 / SP.6 / SP.8 / SP.10 / SP.11 — give each a 2-line output template</b></summary>

These are conceptually fine but have no concrete artifact. Cheapest fix: add a one-row template literal + one filled example to each in PROTOCOLS_REFERENCE.md (the deep ref). ~15 min total. Converts 5 🟡 → ✅.
</details>

<details>
<summary><b>📝 Stage 3.5 + EN.3 — add a proof-of-run marker</b></summary>

Both are "internal checks" with no logged output, so "did it actually run?" is unanswerable. Fix: a single line in the wrap-up ("🔄 Mid-exec check: ran ✓ / Checkpoint cycle: output #N of 3"). Converts 2 🟡 → ✅.
</details>

### 🟢 P2 — Orphaned Legacy Instructions Worth Porting

The legacy Prime SOP had 32 D-rules. 14 cleanly migrated, 9 were APW-course-specific (correctly left behind). **4 are genuinely useful and never made the jump:**

<details>
<summary><b>♻️ The 4 orphans worth porting (with where to put them)</b></summary>

| Orphan | What it did | Why it matters now | Where to add |
|--------|-------------|-------------------|--------------|
| **D23 + D24** | Increment SOP version on every change; state v_old→v_new | The active system has **version-drift risk with no enforcement** (this whole audit found drift) | SP.4 SCP |
| **D30** | Chunked delivery — one deliverable per message, verify before next | Distinct anti-error rule; Tier system governs iteration count, not delivery granularity | SP.15 EEP or Tier defs |
| **D3 + D13** | The labeled "Optimization Cycle — Round #" proactive-improvement loop | The *generative* "here's how we could improve this, want it?" behavior is largely lost | New EEP clause (if wanted) |
| **D22** | "The SOP is itself a deliverable, subject to every rule" | Cheap meta-rule preventing the rulebook from being exempt from its own standards | SOP preamble |

Everything else orphaned (D5, D8–D12, D14, D16, D17) is APW-course-specific — correctly archived, leave it.
</details>

---

## ⚡ EFFICIENCY: "Can we make it leaner without losing fidelity?"

**Yes.** Audited token load: the 5 core files = **~36K tokens, ~36% of which (~13K) is restatement.** But most duplication is *defensible* (STANDALONE_SOP must be self-contained). The real wins:

<details>
<summary><b>📊 Token-load table (what costs what, what loads when)</b></summary>

| File | Lines | ~Tokens | Loaded at bootstrap? |
|------|------:|--------:|----------------------|
| UNIVERSAL_SOP_PROMPT.md | 1016 | ~11.7K | COLD only (FAST defers to 2K TL;DR) |
| PROTOCOLS_REFERENCE.md | 1011 | ~8.0K | COLD only (FAST: on-demand) |
| STANDALONE_SOP.md | 827 | ~7.9K | Neither (external paste only) |
| SESSION_START.md | 519 | ~5.6K | COLD only |
| CLAUDE.md | 249 | ~2.8K | Auto-injected every session |
| **Core total** | **3622** | **~36K** | — |

**Self-reported cost is wrong:** COLD START claims "~28K" but is actually **~41K** if read as instructed (~13K undercount). FAST-PATH (~9K) is accurate.
</details>

<details>
<summary><b>🏆 Top 5 efficiency moves (ranked by savings-to-risk)</b></summary>

| # | Move | Savings | Risk |
|:-:|------|--------:|:----:|
| **1** | **Default to FAST-PATH + fix the cold-start undercount.** Mechanism already exists; just default it + correct the number. | **~18–30K / session** | **none** |
| **2** | **Resolve the Pulse Check count (Bug 1), then single-source it.** | ~2.5K + kills a bug | low |
| **3** | **Move CLAUDE.md's dead APW legacy zone (~127 lines) to `cache/legacy/CLAUDE_APW.md` + pointer.** It auto-injects every session. | ~1.8K / session | low |
| **4** | **Collapse the 3 harness-drift warnings into one canonical copy + pointers.** | ~1.5K | low |
| **5** | **Single-source the shared mini-tables** (Tier Guide, step header, LTM string) — except STANDALONE, which stays self-contained. | ~2K | low-med |

**Combined: ~8–10K disk reduction + ~18–30K/session load reduction.** Move #1 is 5–10× bigger than all the rest combined and needs zero content editing.
</details>

> **The honest takeaway on density:** A reference system is *allowed* to be dense. It is NOT allowed to **contradict itself** — every contradiction forces you to open a third file to settle it, which is the opposite of lean. Fix the 3 bugs first (fidelity), then default FAST-PATH (load-time), then dedup the disk (housekeeping). Don't delete reference depth — just stop *loading* it unless a need triggers it.

---

## 📅 TIMELINE — How We Got Here

<details>
<summary><b>🕰️ Full evolution (APW era → today)</b></summary>

| 📅 Date | 🏷️ Phase | 🔀 What happened |
|---------|----------|------------------|
| 2026-03-13 → 15 | **APW era** | Prime SOP v2.8 built (12 stages, 32 D-rules) for the APW course. Bridge SOP born → origin of MagNet + Door Scan visual rules. |
| 2026-03-31 | **Session 1 — SOP birth** | Universal SOP v1.0→v1.2 across 9 iteration rounds. 16 SubSOPs (SP.1–SP.16) established. Distilled from the 32 D-rules. |
| 2026-04-01 | **Session 2 — Ensurance** | Compliance-decay crisis → built Ensurance System (EN.1–EN.4). v1.2→**v1.3**. First cache files. |
| 2026-04-16 | **Session 3 — Consulting export** | 4 external docs (CONSULTING_BRIEF, PROJECT_HISTORY, etc.). APW course work **paused here**. |
| 2026-05-18 | **Session 4 — Cross-device** | GitHub repo (PRIVATE), gh CLI, README, SESSION_START.md bootstrap. |
| 2026-05-21 | **Session 5 — Audit + validation** | INVENTORY + FUSION_ANALYSIS. 8 fusions executed (F1/F2/F4/F5/F7/F8/F10/F11). 14 sub-agent tests (peak 2/10 friction). STANDALONE_SOP shipped (MIT). FAILURE_LEDGER built. F.13–F.16 fixes. |
| 2026-06-03 | **Session 6 — Boot + brief (now)** | F.17 (comprehensive boot checklist + bootstrap_verify.sh). F.18 (multi-device safe_push + pre-push hook). **This brief + 3-agent instruction audit.** |

**Macro status:** The APW course (the *original* goal) has been paused since Session 3. ~14+ sessions went into SOP infrastructure. That drift is acknowledged (failure O1 / F.13) and the SOP is now ship-ready.
</details>

<details>
<summary><b>🧬 Fusion history (how the agent/cache counts shrank)</b></summary>

| Fusion | What merged | Result |
|--------|-------------|--------|
| F1 | Historical SOPs → `cache/legacy/` | Cleaner root |
| F2 | 9 APW caches → `cache/legacy/` | Active cache 14 → 5 |
| F4 | Oversight + Cache Manager → Controller | Agents 5 → 4 |
| F5 | Jenny → archived | Role absorbed by Validator-Merged |
| F7 | Wrap-Up cluster formalized | FE + Insights + SHR |
| F8 | RPT + HFR → FAILURE_LEDGER | One failure log |
| F10 | TTE + LTM → Token System | Documented cluster |
| F11 | MagNet + Door Scan + Visibility → Visual System | Documented cluster |

Rejected/deferred: F3 (Validator+Karen merge — theater risk), F6 (16→10 SubSOPs — doc only), F9 + F12 (kept separate by design).
</details>

---

## 📦 WHAT WE HAVE — Full Component Inventory

<details>
<summary><b>🤖 4 Agents (click to expand)</b></summary>

| Agent | Role | When | File |
|-------|------|------|------|
| Controller | Orchestration + cache manager | Session start + every deliverable | `agents/controller.md` |
| Validator-Merged | Layer 1 — POVP + completeness + simplicity | Framework deliverables | `agents/validator-merged.md` |
| Karen | Layer 2 — reality check + script enforcement | After Validator, major outputs | `agents/karen-reality-check.md` |
| Paradox Resolver | SCIO/APW tension | On-demand (rare) | `agents/paradox-resolver.md` |

Archived: Jenny, Oversight Executive, Cache Manager (in `agents/archive/`).
</details>

<details>
<summary><b>⚙️ 8 Scripts + 2 Hooks (click to expand)</b></summary>

| Script | Enforces |
|--------|----------|
| `bootstrap_verify.sh` | 70 boot checks (F.17) |
| `compliance_check.sh` | Rule #11 full-name enforcement (F.14) |
| `consistency_check.sh` | Version drift detection |
| `setup_device.sh` | One-command device registration (F.15) |
| `append_only_check.sh` | History-file protection (F.15) |
| `check_device_activity.sh` | Multi-device audit (F.15) |
| `safe_push.sh` | Atomic fetch+rebase+push (F.18) |
| `archive_chat.sh` | Session JSONL snapshot |
| `.githooks/pre-commit` | Blocks bad commits (F.16) |
| `.githooks/pre-push` | Blocks push if origin ahead (F.18) |
</details>

<details>
<summary><b>🗄️ 5 Active Cache Files + memory (click to expand)</b></summary>

| File | Holds |
|------|-------|
| `cache/SESSION_STATE.md` | Current position, decisions log, tokens, GOAL TRACKING |
| `cache/CONTINUATION.md` | Latest session handoff |
| `cache/BACKUP_LOG.md` | All backups indexed |
| `cache/FAILURE_LEDGER.md` | 18 failures (F.1–F.18), root cause + fix |
| `cache/BOOTSTRAP_CHECK.md` | The boot-checklist spec (v2.0) |
| `cache/RPT_LOG.md` | Deprecated redirect → FAILURE_LEDGER |

Plus: `cache/legacy/` (archived APW), `chat_archive/` (transcripts), git/GitHub (cross-device).
</details>

<details>
<summary><b>📚 Reference Docs (loaded on demand, not at boot)</b></summary>

| Doc | Purpose |
|-----|---------|
| `PROTOCOLS_REFERENCE.md` | Deep reference — every protocol's full name + mechanics |
| `STANDALONE_SOP.md` | Self-contained rulebook for pasting into context-free LLMs (MIT) |
| `USER_PROFILE.md` | Communication preferences |
| `MULTI_DEVICE_GIT_PROTOCOL.md` | 7 Golden Rules for multi-device |
| `EFFICIENCY_GUIDE.md` / `TOKEN_OPTIMIZATION_GUIDE.md` | Friction + token analysis |
| `FAILURE_MODES_ANALYSIS.md` | 50+ future failure modes |
| `INVENTORY.md` / `FUSION_ANALYSIS.md` | Full registry + merge proposals |
| Consulting docs | CONSULTING_BRIEF, PROJECT_HISTORY, CHALLENGES_LOG |
</details>

---

## ✅ RECOMMENDED NEXT ACTIONS (Priority Order)

| # | Action | Effort | Payoff |
|:-:|--------|:------:|--------|
| 1 | **Fix the 3 contradiction bugs** (Pulse count, GREEN threshold, MACRO/MICRO in UNIVERSAL) | ~20 min | Removes self-contradiction — highest fidelity gain |
| 2 | **Default FAST-PATH + correct cold-start number** | ~10 min | ~18–30K tokens/session, zero risk |
| 3 | **Resolve SP.7** (fold into SP.9, or define it) | ~15 min | Removes the one phantom protocol |
| 4 | **Add 2-line templates to SP.5/6/8/10/11** | ~15 min | 5 🟡 → ✅ |
| 5 | **Port the 4 legacy orphans** (version discipline, chunked delivery, optimization loop, SOP-is-deliverable) | ~20 min | Closes the legacy gap |
| 6 | **Move CLAUDE.md legacy zone to `cache/legacy/`** | ~10 min | ~1.8K/session, kills Bug 2 |

> **If you do only one thing:** #1 (fix the contradictions). The audit proved the system's biggest weakness isn't missing depth — it's the rulebook disagreeing with itself in 3 places.

---

*This file: SYSTEM_BRIEF.md v1.0 | Built from parallel 3-agent audit (active SOP + legacy SOP + efficiency) | Session 6, 2026-06-03 | xprimordius/universal-sop*
