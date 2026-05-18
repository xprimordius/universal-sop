# RPT (Repeated Prompt Tracker) LOG
# VERSION: 1.0 | Updated: 2026-04-01 | SOP: v1.3

## 📝 What This File Is
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
