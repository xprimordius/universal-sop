# 🎯 MANDATORY TIGHT LOOP — The Reduced Ruleset That Actually Survives
# VERSION: 1.7 | 2026-05-23 | Trimmed 11 → 5 mandatory + 5-item Pulse Check (per LEARNINGS_FROM_INDUSTRY + SIMPLIFICATION_PROPOSAL #3) | Universal SOP v1.3
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

## 📋 RULE 2 — THE 5 MANDATORY SUBSOPS (Tight Loop — v1.7, trimmed from 11 per industry data)

**Why trimmed 2026-05-23:** Industry research (LEARNINGS_FROM_INDUSTRY.md) showed 11 × 95%-per-item self-check fidelity = 57% chance of full compliance per output. 5 × 95% = 77% — significantly better odds. Per Alan: "it shouldnt take this many agents to just get the system to work."

**Demoted from mandatory to Reference/Situational** (still documented, invoked when warranted, just not every-output): SP.5 FSP · SP.9 FE · SP.12 HFR · SP.15 EEP · SP.17 SIR · EN.4 Pulse Check (wrapper concept absorbed into EN.1 Output Skeleton).

### TL;DR — The 5 Mandatory (every OUTPUT-STANDARD / OUTPUT-COMPLEX)

| # | Protocol | One-line |
|:-:|---|---|
| 1 | **SP.6 IAC** (Understanding Check) | Restate user's spec at sub-clause granularity before executing |
| 2 | **EN.1 Output Skeleton** | Mandatory structural slots: STEP / UC / body / Sync / RAE — visible, not implicit |
| 3 | **SP.18 SSC** (Sync Status Confirmation) | End-of-output per-channel sync state (git commit / push / distance / backups) |
| 4 | **SP.21 MES** (Model Effort Selector) | `🎯 MODEL:` declaration at TOP + Retrospective at END |
| 5 | **SP.24 RAE** (Recommendations At End) | LAST block — numbered pickable list, max 5 options, effort-tagged |

**Mandatory loops just got 45% shorter.** Per-output overhead reduced. Mechanical enforcement via validator.sh VL.1–VL.11 + compliance_check.sh CHECK 1–8 catches drift at commit time regardless of behavioral compliance.

### Full table (now Reference for the 6 demoted items + spec for the 5 mandatory)

These nine form a self-reinforcing execution loop. Each runs in every OUTPUT-STANDARD or OUTPUT-COMPLEX output. The other 9 SubSOPs are reference-only.

| 🆔 | Protocol | Full Name | What It Forces |
|:--:|----------|-----------|----------------|
| 1 | **SP.5 FSP** | Fidelity Substantiation Protocol | Every claim has evidence. No fabrication. |
| 2 | **SP.6 IAC** ⭐ STRENGTHENED 2026-05-22 (F.27 → F.28 carve-out) | Intent Alignment Check (Understanding Check) — **DOCTORAL PRECISION with TRIVIAL-SPEC CARVE-OUT** | Restate user's ask as a table before executing. **DOCTORAL (default):** UC must restate at **sub-clause granularity** — break user's spec into discrete numbered clauses (C.1, C.2, ...), include verbatim quotes for any non-trivial clause, write explicit interpretation per clause, flag ambiguities + tensions per clause, confirm completeness (every clause mapped — no orphan user-words, no invented constraints). **Compression that loses nuance is a FAIL.** **TRIVIAL-SPEC CARVE-OUT (F.28 prevention):** When user message contains ≤1 normative clause (e.g., "go", "yes", "do it", "continue", "next"), the 1-row UC table is sufficient and IS doctoral — over-expansion would be worse. Carve-out detection: spec word count ≤ 5 OR spec is a continuation/confirmation directive. **The 1-row UC still must include verbatim quote + interpretation + completeness check** — only the row count relaxes, not the precision per row. |
| 3 | **SP.12 HFR** | Honest Failure Report | When something fails (visible to user or self-detected), produce root cause + permanent fix in same output. No "I'll fix it next time." |
| 4 | **SP.15 EEP** | Execution Enforcement Protocol | Execute, don't acknowledge. No future tense. Show proof of action in the message that promises it. |
| 5 | **EN.1** | Output Skeleton (Structural Anti-Decay) | The mandatory sections (STEP / Understanding Check / body / SIR / Pulse Check / Sync Status) are visible in every output. Skeleton is checked, not implicit. |
| 6 | **EN.4** | Pulse Check (Reduced — 8 items v1.3, see Rule 3) | Pre-send mechanical sweep. Visible. Scored. |
| 7 | **SP.17 SIR** | System Improvement Reflection | Every output ends with 1-3 SYSTEM-level improvement insights surfaced DURING the output. Categorized + actionable. |
| 8 | **SP.18 SSC** | Sync Status Confirmation | Every output that modifies files ends with explicit per-channel sync confirmation. Closes F.21. |
| 9 | **SP.9 FE** ⭐ PROMOTED 2026-05-22 (F.23) | Foresight Engine | Predict 2-3 next-step problems / breakpoints / constraints with priority tags 🔴🟡🟢. Was reference-only; now mandatory. Part of Proactive Cluster (SP.9 + SP.17 + SP.19 + SP.20). |
| 10 | **SP.21 MES** ⭐ NEW 2026-05-22 (F.25 → F.26 correction → F.27 doctoral re-spec) | Model Effort Selector — **Doctoral spec, 15 clauses from Alan verbatim** | (C.1) `🎯 MODEL:` line at **literally first content** of every output, before STEP header. (C.2) Mandatory SubSOP in tight loop. (C.3) Recommendation Claude → Alan, of most-appropriate Opus 4.7 variant. (C.4) Optimization target: speed. (C.5) **Three non-negotiable preserved constraints**: fidelity AND efficiency AND quality — all 100%, speed is subordinate. (C.6) **Conservative bias with explicit asymmetric-cost rationale**: too-low is WORSE than too-high; when in doubt → higher. (C.7) **Two stacked recommendation surfaces**: effort tier (max / very high / medium / low) AND fast-mode/model-variant (Opus 4.7 1M / Opus 4.7 default / Opus 4.6 legacy / Sonnet 4.6). (C.8) Explanation mandatory. (C.9) Real-world benefit written in **plain typed text** (sentences, not just tier codes). (C.10–C.11) Sonnet 4.6 permitted ONLY when DUAL gate satisfied: (a) "beyond a shadow of a reasonable doubt" (criminal-court legal standard) AND (b) "absolute certainty" (highest philosophical standard) — both required simultaneously. (C.12–C.13) Mid-output adjustment allowed; stable-start-effort is the IDEAL — calibration goal ≥ 80% opening-was-correct. (C.14) End-of-output retrospective surfaces ONE true best setting (singular). (C.15) **Universal — every output, no tier-gating**, including OUTPUT-QUICK and conversational replies. |
| 11 | **SP.24 RAE** ⭐ NEW 2026-05-22 · v2 AUTONOMOUS-BY-DEFAULT 2026-05-23 (per Alan: "stop requiring my input...this needs to be standard. resolve permanently") | Recommendations At End — **AUTONOMOUS MODE DEFAULT** | **Every OUTPUT-STANDARD / OUTPUT-COMPLEX ends with `🎯 RECOMMENDATIONS (SP.24 RAE — Autonomous Mode)` block as LAST visible content.** **MODE: AUTONOMOUS (default).** The ⭐ Recommended option AUTO-EXECUTES on the next turn unless user redirects. **No pause-and-wait-for-pick** — that was the friction Alan flagged 2026-05-23. **Block format:** `NEXT ACTION (auto-executing): #1 — <description>` + alternatives if redirected. **User signals AWAITING-INPUT mode** with explicit "pause", "ask me", "wait", "stop here" — only then does block change to "Pick a number:" format. **Genuine blocks** (truly ambiguous decision, missing input, irreversible action, risk threshold) still trigger explicit ask via AskUserQuestion — autonomous mode does NOT mean reckless. **Pulse Check P5 enforces** RAE block present. Validator VL.11 greps for `🎯 RECOMMENDATIONS` marker. |

**Reference-only (no longer mandatory every output):** SP.1 MagNet, SP.2 Door Scan, SP.3 TTE, SP.4 SCP, SP.7 Insights, SP.8 Protocol Visibility, SP.9 FE Foresight (content-foresight, NOT system-improvement — that's SP.17), SP.10 SCC, SP.11 QAC, SP.13 SHR, SP.14 RPT, SP.16 PCG, EN.2 Priority 10, EN.3 Checkpoint Cycle.

These remain documented in `PROTOCOLS_REFERENCE.md` and stay available — invoke them when the situation warrants (e.g., SP.9 FE for predicting downstream issues on a high-stakes change). They are not asked-of-every-output anymore.

---

## 📋 RULE 3 — THE 5-ITEM PULSE CHECK (v1.7 — trimmed from 10 per industry data)

**Why trimmed:** Same compounding-error logic as Rule 2. 5 self-check items × 95% fidelity = 77% vs 10 × 95% = 60%. Per-output cognitive load reduced; mechanical Validator (VL.1–VL.11) + compliance_check (CHECK 1–8) still cover the demoted items at commit time.

**Demoted Pulse Check items** (P5 EEP, P6 SIR, P8 FE, P2 Tables, P3 Headline-first, P4 Inference-marked): now style preferences enforced by USER_PROFILE not Pulse Check; per-output cost dropped without compliance cost (commit-time mechanical enforcement is the new floor).

### Current 5-item Pulse Check (v1.7)

| # | Item | What it catches |
|:-:|------|-----------------|
| P1 | **Honest numbers; N/M for unmeasurable** | Fabricated wall-clock time, made-up token counts, fake percentages. The #1 silent failure mode. |
| P2 | **IAC present (SP.6)** | Understanding Check table at top before execution |
| P3 | **SSC present (SP.18)** | Per-channel sync state at end |
| P4 | **MES present + retrospective (SP.21)** | `🎯 MODEL:` at top + Retrospective near end |
| P5 | **RAE present (SP.24)** | LAST block — numbered pickable recommendations |

**Score:** 5/5 = ship. 4/5 with brief acknowledgment OK. ≤ 3/5 → fix before sending.

**compliance_check.sh** accepts: 5/5 (current v1.7), 6/6 (v1.1 migration), 7/7 (v1.2), 8/8 (v1.3), 9/9 (v1.5.1), 10/10 (v1.6).

### Historical 10-item Pulse Check (v1.6) — kept for reference

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
| P10 | **RAE present (SP.24 — NEW v1.6)** ⭐ | `🎯 RECOMMENDATIONS (SP.24 RAE)` block is the LAST visible content of the output (after Sync Status). Numbered list, max 5 options, each ≤12 words with effort tag. No inline recommendations elsewhere. If none apply: explicit `(none — task complete)` line. |

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
| SIR_LOG rows | ✅ N | <count> |

# Sprint 2 Item O — mechanical BACKUP-STATUS block (paste the literal output of the command below)
$ bash scripts/backup_status.sh --block
📦 BACKUP STATUS · <device> @ <ts> · <commit>
  [OK]    L1 Local backups/      <N> files · latest <Xm> ago
  [OK]    L2 BACKUP_LOG          <N> rows · latest row <#>
  [OK]    L3 Local git           <N> commits · HEAD <SHA> · clean|<N> uncommitted
  [OK]    L4 GitHub origin       in sync (0/0) · xprimordius/universal-sop.git
  [OK]    L5 Cross-device        <N> commits from {<other-devices>} + <N> from <self> in last 14d
  Redundancy: <N> OK · <N> WARN · <N> FAIL
```

**Why two blocks (SP.18 SSC v1.7.1 — Sprint 2 Item O 2026-05-25):**
- The **Sync Status table** answers *"did the per-channel operations this output performed succeed?"* (commit/push/Obsidian/SIR). It's about THIS output.
- The **BACKUP-STATUS block** answers *"if this device disappeared right now, where is the work recoverable from?"* (5 redundancy layers). It's about the device, independent of any single output.
- The block REPLACES manual `Backups in backups/`, `BACKUP_LOG rows`, and `Mac sync` rows — those were prone to fabrication (counts were sometimes guessed). The script reads real state.
- Per LEARNINGS Section 8: *convention → code*. Manual rows became mechanical block.

**When to skip BACKUP-STATUS block:**
- OUTPUT-QUICK tier (single fact / lookup) — Sync Status table is enough.
- Outputs that don't modify files — backup redundancy didn't change.
- If `scripts/backup_status.sh` is missing (pre-Sprint-1 commits) — note that and fall back to manual rows.

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

## 📋 RULE 5 — PROVE-IT 9-POINT BLOCK (Sprint 4 Item M, NEW 2026-05-25 — for OPS / MAJOR SHIPS only)

**Per Aurelius PROVE-IT-Protocol** (LEARNINGS Section 4D). Adopted on aurelion 2026-05-25 as the closing-report spine for *operation-level* commits and *major-ship* commits — NOT every output. (The 5 Mandatory SubSOPs above remain unchanged for per-output discipline.)

### When mandatory

A commit is OP-level / MAJOR-SHIP if ANY of these hold:
- Closes ≥1 F-class entry
- Ships a new script or new doctrine section (SubSOP, Ensurance, BOOTSTRAP step)
- Crosses a Sprint boundary (Sprint N → N+1 complete)
- Per Alan: any commit explicitly tagged `[OP-LEVEL]`

For routine in-Sprint commits (typo fix, refactor, docs cleanup), the PROVE-IT block is OPTIONAL.

### The 9 items (template — paste into commit body or output trailer)

```
✅ PROVE-IT 9-POINT (Sprint 4 Item M v1.0 — for ops + major ships)
1. QA              — <independent audit who/how — agent chain layer? human?>
2. Test            — <exact N/N tests passing — e.g., E2E 9/9, run_script_tests 30/30, NOT "all green">
3. Quality         — <what concretely improved — file:line or metric delta, NOT vibe>
4. Bottlenecks     — <perf/structural issues identified during this op>
5. Constraints     — <dependencies / limits exposed — what we found we cannot do here>
6. Errors          — <what failed during this op (full HFR if any) + new F-NNN row if structural>
7. Break points    — <where it could break next — specific files/conditions, not generic>
8. Improve/Resolve — <fixes shipped this op — file:line refs>
9. Foresight       — <proactive forecast — top 2-3 risks for the next op>
```

### Each line ≤ one sentence, written in past tense (after-the-op)

PROVE-IT is RETROSPECTIVE — it documents what happened, not promises for next time. Promises belong in `🎯 RECOMMENDATIONS` (SP.24 RAE) and `🔮 Foresight` (SP.9 FE — content-level foresight). PROVE-IT's #9 Foresight is *system-level* (what the OP's existence implies for the NEXT op), distinct from SP.9 FE's content foresight.

### Why a separate rule, not woven into existing SubSOPs

- SP.6 IAC = restate user's spec → before output
- EN.1 Output Skeleton = STEP / UC / body / Sync / RAE → during output
- **PROVE-IT 9-point = retrospective audit → after the op lands**

It's the *third leg* of the stool. Aurelius confirms: their PROVE-IT block IS the operation's permanent record (alongside the Operation-Log row). For universal-sop, the BACKUP-STATUS block (SP.18 SSC v1.7.1) is the per-OUTPUT mechanical version; PROVE-IT 9-point is the per-OP behavioral version.

### Anti-patterns

- ❌ "All green" without N/N — fails Item 2 (Test)
- ❌ "Looks good" / "Better now" without file:line — fails Item 3 (Quality)
- ❌ Skipping Item 6 (Errors) when there genuinely were none — write "Errors — none this op; full E2E 9/9 sustained" so the line proves you considered it
- ❌ Foresight that just lists "everything could break" — must be specific 2-3 items with priority hint
- ❌ **Pasting the full 9-point block directly into the `git commit -m` body** — see "Where the block lives" below (F.59 lesson)

### Where the block lives (v1.0.1 — F.59 amendment 2026-05-26)

**Empirical finding from F.59 (2026-05-25):** GitHub's git-receive pipeline can return `500 Internal Server Error` on commit messages > ~5KB that combine HEREDOC content + literal backticks + Unicode emoji + nested markdown tables. Three consecutive pushes failed; amending to a 1-line subject succeeded. The PROVE-IT 9-point block, written inline in a commit body, is exactly the shape that triggers this.

**Therefore, by convention from 2026-05-26 onward:**

| Where the block goes | When | Why |
|---|---|---|
| Commit **subject** | Always | `[<device> \| <ts>] OP: <short summary> · <one delta metric>` — under 100 chars |
| Companion file: `cache/op-notes/OP_<ts>_<slug>.md` | OP-level commits (closes F-class, ships new script/doctrine, crosses Sprint boundary, explicitly `[OP-LEVEL]`) | Full 9-point block + extended PROVE-IT detail. Referenced by path in the commit body. |
| `cache/chiron/PRISTINE_REPORT_<ts>.md` | Auto-generated by `pristine_audit.sh` | Already exists as the audit artifact — link from commit body when relevant. |
| FAILURE_LEDGER F-class entry | When the OP closes an F-class | The F-class entry IS the 9-point in a stable schema (Type/Root Cause/Permanent Fix/Verified/Lesson). |

**Minimal commit-body template (safe to paste into `git commit -m`):**

```
[<device> | <ts>] OP: <subject> · <delta>

See cache/op-notes/OP_<ts>_<slug>.md for full PROVE-IT 9-point.
(Optional: F.X closed, see cache/FAILURE_LEDGER.md)
```

**Why this is better, not worse:**
- `git log --oneline` stays legible (one short subject per commit)
- PROVE-IT detail is searchable in the repo (`grep -r` works) rather than buried in `git log --format=%B`
- The op-note file is a first-class artifact: linkable, diff-able, can be amended without rewriting history
- Aurelius doctrine alignment: their `Operations-Log.md` is the canonical detail surface; commits are pointers

### Validator detection (future)

A future `validator.sh VL.12 PROVE-IT-presence` check will grep commit subjects matching `OP-LEVEL|F\.[0-9]+|Sprint [0-9]+ COMPLETE` and verify the corresponding `cache/op-notes/OP_*.md` companion file exists with items 1-9 present (after F.59 amendment — was previously body-grep). VL.13 candidate: pre-commit warn if commit message body exceeds 4KB OR contains > 3 backtick fences (the F.59 trigger surface).

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

*Universal Output SOP v1.3 | MANDATORY_TIGHT_LOOP.md v1.7 | TRIMMED to 5 mandatory + 5-item Pulse Check (per industry findings) | aurelia + future-replicate-everywhere | 2026-05-23*
