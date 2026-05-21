# RPT (Repeated Prompt Tracker) LOG
# VERSION: 2.0 | Updated: 2026-05-21 | SOP: v1.3
# ⚠️ SUPERSEDED BY: cache/FAILURE_LEDGER.md (F8 fusion 2026-05-21)

## 🚨 THIS FILE IS DEPRECATED

**All entries migrated to `cache/FAILURE_LEDGER.md` (F8 fusion executed 2026-05-21).**

NEW failures should be logged to `FAILURE_LEDGER.md`, not here. This file is preserved for historical reference + as a redirect pointer.

**Why fused:** F8 from FUSION_ANALYSIS.md — RPT (Repeated Prompt Tracker) and HFR (Honest Failure Report) both track failures. The only difference is trigger condition (REPEAT vs single FAILURE). Same response logic. One ledger = less drift.

**Entry mapping (old → new):**
- RPT.1 → F.1 (Emojis far left)
- RPT.2 → F.2 (Live token tracking)
- RPT.3 → F.3 (MagNet visual)
- RPT.4 → F.4 (Proactive foresight)
- RPT.5 → F.5 (SubSOP visible)
- RPT.6 → F.6 (Token + time per step)
- RPT.7 → F.7 (Execute don't acknowledge)
- RPT.8 → F.8 (LTM every section)
- RPT.9 → F.9 (Compliance decay)
- RPT.10 → F.10 (Protocol name truncation)
- RPT.11 → F.11 (No `<details>` expandable)

**Active ledger:** see `cache/FAILURE_LEDGER.md`

---

## 📝 What This File Was (Historical)
Tracks every time the user had to ask for the same thing 2+ times. Each entry = a system failure that was root-caused and fixed. Persists across sessions so the same failure never repeats.

## 🔁 REPEATED PROMPT LOG

| # | 🏷️ Item | 📣 First Asked | 📣 Re-Asked | 🔢 Times | 🔮 Root Cause | ✅ Permanent Fix | 📅 Fixed |
|:-:|---------|:-------------:|:-----------:|:--------:|--------------|-----------------|:--------:|
| RPT.1 | Emojis far left, dedicated column | R1 (2026-03-31) | R2, R4 | 3 | Visual rules treated as suggestions, not hard requirements | MagNet MN.2 + Door Scan SP.2 made mandatory subSOPs | 2026-03-31 |
| RPT.2 | Live token tracking in outputs | R1 | R5, R6, R7 | 4 | Token tracking defined but never activated — existence ≠ execution | LTM format defined + mandatory after every `---` rule | 2026-03-31 |
| RPT.3 | MagNet / visual optimization | R3 | R5, R6 | 3 | Design filter acknowledged but not applied to own output | Made Always-On subSOP (SP.1) — runs on every section | 2026-03-31 |
| RPT.4 | Proactive suggestions / foresight | R1 | R4, R5 | 3 | Foresight deferred to "next output" repeatedly | Foresight Engine (FE) SP.9 = Per-Output mandatory | 2026-03-31 |
| RPT.5 | SubSOP execution visible | R4 | R6, R7 | 3 | Report template existed but never populated | SubSOP Execution Report = mandatory wrap-up component | 2026-03-31 |
| RPT.6 | Token + time PER STEP with descriptions | R5 | R6, R7, R9, Session 2 x2 | 5+ | Step tracking table treated as reference, not execution format. AI substitutes own table structures. | Hard rule: use EXACT SOP L161-163 format. No custom execution tables. Column-level self-check. | 2026-04-01 |
| RPT.7 | Execute, don't just acknowledge | R8 | R9, Session 2 | 3+ | Writing "I will do X" = false completion signal. Checklist grows but execution window stays fixed. | EEP (SP.15) + PCG (SP.16) with execution debt counter | 2026-03-31 |
| RPT.8 | LTM after EVERY section including wrap-up | R5 | R6, R7, Session 2 x2 | 6+ | AI categorizes wrap-up components as "overhead" and drops LTM from them despite rule. Self-judgment overrode mechanical rule. | Ensurance System EN.1 skeleton pre-places LTM after every section + EN.4 Pulse Check verifies pre-send | 2026-04-01 |
| RPT.9 | Compliance decay — things work then break | Session 2 (R4) | — | 1 | Attention depletion, success relaxation, checklist fatigue across outputs. Behavioral fixes don't survive. | Ensurance System EN.1-EN.4 (structural, not behavioral). Priority 10 reduces cognitive load. | 2026-04-01 |
| RPT.10 | **Protocol names truncated in SubSOP reports** — using "SP.1 MagNet" instead of "SP.1 MagNet (Magnetic Visual Engagement Protocol)" | Session 5 (May 21 — repeated 4+ outputs after Rule #11 was added) | Alan called out 2026-05-21 | 4+ | Compact-table bias — when clustering protocols in single row I default to acronyms only. Rule #11 (full name + acronym on first use) gets dropped under horizontal space pressure. Behavioral fix didn't survive. | STRUCTURAL: (a) SubSOP reports use ONE row per protocol (no clustering), (b) `<details>` expandable per protocol with full name in summary line, (c) PROTOCOLS_REFERENCE.md is mandatory read so AI always has full names cached | 2026-05-21 |
| RPT.11 | **No `<details>` expandable in SubSOP reports** — Alan asked for expandable transparency, I built it in PROTOCOLS_REFERENCE.md and INVENTORY.md but did not propagate to my own SubSOP Execution Report tables | Session 5 (May 21) | Alan called out 2026-05-21 | 1 (caught early) | Pattern-matching failed — I treated PROTOCOLS_REFERENCE/INVENTORY as the "expandable docs" and my running reports as compact summaries. Wrong split — Alan wants ALL agent/protocol references expandable, including in dynamic outputs. | STRUCTURAL: Update Output Skeleton (EN.1) to wrap each SubSOP report row in `<details>` block. Demonstrated in same output where called out (2026-05-21). | 2026-05-21 |
