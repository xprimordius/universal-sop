# 🛡️ VALIDATION WORKFLOW v4.0 — Universal SOP Agent Chain
# VERSION: 4.0 | 2026-05-21 | aurelia | F.19 agent-chain rebuild (replaces v3.0 APW-era workflow)
# Prior version (v3.0 APW) preserved in `backups/VALIDATION_WORKFLOW_v3.0_20260521_213146_aurelia_pre_universal_sop_rewrite_backup.md`

---

## 🎯 PURPOSE

Defines **when** to invoke each of the 5 active agents, **in what order**, and **how their outputs combine** to gate an output before it ships to the user.

This is the operating workflow for the Universal Output SOP v1.3. The v3.0 APW workflow (D-rules, module lists, classroom maps) is preserved in `backups/` for APW resume.

---

## 🏗️ ARCHITECTURE (5 Active Agents)

```
Builder (Claude session) creates an output
        ↓
┌───────────────────────────────────────────────────────────┐
│  CONTROLLER                                              │
│  - Decides which agents run (tier + mode-dependent)      │
│  - Verifies cache integrity at session start             │
│  - Maintains BACKUP_LOG + SESSION_STATE                  │
└───────────────────────────────────────────────────────────┘
        ↓
┌───────────────────────────────────────────────────────────┐
│  Layer 1 — VERIFIER                                      │
│  Mechanical presence check (cheapest, fastest)           │
│  V.1-V.8: STEP header? LTM? Pulse Check P1-P5? Honest?   │
│  Backed by: scripts/verifier.sh                          │
└───────────────────────────────────────────────────────────┘
        ↓ (only if Verifier PASS)
┌───────────────────────────────────────────────────────────┐
│  Layer 2 — VALIDATOR                                     │
│  Substantive check vs 6 mandatory SubSOPs                │
│  VL.1-VL.6: SP.6 IAC, SP.5 FSP, SP.12 HFR, SP.15 EEP,    │
│            EN.1 Output Skeleton, EN.4 Pulse Check honest │
│  Backed by: scripts/validator.sh                         │
└───────────────────────────────────────────────────────────┘
        ↓ (only if Validator PASS)
┌───────────────────────────────────────────────────────────┐
│  Layer 3 — QC                                            │
│  Quality control + anti-rubber-stamp Verifier+Validator  │
│  + Karen's F.16 script-enforcement DNA preserved         │
│  Q.1-Q.11: output-vs-ask + upstream audit + script check │
│  Backed by: scripts/qc.sh                                │
└───────────────────────────────────────────────────────────┘
        ↓ (only if QC APPROVED)
┌───────────────────────────────────────────────────────────┐
│  Layer 4 — META-VERIFIER                                 │
│  Audits the chain itself (NEW — closes Alan's gap)       │
│  MV.1-MV.7: all 3 ran? formats correct? no contradictions?│
│           rolling trend? no bypass?                      │
│  Backed by: scripts/meta_verify.sh                       │
│  Logs to: cache/META_AUDIT_LOG.md (append-only)          │
└───────────────────────────────────────────────────────────┘
        ↓ (only if CHAIN HEALTHY)
   DELIVER TO USER
```

---

## 🚪 WHEN TO RUN WHAT

### By MODE (per `MANDATORY_TIGHT_LOOP.md`)

| MODE | Chain runs? | Which layers? |
|---|:-:|---|
| `MODE: CONVERSATION` | ❌ No | None — conversational turns don't carry SOP overhead |
| `MODE: OUTPUT-QUICK` | ⚠️ Partial | Verifier only (presence check on the lightweight QUICK-tier requirements) |
| `MODE: OUTPUT-STANDARD` | ✅ Full | Verifier → Validator → QC → Meta-Verifier |
| `MODE: OUTPUT-COMPLEX` | ✅ Full + rigor | All 4 + extended Foresight + SHR added to output |

### By Trigger

| Trigger | Agents | Notes |
|---|---|---|
| Session start | Controller (only) | Verify cache integrity, run `bootstrap_verify.sh` |
| Every OUTPUT-STANDARD/COMPLEX | Full chain | V → VL → QC → MV |
| Pre-commit hook fires | Full chain (warnings-only initially) | Until chain matures (~10 outputs) |
| User says `--no-verify` bypass | QC mandatory | Inherits Karen F.16 — bypass detection |
| Append-only file shrunk | QC mandatory | Inherits Karen F.16 |
| Major framework deliverable | Full chain | Same as OUTPUT-COMPLEX |
| Conversational reply | Skip all | CONVERSATION mode — no overhead |

---

## 💰 TOKEN BUDGET IMPACT (vs APW v3.0)

| Operation | v3.0 (APW) | v4.0 (Universal SOP) |
|---|---|---|
| Inline checks (per output) | ~200 tokens | ~0 (script-based) |
| Karen spot-check | ~7,500 tokens | (subsumed into QC at ~600) |
| Validator-Merged | (inline, ~0) | Validator markdown report ~400 |
| Verifier | (didn't exist) | ~200 tokens (or 0 script-only) |
| Meta-Verifier | (didn't exist) | ~500 tokens (or 0 script-only) |
| **Full chain (markdown reports)** | ~7,700 | ~1,700 |
| **Full chain (script-only)** | n/a | ~0 |

**Net savings:** ~6,000 tokens per major deliverable, AND added 2 layers of independent verification.

---

## 🎚️ TIERED OPERATION (SP.3 TTE Thresholds)

| Token Status | Chain Behavior |
|---|---|
| 🟢 GREEN (<108K) | Full chain on every OUTPUT-STANDARD/COMPLEX |
| 🟡 YELLOW (108-130K) | Skip Validator markdown report (run script only). Skip Meta-Verifier markdown report. Keep scripts. |
| 🔴 RED (130-141K) | Verifier + QC only (skip Validator + Meta-Verifier). Cache state. No new deliverables. |
| 🆘 CRITICAL (>141K) | All chain disabled. Emergency cache dump. Stop work. |

---

## 🪝 PRE-COMMIT HOOK INTEGRATION

`.githooks/pre-commit` invokes the chain in order:

```
1. append_only_check.sh   (cache files protected — BLOCKING)
2. compliance_check.sh    (Rule #11 + step header — warnings-only)
3. verifier.sh            (V.1-V.8 mechanical — warnings-only)
4. validator.sh           (VL.1-VL.6 substantive — warnings-only)
5. qc.sh                  (Q.1-Q.11 quality + anti-rubber-stamp — warnings-only)
6. meta_verify.sh         (MV.1-MV.7 chain audit — warnings-only)
```

**Warnings-only initially** (per F.19 Tier 1 stabilization). After ~10 outputs with the chain, tighten to blocking (exit 1 → commit fails until fixed).

**Bypass:** `git commit --no-verify` skips all hooks. Must include HFR justification in commit message OR QC will flag in next commit.

---

## 🤖 AGENT FILES

| File | Role | Backed by |
|---|---|---|
| `agents/controller.md` | Orchestrator (kept from F4 fusion) | (markdown only — orchestration is Claude's job) |
| `agents/verifier.md` | Layer 1 mechanical | `scripts/verifier.sh` |
| `agents/validator.md` | Layer 2 substantive | `scripts/validator.sh` |
| `agents/qc.md` | Layer 3 QC + anti-rubber-stamp | `scripts/qc.sh` |
| `agents/meta_verifier.md` | Layer 4 chain audit | `scripts/meta_verify.sh` |

### Archived (preserved for APW resume)

- `agents/archive/validator-merged.md` — APW POVP + D-rule predecessor
- `agents/archive/karen-reality-check.md` — APW Karen (DNA preserved in QC)
- `agents/archive/paradox-resolver.md` — APW SCIO tension (no current work)
- `agents/archive/jenny-sop-verifier.md` — pre-F5 (already archived March)
- `agents/archive/oversight-executive.md` — pre-F4 (already archived)
- `agents/archive/cache-manager.md` — pre-F4 (already archived)
- `agents/archive/APW_AGENTS_ARCHIVE_REASON.md` — full archival rationale

---

## 🔁 ERROR HANDLING

| Failure | Response |
|---|---|
| Verifier script errors | Pre-commit hook logs, continues (warnings-only). Investigate via `cache/META_AUDIT_LOG.md`. |
| Validator returns FAIL | Output goes back to builder for fix. Re-run chain. |
| QC REJECTS | Output blocked. Builder must address Q.X items + re-run chain. |
| Meta-Verifier detects chain compromised | Output blocked. The chain itself needs fixing before any output ships. |
| Sub-agent invocation times out | Builder executes that layer manually + documents manual execution. Meta-Verifier flags if log row missing. |
| Karen / Validator-Merged invoked (legacy) | Redirect to QC / Validator. Update calling code. |

---

## 📜 SESSION START PROTOCOL (F.17 boot-up self-test)

Every session, before any work:

1. Read SESSION_START.md (the canonical entry)
2. Run `bash scripts/bootstrap_verify.sh` (70+ checks across 13 sections)
3. Read STEP 1 files per the chosen path (Fast-Path or Cold Start)
4. Confirm via SESSION_START STEP 2 (9-line `✅ RESUMED` format)
5. Wait for user task

Only after the bootstrap completes can the agent chain be invoked on outputs.

---

## 🔗 RELATED

- **`SELF_COMPLIANCE_FIX.md`** — diagnosis of why the v3.0 workflow stopped working
- **`MANDATORY_TIGHT_LOOP.md`** — the reduced ruleset the chain enforces (Tier 1 of F.19 fix)
- **`cache/FAILURE_LEDGER.md` F.19** — the meta-failure entry that motivated this rebuild
- **`cache/META_AUDIT_LOG.md`** — append-only trail of every chain run
- **`SOP_MAP.md` + `SOP_MAP.html`** — visual reference for the full system

---

*VALIDATION_WORKFLOW.md v4.0 | F.19 agent-chain rebuild | Universal SOP v1.3 | aurelia | 2026-05-21*
