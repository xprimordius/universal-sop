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
| Total entries | F.1 - F.11 | 11 |
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
