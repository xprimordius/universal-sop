# 📦 APW AGENTS ARCHIVE — Reason + Timeline
# Created: 2026-05-21 | Device: aurelia | Part of F.19 agent-chain rebuild

---

## 🎯 WHY THESE WERE ARCHIVED

The agents listed below were active during the APW course-build era (Mar 14 – Apr 1, 2026, SOP v2.8 → v3.9.2). When the project pivoted to Universal SOP v1.3 (Apr 1+), **the agent count was reduced via F4 + F5 fusions but the agent CONTENT was never updated.** They continued to validate APW deliverables (D-rules D1–D32, APW caches, module lists, classroom maps) — which is wrong for Universal-SOP outputs.

Per F.19 (2026-05-21 META-FAILURE entry), this is one of the two root causes of the SOP failing to enforce itself on output-level work:

1. Wrong content (these agents target APW, not Universal SOP) ← addressed by archiving these + creating new agents
2. Same-brain-audits-itself (per F.19) ← addressed by Tier 3 outputs-as-files architecture (staged)

These agents are **preserved here** (not deleted) for:
- 🔁 APW course resume (when SOP validation completes, work returns to APW Step 4)
- 📚 Historical fidelity (this was a real, working agent layer for ~6 weeks)
- 🛡️ Universal backup rule compliance (no file deletion, ever)

---

## 📋 ARCHIVED FILES

| 📄 File | 🏛️ Era | 🎯 Original Role | 🔄 Successor (Universal SOP) |
|---|---|---|---|
| `agents/archive/validator-merged.md` | APW v3.9.x | Layer 1 — POVP (D19) + Completeness + Simplicity (D7) + Cross-ref against APW caches | Split into `agents/verifier.md` (mechanical presence) + `agents/validator.md` (substantive against 6 mandatory SubSOPs) |
| `agents/archive/karen-reality-check.md` | APW v3.9.x + F.16 expansion | Layer 2 — anti-rubber-stamp Layer 1 + script enforcement (F.16) | `agents/qc.md` (preserves anti-rubber-stamp DNA + F.16 script-enforcement expansion, retargeted from APW to Universal SOP) |
| `agents/archive/paradox-resolver.md` | APW v3.9.x | SCIO ↔ APW tension resolution (on-demand) | No current successor — APW paused, SCIO not active. May be repurposed as "SOP-conflict resolver" in future, or fully archived as F20 fusion. |
| `agents/archive/VALIDATION_WORKFLOW.md` (rewrite-in-place) | APW v3.0 | Decision tree for which agents run on which APW deliverables | `agents/VALIDATION_WORKFLOW.md` rewritten in place for the new Universal SOP agent chain (Controller → Verifier → Validator → QC → Meta-Verifier). Old content preserved in `backups/`. |

---

## 🆕 NEW UNIVERSAL-SOP AGENT CHAIN (Successors)

The Universal SOP system now has a 5-agent architecture:

| Position | Agent | Layer | File |
|---|---|---|---|
| Orchestrator | **Controller** | Meta | `agents/controller.md` (kept, slightly updated for RPT_LOG → FAILURE_LEDGER) |
| Layer 1 | **Verifier** | Mechanical presence check | `agents/verifier.md` (NEW) + `scripts/verifier.sh` |
| Layer 2 | **Validator** | Substantive check vs 6 mandatory SubSOPs | `agents/validator.md` (NEW) + `scripts/validator.sh` |
| Layer 3 | **QC** | Quality control + anti-rubber-stamp + F.16 script enforcement | `agents/qc.md` (NEW) + `scripts/qc.sh` |
| Layer 4 | **Meta-Verifier** | Audits the audit chain (closes Alan's "who verifies the verifier" gap) | `agents/meta_verifier.md` (NEW) + `scripts/meta_verify.sh` |

Each layer has both a markdown role definition (what + why) and a backing script (mechanical enforcement). Per F.19, mechanical enforcement is the architecture that holds; convention without enforcement decays.

---

## 🔄 IF APW WORK RESUMES

The archived agents are intact. To resume APW course-build:

1. Read `agents/archive/validator-merged.md`, `karen-reality-check.md`, `paradox-resolver.md` for the APW validation context
2. Read `cache/legacy/APW_MASTER_CACHE.md`, `BRIDGE_SOP.md`, `PRIME_SOP.md` for the APW rulebook
3. Decide: keep using the new Universal-SOP chain (Verifier/Validator/QC/Meta) and adapt the checks to APW outputs, OR reactivate the archived agents in parallel for APW-specific deliverables

The new agent chain is content-agnostic (checks Universal SOP compliance regardless of WHAT the output is about). For pure APW course-content checks (does this module match SCIO principle X?), the archived agents are still the best reference.

---

## 📜 LOGGED IN

- `cache/FAILURE_LEDGER.md` entry **F.19** — meta-failure that motivated the rebuild
- `cache/BACKUP_LOG.md` — rows logging each agent move
- `SELF_COMPLIANCE_FIX.md` — the diagnosis + 3-tier solution

---

*APW Agents Archive Reason v1.0 | F.19 agent-chain rebuild | aurelia | 2026-05-21*
