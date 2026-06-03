# 🔗 AGENT CHAIN — The Full Verification & Improvement Pipeline
# VERSION: 1.0 | 2026-06-03 (mac-main) | Governed by PRIME_SOP.md v2.8 (Layer 0)
# Restored per Alan's verbatim chain spec ("go 3") + the Discipline layer (F.63)

> **The honest principle (F.63):** an agent only creates discipline if it runs in a **separate context** — its own sub-agent invocation, blind to the builder's choices. A chain the builder *narrates* ("Karen: ✅") is theater. This file defines the real chain; each step is a separate `Agent` call, not a self-claim.

---

## 🎯 GROUND ZERO — The Checklist Loop Wraps Everything

Before the chain ever runs, **Prime Stage 1** fires (now mechanically enforced by `scripts/checklist_gate.sh`):

```
1. RELAY   → AI restates the ask as a numbered UNDERSTANDING CHECK (text checklist)
2. 💠       → User confirms or corrects (same page) — recorded as a CONFIRMED PER
3. EXECUTE → only now does the builder do the work
4. RE-CHECK→ after execution, every checklist item is marked ✅/🔄/❌ (Stage 9 / Conclusion)
```

The agent chain below runs between EXECUTE and RE-CHECK — it is *how* step 4 is proven, not self-claimed.

---

## 🔗 THE CHAIN (In Order — Alan's Verbatim Sequence)

Two bands. **Build/Improve band** runs first (find problems + opportunities while context is fresh), then the **Verify/Gate band** confirms correctness + completion, then the **Capstone**.

| # | 🤖 Agent | Question it answers | Implementing file | Tier | New/Restored |
|:-:|---------|---------------------|-------------------|:----:|:------------:|
| — | **Checklist Gate** | "Did we relay back + get 💠 before building?" | `scripts/checklist_gate.sh` | 🥇 | ✅ live |
| 1 | 💡 **Insight** | "What helpful non-obvious context should surface?" | `agents/insight.md` | 🥈 | new |
| 2 | 🐛 **Debugger / Proactive** | "What will break — find + resolve it BEFORE it does?" | `agents/debugger.md` | 🥈 | new (Prime Stage 7.5) |
| 3 | ⚡ **Enhancement** | "Where can this be improved / made more efficient?" | `agents/enhancement.md` | 🥈 | new (Prime QE) |
| 4 | 🔮 **Foresight** | "What future problems + mitigations should we predict?" | `agents/refine_foresight.md` (adapt) | 🥈 | exists |
| 5 | ✅ **Karen** | "Did we ACTUALLY complete the checklist (no rubber-stamp)?" | `agents/karen.md` | 🥈 | **restored** |
| 6 | 🔍 **Validation** | "Did we do it the WAY it was supposed to be done?" | `agents/validator.md` | 🥈 | exists |
| 7 | 🎯 **Scope** | "Are we on track micro AND macro vs the grander picture?" | `agents/scope.md` | 🥈 | new |
| 8 | 🏆 **Master Pass** | "Is this truly masterful? Faults, constraints, opportunities → propose to user" | `agents/master_pass.md` | 🥈 | new |
| 9 | 📋 **Recommendation** | "What are the final pickable next actions?" | `agents/recommendation.md` | 🥉/🥈 | new (SP.24 RAE) |
| ⊕ | 🔬 **Depth-Maximizer ("Tom")** | "Is each PROTOCOL filled with maximal, measurable, repeatable substance?" | `agents/depth_maximizer.md` | 🥈 | new (periodic, not per-output) |

> **Order note (confirmed with Alan's wording):** Build/Improve (1–4) → Verify/Gate (5–7) → Capstone (8–9). Alan listed the verify cluster "after the insight/debugger/enhancement/foresight" — honored. (My earlier instinct to verify-first was overruled by his stated order.)

---

## ⛓️ GATING RULES (How The Chain Actually Enforces)

| Rule | Behavior |
|------|----------|
| **Separate context** | Each agent is a distinct `Agent` invocation. It reads the output + sources *itself*; it never trusts the builder's summary. (Breaks the same-brain ceiling — F.19/F.63.) |
| **Karen is a hard gate** | If Karen returns REJECTED (checklist not actually complete / rubber-stamp detected) → the output does NOT ship. Fix → re-run. |
| **Validation is a hard gate** | If Validation finds it was done the wrong way → REJECTED → fix → re-run. |
| **Scope is an alignment gate** | If off-track micro/macro → flag to user before shipping (don't silently drift). |
| **Master Pass proposes, never auto-changes** | Surfaces faults/opportunities → user decides. Always backs up previous state + proposes new. **Building, never reducing.** |
| **When to run the full chain** | Framework deliverables / SOP changes / multi-file work. Conversational replies + QUICK-tier skip the heavy chain (Prime tiering). |
| **When to run lightweight** | Per-output: Insight + Recommendation always; full Verify/Gate band on protected-content changes. |
| **Depth-Maximizer cadence** | Periodic (not per-output) — audits the protocol library for thinness. Runs on-demand + after any protocol edit. |

---

## 🧩 MAPPING TO THE EXISTING ROSTER (No Duplication)

The repo already had a 4-layer chain (Verifier→Validator→QC→Meta-Verifier) + Chiron + REFINE. This chain **absorbs + renames toward Alan's vocabulary**, it does not fork a parallel system:

| Alan's chain step | Reuses / supersedes |
|-------------------|---------------------|
| Validation (#6) | `verifier.md` (presence) + `validator.md` (substance) |
| Karen (#5) | `qc.md` carried Karen's anti-rubber-stamp DNA → **Karen restored as the named gate**; qc.md becomes Karen's script-enforcement half |
| Foresight (#4) | `refine_foresight.md` (weekly) → also per-output via this step |
| Enhancement (#3) | `chiron.md` + REFINE (weekly meta) → per-output enhancement via this step |
| Master Pass (#8) | `meta_verifier.md` (audits the chain) + QE → **Master Pass** = the masterfulness capstone |

**Controller** (`agents/controller.md`) remains the orchestrator that sequences the chain.

---

## 📐 STATUS (2026-06-03)

**Full chain instantiated this session** — every step has a real agent definition file:

| ✅ Built | File |
|---------|------|
| AGENT_CHAIN.md (this spec) | — |
| 💡 Insight | `agents/insight.md` |
| 🐛 Debugger | `agents/debugger.md` |
| ⚡ Enhancement | `agents/enhancement.md` |
| 🔮 Foresight | `agents/refine_foresight.md` (existing — adapt for per-output) |
| ✅ Karen (restored) | `agents/karen.md` |
| 🔍 Validation | `agents/validator.md` + `agents/verifier.md` (existing) |
| 🎯 Scope | `agents/scope.md` |
| 🏆 Master Pass | `agents/master_pass.md` |
| 📋 Recommendation | `agents/recommendation.md` |
| 🔬 Depth-Maximizer ("Tom") | `agents/depth_maximizer.md` |

**Next (not built yet):** wire the chain into `controller.md` orchestration + a runner that invokes each as a real separate-context `Agent` call; restore Door Scan caching (Phase: token-saving referencing) so the chain loads only the doors it needs.

---

*AGENT_CHAIN.md v1.0 | The real, separate-context verification + improvement pipeline | Prime SOP v2.8 | 2026-06-03 (mac-main)*
