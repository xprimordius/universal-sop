# OUTPUT_SKELETON v1.0 — Mandatory Template for OUTPUT-STANDARD / OUTPUT-COMPLEX
# Created: 2026-05-26 aurelion · Per user 2026-05-26 02:00 CDT: "fix this to perfect it"
# Scope: every Claude response that performs work (ships code, edits files, makes decisions)
# Skip: OUTPUT-QUICK (single fact / lookup / "yes" confirmation) — those use ONLY the 🎯 MODEL + answer

# ─────────────────────────────────────────────────────────
# SLOT 1 — 🎯 MODEL (SP.21 MES — LITERAL FIRST CONTENT)
# ─────────────────────────────────────────────────────────
🎯 MODEL: <effort tier> · <model variant>
  # effort tier: max | very high | medium | low
  # model variant: Opus 4.7 1M | Opus 4.7 default | Opus 4.6 legacy | Sonnet 4.6
  # Sonnet 4.6 only when DUAL gate satisfied (beyond reasonable doubt AND absolute certainty per C.10/C.11)
  # MUST appear before STEP header
  # Real-world benefit in plain prose (NOT just tier codes)


# ─────────────────────────────────────────────────────────
# SLOT 2 — STEP HEADER (MTL RULE 1, 3 lines)
# ─────────────────────────────────────────────────────────
STEP: <one-line description of what this output is>
🎯 MACRO: <project-level macro goal — e.g., "Build APW course (PAUSED)">
📌 MICRO: <this-output-level micro goal>


# ─────────────────────────────────────────────────────────
# SLOT 3 — SP.6 IAC UNDERSTANDING CHECK (Doctoral Precision)
# ─────────────────────────────────────────────────────────
## 🎓 SP.6 IAC — Understanding Check (Doctoral Precision)

| Clause | Verbatim quote | Interpretation | Ambiguity / Tension |
|---|---|---|---|
| C.1 | "<exact quote from user>" | <how Claude reads it> | <flag any ambiguity, OR "none"> |
| C.2 | ... | ... | ... |

# Completeness check: every word of user's spec mapped to a clause. No orphans. No invented constraints.
# TRIVIAL-SPEC CARVE-OUT: if user message is ≤1 normative clause ("go", "yes", "next"), 1-row UC suffices.
# But 1 row still needs verbatim quote + interpretation + completeness statement.


# ─────────────────────────────────────────────────────────
# SLOT 4 — BODY (the actual work)
# ─────────────────────────────────────────────────────────
# Tool calls, code edits, prose explanation, sub-agent invocations, etc.
# Use ★ Insight blocks where educational value exists (per current output style).
# No fabrication (SP.5 FSP). All claims grounded in tool output or read files.
# Honest unmeasurables marked N/M.


# ─────────────────────────────────────────────────────────
# SLOT 5 — 📡 SYNC STATUS (SP.18 SSC v1.7.1 — two blocks)
# ─────────────────────────────────────────────────────────
📡 Sync Status (SP.18 SSC)

| 🎯 Channel | Status | 📝 Detail |
|------------|:------:|-----------|
| Git commit | ✅/❌ | <SHA or "no commit this output"> |
| Git push to origin/main | ✅/❌/⏳ | <timestamp or pending state> |
| Distance local ↔ origin | ✅ 0/0 | <or distance> |
| Obsidian vault | ✅/⚠️ | <no conflict files or conflict count> |
| SIR_LOG rows | ✅ N | <count or "no new rows"> |

# Mechanical BACKUP-STATUS block (paste literal output of bash scripts/backup_status.sh --block)
# 📦 BACKUP STATUS · <device> @ <ts> · <commit>
#   [OK]    L1 Local backups/      ...
#   [OK]    L2 BACKUP_LOG          ...
#   [OK]    L3 Local git           ...
#   [OK]    L4 GitHub origin       ...
#   [OK]    L5 Cross-device        ...
#   Redundancy: N OK · N WARN · N FAIL


# ─────────────────────────────────────────────────────────
# SLOT 6 — ✅ PULSE CHECK (EN.4 / MTL RULE 3 — 5 items)
# ─────────────────────────────────────────────────────────
✅ Pulse Check (5/5 — MTL v1.7)
P1 Honest numbers     ✅/❌ <one-line evidence>
P2 IAC present        ✅/❌ <one-line evidence>
P3 SSC present        ✅/❌ <one-line evidence>
P4 MES present        ✅/❌ <one-line evidence>
P5 RAE present        ✅/❌ <one-line evidence>
Score: N/5
# 5/5 = ship. 4/5 with brief ack OK. ≤3/5 → fix before sending.


# ─────────────────────────────────────────────────────────
# SLOT 7 — 🎯 RECOMMENDATIONS (SP.24 RAE — AUTONOMOUS-BY-DEFAULT — LAST visible content)
# ─────────────────────────────────────────────────────────
🎯 RECOMMENDATIONS (SP.24 RAE — Autonomous Mode)

NEXT ACTION (auto-executing on next turn unless user redirects): <#1 recommended action>

Alternatives if redirected:
2. <option B>
3. <option C>

# Format: NEXT ACTION LINE is the autonomous default. Top item AUTO-EXECUTES.
# Only switch to "Pick a number:" if user signals AWAITING-INPUT ("pause", "ask me", "wait", "stop here").
# Genuine blocks (truly ambiguous / missing input / irreversible / risk threshold) still warrant explicit ask via AskUserQuestion.


# ─────────────────────────────────────────────────────────
# SELF-AUDIT (run BEFORE sending — write the result here)
# ─────────────────────────────────────────────────────────
# Pipeline:
#   1. Write draft to /tmp/output_draft.md
#   2. bash scripts/validator_output.sh /tmp/output_draft.md
#   3. Score: N/N. If <5/5 on mandatory items → fix before sending.
#   4. bash scripts/log_output.sh "<user prompt>" /tmp/output_draft.md <score>
#   5. Send.
