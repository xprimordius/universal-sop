# 🎯 MANDATORY TIGHT LOOP — The Reduced Ruleset That Actually Survives
# VERSION: 1.0 | 2026-05-21 | Tier 1 of F.19 fix | Universal SOP v1.3
# This file SUPERSEDES, for operational use, the full mandatory set in UNIVERSAL_SOP_PROMPT.md.
# UNIVERSAL_SOP_PROMPT.md remains the reference rulebook — unchanged, complete, available.

---

## 🎯 PURPOSE

The full SOP defines 16 SubSOPs + 4 Ensurance components + a 17-item Pulse Check, all "mandatory every output". Sub-agent testing has repeatedly shown that asking-for-everything-every-time causes compliance decay (F.9, F.19 — see `SELF_COMPLIANCE_FIX.md` for the diagnosis).

This file defines what is **actually mandatory** for operational sessions. It is a strictly smaller set than the full SOP. The other rules remain documented in `UNIVERSAL_SOP_PROMPT.md` and `PROTOCOLS_REFERENCE.md` for transparency and for high-stakes COMPLEX outputs that warrant the extra rigor.

**Use this when:** any operational session, any device, any tier from OUTPUT-QUICK through OUTPUT-COMPLEX.

**Use the full SOP when:** producing the SOP itself, producing a publishable deliverable (e.g., shippable STANDALONE_SOP), or when a sub-agent test is being run.

---

## 📋 RULE 1 — THE 3-LINE STEP HEADER

Every output begins with exactly three lines:

```
STEP: <one-line description of what this output is>
🎯 MACRO: <project-level macro goal — e.g., "Build APW course (PAUSED)">
📌 MICRO: <this-output-level micro goal — e.g., "Diagnose multi-device merge collision">
```

**That's it.** No SOP version, no TIER field, no SCOPE field, no EST field. The omitted fields were either fabricated or forgotten in practice; removing them costs nothing.

If the output is QUICK-tier (single fact / lookup), the STEP line + answer + LTM is sufficient. Skip everything below.

---

## 📋 RULE 2 — THE 10 MANDATORY SUBSOPS (Tight Loop — v1.4)

These nine form a self-reinforcing execution loop. Each runs in every OUTPUT-STANDARD or OUTPUT-COMPLEX output. The other 9 SubSOPs are reference-only.

| 🆔 | Protocol | Full Name | What It Forces |
|:--:|----------|-----------|----------------|
| 1 | **SP.5 FSP** | Fidelity Substantiation Protocol | Every claim has evidence. No fabrication. |
| 2 | **SP.6 IAC** ⭐ STRENGTHENED 2026-05-22 (F.27) | Intent Alignment Check (Understanding Check) — **DOCTORAL PRECISION** | Restate user's ask as a table before executing. **NEW (F.27):** UC must restate at **sub-clause granularity** — break user's spec into discrete numbered clauses (C.1, C.2, ...), include verbatim quotes for any non-trivial clause, write explicit interpretation per clause, flag ambiguities + tensions per clause, confirm completeness (every clause mapped — no orphan user-words, no invented constraints). **Compression that loses nuance is a FAIL.** Catches the failure mode of "UC summarizes instead of preserving" (F.27 pattern). |
| 3 | **SP.12 HFR** | Honest Failure Report | When something fails (visible to user or self-detected), produce root cause + permanent fix in same output. No "I'll fix it next time." |
| 4 | **SP.15 EEP** | Execution Enforcement Protocol | Execute, don't acknowledge. No future tense. Show proof of action in the message that promises it. |
| 5 | **EN.1** | Output Skeleton (Structural Anti-Decay) | The mandatory sections (STEP / Understanding Check / body / SIR / Pulse Check / Sync Status) are visible in every output. Skeleton is checked, not implicit. |
| 6 | **EN.4** | Pulse Check (Reduced — 8 items v1.3, see Rule 3) | Pre-send mechanical sweep. Visible. Scored. |
| 7 | **SP.17 SIR** | System Improvement Reflection | Every output ends with 1-3 SYSTEM-level improvement insights surfaced DURING the output. Categorized + actionable. |
| 8 | **SP.18 SSC** | Sync Status Confirmation | Every output that modifies files ends with explicit per-channel sync confirmation. Closes F.21. |
| 9 | **SP.9 FE** ⭐ PROMOTED 2026-05-22 (F.23) | Foresight Engine | Predict 2-3 next-step problems / breakpoints / constraints with priority tags 🔴🟡🟢. Was reference-only; now mandatory. Part of Proactive Cluster (SP.9 + SP.17 + SP.19 + SP.20). |
| 10 | **SP.21 MES** ⭐ NEW 2026-05-22 (F.25 → F.26 correction → F.27 doctoral re-spec) | Model Effort Selector — **Doctoral spec, 15 clauses from Alan verbatim** | (C.1) `🎯 MODEL:` line at **literally first content** of every output, before STEP header. (C.2) Mandatory SubSOP in tight loop. (C.3) Recommendation Claude → Alan, of most-appropriate Opus 4.7 variant. (C.4) Optimization target: speed. (C.5) **Three non-negotiable preserved constraints**: fidelity AND efficiency AND quality — all 100%, speed is subordinate. (C.6) **Conservative bias with explicit asymmetric-cost rationale**: too-low is WORSE than too-high; when in doubt → higher. (C.7) **Two stacked recommendation surfaces**: effort tier (max / very high / medium / low) AND fast-mode/model-variant (Opus 4.7 1M / Opus 4.7 default / Opus 4.6 legacy / Sonnet 4.6). (C.8) Explanation mandatory. (C.9) Real-world benefit written in **plain typed text** (sentences, not just tier codes). (C.10–C.11) Sonnet 4.6 permitted ONLY when DUAL gate satisfied: (a) "beyond a shadow of a reasonable doubt" (criminal-court legal standard) AND (b) "absolute certainty" (highest philosophical standard) — both required simultaneously. (C.12–C.13) Mid-output adjustment allowed; stable-start-effort is the IDEAL — calibration goal ≥ 80% opening-was-correct. (C.14) End-of-output retrospective surfaces ONE true best setting (singular). (C.15) **Universal — every output, no tier-gating**, including OUTPUT-QUICK and conversational replies. |

**Reference-only (no longer mandatory every output):** SP.1 MagNet, SP.2 Door Scan, SP.3 TTE, SP.4 SCP, SP.7 Insights, SP.8 Protocol Visibility, SP.9 FE Foresight (content-foresight, NOT system-improvement — that's SP.17), SP.10 SCC, SP.11 QAC, SP.13 SHR, SP.14 RPT, SP.16 PCG, EN.2 Priority 10, EN.3 Checkpoint Cycle.

These remain documented in `PROTOCOLS_REFERENCE.md` and stay available — invoke them when the situation warrants (e.g., SP.9 FE for predicting downstream issues on a high-stakes change). They are not asked-of-every-output anymore.

---

## 📋 RULE 3 — THE 9-ITEM PULSE CHECK (v1.4 — Adds P9 SP.21 MES Retrospective)

Visible near the bottom of every OUTPUT-STANDARD / OUTPUT-COMPLEX output (before Sync Status). Score X/9.

| # | Item | What it catches |
|:-:|------|-----------------|
| P1 | **Honest numbers; N/M for unmeasurable** | Fabricated wall-clock time, made-up token counts, fake percentages. The #1 silent failure mode. |
| P2 | **Tables for comparisons** | Paragraph-prose comparisons that should have been a table. Alan's preference, surfaces clarity. |
| P3 | **Headline-first / lead with answer** | Burying the answer in preamble. Alan's #1 stated preference. |
| P4 | **Inference vs fact marked** | Stating estimates / opinions as fact without "~", "approx", "inferred", "verified by X". |
| P5 | **Promise = deliver in same message** | "I'll do X" without showing X done. The acknowledge-not-execute pattern (SP.15 EEP). |
| P6 | **SIR surfaced (SP.17)** | At least 1 system-improvement insight surfaced this output, categorized + actionable. |
| P7 | **SSC surfaced (SP.18)** | Sync Status block present at end of output with explicit per-channel status. |
| P8 | **Foresight surfaced (SP.9 — v1.3)** | 2-3 next-step predictions with priority tags 🔴🟡🟢 — bottlenecks / constraints / breakpoints / proactive solutions. Part of Proactive Cluster. |
| P9 | **MES present (SP.21 — NEW v1.4)** ⭐ | (a) Model + effort declared at TOP of output BEFORE STEP header, (b) MES Retrospective section near end declaring true best setting + calibration delta vs opening selection. |

**Format:**

```
✅ Pulse Check (Reduced — 7 items v1.2)
P1 Honest numbers     ✅/❌
P2 Tables             ✅/❌
P3 Headline first     ✅/❌
P4 Inference marked   ✅/❌
P5 Promise = deliver  ✅/❌
P6 SIR surfaced (SP.17) ✅/❌
P7 SSC surfaced (SP.18) ✅/❌
Score: X/7
```

**Pass criterion:** 7/7 for ship. 6/7 with brief acknowledgment is acceptable. ≤ 5/7 → fix before sending.

**Migration note:** Outputs created before 2026-05-21 evening Pulse Check v1.2 may show 5/5 (v1.0) or 6/6 (v1.1) scoring. All three are valid full-score patterns; compliance_check.sh accepts each during migration.

---

## 📋 RULE 4 — LTM (LIVE TOKEN MONITOR) STAYS

The reduced loop drops a lot. **LTM stays.** Cheap, high-value, anchors attention to budget.

Visible after every major section (each `---` separator):

```
LTM: ~XK / [WINDOW] | Status: 🌱 GREEN | 🟡 YELLOW | 🔴 RED
```

`[WINDOW]` is model-aware (e.g., `200K`, `1M`). Estimates approximate (~20% variance acceptable).

---

## 🎯 WHAT A FULL OUTPUT-STANDARD OUTPUT LOOKS LIKE (Template v1.1)

```
STEP: <description>
🎯 MACRO: <macro goal>
📌 MICRO: <micro goal>

🎯 Understanding Check (SP.6 IAC)
| Your words | My interpretation |
|---|---|
| ...        | ...               |

[body of the output — markdown, tables, evidence]

LTM: ~XK / [WINDOW] | Status: 🌱 GREEN

[more body if multi-section, with LTM between sections]

💡 SIR — System Improvement Reflection (SP.17)
| # | 🏷️ Category | 💡 Insight | 🎯 Effort |
|:-:|------------|-----------|----------|
| 1 | 🛠️ structural / 📋 convention / 🪙 token / 🔧 tooling / 🔄 process / 📊 measurement | <one-line insight surfaced during this output> | <S/M/L estimate> |

✅ Pulse Check (Reduced — 7 items v1.2)
P1 Honest numbers     ✅
P2 Tables             ✅
P3 Headline first     ✅
P4 Inference marked   ✅
P5 Promise = deliver  ✅
P6 SIR surfaced       ✅
P7 SSC surfaced       ✅
Score: 7/7

📡 Sync Status (SP.18 SSC)
| 🎯 Channel | Status | 📝 Detail |
|------------|:------:|-----------|
| Git commit | ✅ | <SHA> |
| Git push to origin/main | ✅ | <timestamp> |
| Distance local ↔ origin | ✅ 0/0 | in sync |
| Obsidian vault | ✅ | no conflict files |
| Mac (mac-main) sync | ⏳ pending pull | will receive on next git pull |
| Backups in `backups/` | ✅ N files | <count> |
| BACKUP_LOG rows | ✅ #X-#Y | <range appended> |
| SIR_LOG rows | ✅ N | <count> |
```

**That's the entire mandatory loop.** Six lines of header + Understanding Check + body + LTM + 5-item Pulse Check. Survivable in a real session.

---

## 🧩 RELATIONSHIP TO THE FULL SOP

| File | Status | Use When |
|------|--------|----------|
| `UNIVERSAL_SOP_PROMPT.md` | Unchanged, complete, reference | Producing the SOP itself; high-stakes shippable deliverables; sub-agent compliance testing |
| `PROTOCOLS_REFERENCE.md` | Unchanged, complete | Looking up any of the 20 protocols by full name + acronym + scope |
| `STANDALONE_SOP.md` | Unchanged, MIT-licensed shippable | External consumption (other Claude.ai sessions, other models, third parties) — keeps the full ruleset since external users may not have this file |
| `MANDATORY_TIGHT_LOOP.md` | This file | **Default operational use** on any device, any session |
| `SELF_COMPLIANCE_FIX.md` | The diagnosis | Read if you want to understand why this file exists |

**Reversibility:** if Tier 1 turns out to have cut too aggressively (e.g., dropping SP.9 FE causes downstream issues to be missed), promote rules back. The full SOP is untouched; nothing was lost.

---

## 🔮 WHAT TIER 2 + TIER 3 WILL ADD

This file is Tier 1 of the F.19 fix. The other tiers are staged:

| Tier | Adds | Status |
|:---:|------|--------|
| 2 | **Mode declaration** as first line of every Claude response: `MODE: CONVERSATION` / `MODE: OUTPUT-QUICK` / `MODE: OUTPUT-STANDARD` / `MODE: OUTPUT-COMPLEX`. SOP overhead applies only to OUTPUT modes. Most session turns become CONVERSATION (no overhead). | Staged, ~2 hours when scheduled |
| 3 | **Outputs are files, not chat replies.** Deliverables save to `outputs/<date>_<topic>_<device>.md`, go through `pre-commit` hook, can't reach user until compliance script passes. Convention becomes architecture. | Staged, ~1 day when scheduled |

See `SELF_COMPLIANCE_FIX.md` for the full rationale + acceptance tests.

---

## ⚙️ KNOWN FOLLOW-UP

`scripts/compliance_check.sh` currently accepts Pulse Check scores 10/10, 11/11, 12/12, 15/15, 16/16, 17/17 as valid. After this file ships, add **5/5** as a valid score. Small script update; will be filed as a separate follow-up commit.

---

*Universal Output SOP v1.3 | MANDATORY_TIGHT_LOOP.md v1.0 | Tier 1 of F.19 fix (discipline → architecture) | aurelia + future-replicate-everywhere | 2026-05-21*
