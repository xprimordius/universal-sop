# 🎯 SIMPLIFICATION PROPOSAL — Architectural Debt Paydown
# VERSION: 1.0 | 2026-05-23 | aurelia
# Trigger: Alan 2026-05-23 — "it shouldnt take this many agents to just get the system to work. and even with how dense it is, we still don't have coherence and actual flawless operation"
# Evidence base: LEARNINGS_FROM_INDUSTRY.md (industry data confirms over-agentization)
# Status: PROPOSAL — Alan approves before any consolidation ships

---

## 🎯 TL;DR (Lead With Answer)

**Industry data says: collapse the agent count, ship a Claude Code `Stop` hook, schema-enforce outputs.** Four concrete proposals ranked by ROI:

| # | Proposal | Effort | Impact | Risk |
|:-:|---|:-:|:-:|:-:|
| 1 | **Stop hook for output validation** (mechanical gate at AI-generation boundary) | M (2h) | 🔴 HIGH — closes F.19 Tier 3 gap; mechanical not behavioral | 🟢 Low — additive, reversible |
| 2 | **Consolidate chain agents 4 → 1** (Verifier/Validator/QC/Meta-Verifier → single "Auditor") | M (3h) | 🟡 MEDIUM — reduces handoff error per Microsoft Azure SRE reversal | 🟡 Medium — touches pre-commit hook |
| 3 | **Trim mandatory SubSOPs 11 → 5** (highest-leverage only; demote rest to "reference") | S (1h) | 🟡 MEDIUM — reduces compounding self-check error 11×95%→5×95% | 🟢 Low — doc-only change |
| 4 | **Adopt Agent Stability Index** (12-dimension composite metric per arXiv 2601.04170) | L (4h+) | 🟢 LOW — measures but doesn't fix | 🟢 Low — pure measurement |

⭐ **Recommended sequence: #1 first** (highest ROI, mechanical, low risk). Then #3 (trim). Then #2 (consolidate). #4 last (measurement).

---

## 📋 PROPOSAL #1 — Claude Code Stop Hook for Output Validation

### Why
- F.19 Tier 3 ("outputs are files, not chat replies") has been STAGED for 6+ months
- Industry pattern: `Stop` hook fires when AI finishes generation → runs validator → mechanical enforcement at the output-generation gate
- This closes the gap between "AI writes output" and "git commit" — currently convention-only

### What
Add to `.claude/settings.json`:
```json
{
  "hooks": {
    "Stop": [{
      "matcher": ".*",
      "handler": {
        "type": "command",
        "command": "bash scripts/validator.sh --output-mode"
      }
    }]
  }
}
```

Plus modify `scripts/validator.sh` to accept `--output-mode` flag that:
- Reads the just-finished output content
- Runs VL.1–VL.11 checks
- Returns exit code (warning-only initially, blocking after ~10 successful runs)

### Why it matters (per Pixelmojo + arXiv 2605.14744)
> "Without hooks, standards become advisory. With hooks, every rule becomes an enforced, unbypassed gate."
> "Mechanical enforcement raises task accuracy MCC 0.43 → 0.88."

### Effort: ~2h
- ~30 min: settings.json + Stop hook config
- ~1h: validator.sh `--output-mode` flag implementation
- ~30 min: test + doc update

### Risk: 🟢 LOW
- Reversible (remove from settings.json)
- Warning-only initially
- Doesn't change existing chain agents

---

## 📋 PROPOSAL #2 — Consolidate 4-Chain Agents → 1 "Auditor"

### Why
- Microsoft Azure SRE reversed multi-agent specialization after handoff hurt reliability
- All 4 chain agents are Claude in different prompts (same-brain ceiling per F.19)
- Each handoff is a context-switch + token cost + error compounding point
- 17.2x error amplification cited for unstructured multi-agent (arXiv)

### What
- New `agents/auditor.md` — single agent with 4 sequential check phases (Verify → Validate → QC → Meta) as INTERNAL functions of one Claude prompt
- New `scripts/auditor.sh` — single script with all check logic from verifier.sh + validator.sh + qc.sh + meta_verify.sh
- Archive existing 4 to `agents/archive/` (keep history, no delete per Universal Backup Rule)
- Update `.githooks/pre-commit` — single `bash scripts/auditor.sh` call instead of 4
- META_AUDIT_LOG row format unchanged (single "Auditor" row per commit instead of 4)

### Trade-off
- LOSS: separate checkpoints per agent stage
- GAIN: one prompt context → no handoff drift → faster commits → cleaner META_AUDIT_LOG

### Effort: ~3h
- ~1h: design auditor.md + check sequencing
- ~1h: rewrite auditor.sh
- ~30 min: archive 4 + update pre-commit
- ~30 min: test + bootstrap_verify alignment

### Risk: 🟡 MEDIUM
- Touches the actively-running pre-commit hook
- Need to verify chain_health_audit + meta_verify equivalent functionality preserved
- Recommend staged rollout: ship in parallel for 5 commits, compare outputs, then cut over

---

## 📋 PROPOSAL #3 — Trim Mandatory SubSOPs 11 → 5

### Why
- 11 mandatory items × 95% self-check fidelity = 57% chance of full compliance per output
- 5 mandatory items × 95% = 77% — significantly better odds
- Industry pattern: fewer required items + mechanical enforcement > many required items + self-check

### What
**Keep mandatory (5):**
1. SP.6 IAC (Understanding Check) — required for shared interpretation
2. SP.21 MES (Model Effort Selector) — declared at top
3. EN.1 Output Skeleton — structural anti-decay
4. SP.18 SSC (Sync Status) — closes commit→push loop
5. SP.24 RAE (Recommendations At End) — decision funnel

**Demote to "Reference / situational" (6):**
- SP.5 FSP, SP.9 FE, SP.12 HFR, SP.15 EEP, SP.17 SIR, EN.4 Pulse Check

**Rationale:** Demoted items don't STOP being protocols — they become situational. SIR/FE are valuable but not every-output. EEP is so deeply internalized it's now reflex. HFR is reactive-only (fires when failure occurs).

### Effort: ~1h
- ~30 min: edit MANDATORY_TIGHT_LOOP.md Rule 2 + Rule 3 (Pulse Check 10 → 5 items)
- ~15 min: edit PROTOCOLS_REFERENCE.md status labels
- ~15 min: update compliance_check.sh accepted scores (add 5/5 prominent)

### Risk: 🟢 LOW
- Doc-only change
- Reversible
- Doesn't break any existing infrastructure

---

## 📋 PROPOSAL #4 — Adopt Agent Stability Index

### Why
- arXiv 2601.04170: 12-dimension composite metric for drift quantification
- Currently we have ad-hoc PRISTINE (snapshot) + audit_chain_health (chain only)
- Industry has formal metrics; we have heuristics

### What
- New `scripts/stability_index.sh` — computes ASI across 12 dimensions:
  - Response consistency, tool usage patterns, reasoning pathway stability, inter-agent agreement, etc.
- Adds row to new `cache/STABILITY_INDEX.md` (append-only time-series)
- Chiron monthly run aggregates trend
- Add to E2E as check 10/10 (replacing or augmenting current)

### Effort: ~4h
- ~1h: design 12-dimension definitions specific to Universal SOP
- ~2h: script implementation
- ~30 min: PROTOCOLS_REFERENCE entry
- ~30 min: integration with Chiron + dashboard

### Risk: 🟢 LOW
- Pure measurement
- Doesn't change behavior
- Reversible

---

## 🎯 EXECUTION ORDER (Recommended)

| Sprint | Proposal | Why this order |
|:-:|---|---|
| **Sprint 1** (~2h) | #1 Stop hook | Highest ROI, mechanical, low risk. Validates the architecture before bigger changes. |
| **Sprint 2** (~1h) | #3 Trim mandatory | Quick win, doc-only, immediate compliance lift |
| **Sprint 3** (~3h) | #2 Consolidate chain | Bigger surgery. Do after Stop hook proves output-gate enforcement works. |
| **Sprint 4** (~4h+) | #4 Stability Index | Measurement comes last — once architecture is stable, then measure |

Total ~10h to ship all 4. Or pick 1–2 and stop — each is independent.

---

## ⛔ WHAT NOT TO DO

| Anti-pattern | Why |
|---|---|
| Add more agents | We're already in the 17.2x error-amplification zone. More = worse. |
| Add more Pulse Check items | 11→12 makes per-output compliance odds worse, not better |
| Build more reflection layers (REFINE v2.0) | Reflection without actuators = noise. Ship hooks before reflection. |
| Adopt all 4 proposals at once | Industry pattern: ship one, measure, then next |
| Auto-execute any proposal without Alan approval | These are architectural — Alan picks order |

---

## 🎯 CONNECTION TO USER'S CRITIQUE

> "it shouldnt take this many agents to just get the system to work. and even with how dense it is, we still don't have coherence and actual flawless operation as needed"

**Industry data confirms both halves of this critique:**

1. *"this many agents"* → Augment Code data: 4-220x token cost, 41-86.7% failure rate, practical limit 3-4 agents
2. *"still don't have coherence"* → arXiv 2605.14744: same-model self-check = "recommendation not constraint"; mechanical enforcement closes the gap

**The fix is reduction + mechanical enforcement at the output gate, not addition.** This proposal is the blueprint.

---

## 📋 NEXT ACTION

Alan picks which proposal(s) to ship. Default recommendation: **#1 Stop hook** as the single highest-leverage move.

---

*SIMPLIFICATION_PROPOSAL.md v1.0 | aurelia | 2026-05-23 | Companion: LEARNINGS_FROM_INDUSTRY.md*
