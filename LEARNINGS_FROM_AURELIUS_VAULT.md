# 🔄 LEARNINGS FROM AURELIUS-VAULT — Cross-Pollination Findings
# Born: 2026-05-21 | aurelia | Per Alan: "learn from github... aurelius-vault, especially gold path"
# Two-way relationship: Aurelius borrowed N/M from us; we now borrow GOLD-PATH from them.

---

## 🎯 ONE-LINE SUMMARY

> Aurelius (Alan's other project — local voice agent + Obsidian vault) has 8 autonomous agents running on schedule, a GOLD-PATH protocol for tech recommendations, a 9-point PROVE-IT checklist as the closing-report spine, and a clean two-repo split (data + orchestration). Universal SOP should adopt 3-4 of these patterns immediately, queue the rest as roadmap.

---

## 📂 WHAT AURELIUS HAS

### Repos
- **`xprimordius/aurelius-vault`** — Obsidian vault (data layer): append-only Memory/, Conversations/, Reflections/, Daily/, Bottlenecks/, Insights/, Goals/, Intent/, Self-Optimization/, Reference/
- **`xprimordius/aurelius-agent-stack`** — orchestration layer (code): voice_agent.py + 13 Python agents + Windows Task Scheduler hooks

### Reference docs in `aurelius-vault/Reference/`
- `Aurelius-Master-SOP.md` — the per-turn execution protocol
- `GOLD-PATH-Protocol.md` ⭐ — what Alan pointed at
- `PROVE-IT-Protocol.md` — 9-point closing checklist
- `Failure-Ledger.md` (F-NNN) — exact same pattern as our `cache/FAILURE_LEDGER.md` (F.X)
- `Multi-Device-Sync-Protocol.md` — analog of our `MULTI_DEVICE_GIT_PROTOCOL.md`
- `Token-Efficient-Sessions.md` — analog of our `TOKEN_OPTIMIZATION_GUIDE.md`
- `Bottlenecks-and-Solutions.md` — perf/structural issue tracker
- `Agent-Roster.md` — active + queued agents with cadence
- `Operations-Log.md` — append entry per "operation" (Op 38, Op 31, etc.)

### Autonomous Python agents (in `aurelius-agent-stack/agents/`)
| Agent | Cadence | Function |
|---|---|---|
| `qa_test_agent.py` | every op | Code review + regression detection |
| `alignment_tracker_agent.py` | every 3-5 ops | Macro-vision alignment score 1-10 |
| `user_prompt_organizer.py` | continuous | Captures user intent, categorizes |
| `goal_agent.py` | daily + on /goal | Macro+micro milestones, "you are here" pointer |
| `bottleneck_agent.py` | weekly + on perf drop | Latency/race/error pattern scan |
| `insight_agent.py` | daily | Cross-references conversations/reflections/goals/bottlenecks |
| `daily_review_agent.py` | daily at 8 AM (Windows Task Scheduler) | Morning summary + 7-day repeated topics |
| `self_optimization_agent.py` | (cadence TBD) | System self-improvement |
| `self_prompting_agent.py` | (cadence TBD) | Generates self-prompts |
| `timeline_agent.py` | (cadence TBD) | Timeline maintenance |
| `bench_agent.py` | (cadence TBD) | Benchmarking |

**Critically:** these are **Python scripts calling local LM Studio** (Llama 3.3 70B / Gemma 4B). They run WITHOUT Claude. **This is the architectural answer to our "same-brain ceiling" (Q.3) — autonomous agents that are a different brain (a local LLM, not Claude).**

---

## 🥇 THE GOLD-PATH PROTOCOL (Verbatim Spec)

Read `aurelius-vault/Reference/GOLD-PATH-Protocol.md` for full text. Distilled:

**Principle:** *Always reach for the gold-standard solution first. Deviation requires explicit justification (cost, license, hardware, time).*

**Acronym:**
| Letter | Step | Action |
|---|---|---|
| **G** | Gather | List top 3 SOTA options TODAY (not training-data defaults) |
| **O** | Observe | License, hardware fit, cost, real-world adoption |
| **L** | Lead | Recommend the gold option FIRST |
| **D** | Deviate | Only if forced by constraint — cite the trade-off |
| **P** | Prove | Link/cite source for the SOTA claim |
| **A** | Audit | Grep-able — user can demand "did you GOLD-PATH this?" |
| **T** | Track | Skip incidents → Failure-Ledger F-NNN |
| **H** | Honor | If user contests with new info, treat as miss, update recommendation |

**Mandatory before recommending:** new external tool/model/library/framework, replacing an existing component, picking a stack for a new feature, naming a vendor for the first time.

**Render this table BEFORE the body of any recommendation:**

```
GOLD-PATH for: <component>

| Option | License | Hardware fit | Cost | Adoption | Notes |
|---|---|---|---|---|---|
| Option A (GOLD) | ... | ... | ... | ... | recommended |
| Option B | ... | ... | ... | ... | runner-up |
| Option C | ... | ... | ... | ... | comparison |

Recommendation: Option A
Justification: <one sentence>
Deviation: <if any constraint forces deviation>
```

**Anti-patterns it prevents:**
- Doc-anchoring ("our docs say X, so improve X")
- Training-data defaults (2023-popular libraries when 2026 has better)
- Incrementalist bias ("tweak our current X" when the right move is replace)
- Skipping cost honesty
- Sacred cows

---

## 📊 THE PROVE-IT 9-POINT BLOCK (Closing Report Spine)

Every Aurelius operation writeup ends with these 9 checkboxes (user-specified, non-negotiable):

```
[ ] 1. QA              — independent audit (agent or human)
[ ] 2. Test            — exact N/N tests passing (not "all green")
[ ] 3. Quality         — what improved (concrete, not vibe)
[ ] 4. Bottlenecks     — perf/structural issues identified
[ ] 5. Constraints     — dependencies/limits exposed
[ ] 6. Errors          — what failed (full HFR if any) + new F-NNN row
[ ] 7. Break points    — where it could break next (specific)
[ ] 8. Improve/Resolve — fixes shipped this op (file:line)
[ ] 9. Foresight       — proactive forecast (top 2-3 risks)
```

**This is richer than our 7-item Pulse Check.** We have pieces of each scattered (Pulse Check P1-P7, SIR for #9, sync status for #8) but not as one 9-point spine.

---

## 🧩 OUR UNIVERSAL SOP vs AURELIUS — SIDE BY SIDE

| Concept | Universal SOP | Aurelius | Direction |
|---|---|---|---|
| **Failure ledger** | `cache/FAILURE_LEDGER.md` (F.1–F.22) | `Reference/Failure-Ledger.md` (F-NNN) | Same pattern, both established |
| **Multi-device sync** | `MULTI_DEVICE_GIT_PROTOCOL.md` | `Reference/Multi-Device-Sync-Protocol.md` | Same |
| **Token optimization** | `TOKEN_OPTIMIZATION_GUIDE.md` | `Reference/Token-Efficient-Sessions.md` | Same |
| **N/M marker** | originated here | borrowed from us (explicit acknowledgment in their PROVE-IT-Protocol.md) | ✅ Us → them |
| **Macro+Micro intent** | adopted in MANDATORY_TIGHT_LOOP | originated in Aurelius-Master-SOP | ⬅️ Them → us |
| **GOLD-PATH protocol** | **MISSING** | Active SP-equivalent | ⬅️ Them → us (adopt) |
| **9-point closing checklist** | 7-item Pulse Check (lighter) | PROVE-IT 9-point (richer) | ⬅️ Them → us (consider) |
| **Per-turn 8-step pattern** | Implicit | Explicit (RECEIVE→UNDERSTAND→RELAY→PLAN→EXECUTE→VALIDATE→PERSIST→SUMMARIZE) | ⬅️ Them → us (consider) |
| **Autonomous agents on schedule** | Manually invoked | 8+ agents on Windows Task Scheduler | ⬅️ Them → us (CRITICAL — closes Q.3 same-brain ceiling) |
| **Operation numbering** | Commits only | Op 38, Op 31, etc. (sequential, named) | ⬅️ Them → us (consider) |
| **Two-repo split** | One repo | vault (data) + agent-stack (code) | ⬅️ Them → us (consider for future) |
| **External-AI consultation hook** | None | GOLD-PATH-Protocol.md has explicit "if you're an external AI consulting on this" section | ⬅️ Them → us (adopt) |

---

## 🎯 PROPOSED ADOPTIONS

### Tier 1 — Adopt immediately (next commit)

| # | Adoption | Rationale |
|:-:|---|---|
| **A1** | **SP.19 GLD — GOLD-PATH Protocol** (new SubSOP) | Critical gap. Every time we picked Mermaid, mermaid-cli, Obsidian, gh CLI, etc., we did not GOLD-PATH them. Adopt the protocol verbatim with `aurelia` adaptations. |
| **A2** | **MERGE Pulse Check (7 items) ↔ PROVE-IT (9 items) → unified 9-point spine** | Replace our 7-item with their 9-item (it covers our 7 + adds Bottlenecks + Break Points). Pulse Check v2.0. |
| **A3** | **External-AI consultation hook** | Add a "How external systems use this protocol" section to MANDATORY_TIGHT_LOOP referencing PROTOCOLS_REFERENCE + GOLD-PATH. |

### Tier 2 — Adopt soon (1-2 commits ahead)

| # | Adoption | Rationale |
|:-:|---|---|
| **A4** | **Autonomous agent layer (Python + local LLM)** | This is THE answer to Q.3 (same-brain ceiling). Build `scripts/run_daily_agents.py` calling local LM Studio if available, or a fallback that just runs the existing chain scripts on a cron schedule. |
| **A5** | **Operation numbering** (Op 1, Op 2, etc.) | Cleaner reference than SHAs in conversation. Update commit subjects: `[aurelia | TS] Op N · summary` |
| **A6** | **8-step per-turn pattern formalized in MANDATORY_TIGHT_LOOP** | Add as Rule 5: "Every turn follows RECEIVE → UNDERSTAND → RELAY → PLAN → EXECUTE → VALIDATE → PERSIST → SUMMARIZE." |

### Tier 3 — Architectural (future)

| # | Adoption | Rationale |
|:-:|---|---|
| **A7** | **Two-repo split (data vs orchestration)** | When `universal-sop/scripts/` grows large enough to warrant separation, split into `universal-sop` (data) + `universal-sop-agent-stack` (code). Defer until pain forces it. |
| **A8** | **Daily review agent** (Windows Task Scheduler + LM Studio) | Cross-pollinate Aurelius's `aurelius_daily_review.py` directly — point it at our SIR_LOG + META_AUDIT_LOG + FAILURE_LEDGER. |

---

## 📝 ADD TO QUINTESSENCE_ROADMAP.md

These become **F.42+** entries in the deferred-findings list:

- **F.42** — SP.19 GLD (GOLD-PATH Protocol) missing
- **F.43** — Pulse Check 7-item vs PROVE-IT 9-item discrepancy (consolidate)
- **F.44** — No autonomous agent layer (Q.3 ceiling persists)
- **F.45** — No external-AI consultation hook
- **F.46** — No operation numbering convention
- **F.47** — No 8-step per-turn pattern formalized

---

## 🔄 BIDIRECTIONAL FLOW (Acknowledge The Relationship)

| What flows | Direction | Status |
|---|:-:|---|
| `N/M` marker convention | universal-sop → Aurelius | ✅ acknowledged in their PROVE-IT |
| `GOLD-PATH` protocol | Aurelius → universal-sop | ⏳ pending (this doc proposes adoption) |
| Failure ledger pattern (F.X / F-NNN) | parallel convergence | ✅ both established |
| Multi-device sync | parallel convergence | ✅ both established |

**Recommendation:** Add to both repos a small `CROSS_PROJECT_LEARNINGS.md` documenting what flows where, so future Claude (or other AI) can see the patterns are intentionally cross-pollinated, not duplicated.

---

## 🎯 RECOMMENDED NEXT COMMITS (For New Chat)

If continuing in a fresh chat (per `CONTINUATION_POINTER.md`), the highest-leverage adoptions are:

1. **A1 (SP.19 GLD)** — single new SubSOP via `scripts/add_protocol.sh` (which now has a real use case). 9-file propagation. ~30 min.
2. **A4 (Autonomous agent layer)** — closes Q.3 (the only quintessence property still at 0/10). Largest single quintessence improvement available. ~4-6h.

The other adoptions are nice-to-have polish.

---

## 📜 ORIGIN

| Field | Value |
|---|---|
| Trigger | Alan 2026-05-21: "learn from github. https://github.com/xprimordius/aurelius-vault especially gold path" |
| Investigation | `gh repo view` + `gh api contents/` + `gh api search/code` for both repos |
| Key file located | `aurelius-vault/Reference/GOLD-PATH-Protocol.md` |
| Author commit | (this commit) |
| Cross-pollination relationship | Bidirectional — both projects developing in parallel, both Alan's |
| Next action | Ship GOLD-PATH as SP.19 via `add_protocol.sh` in a new chat (per CONTINUATION_POINTER.md) |

---

*LEARNINGS_FROM_AURELIUS_VAULT.md v1.0 | Cross-pollination findings | aurelia | 2026-05-21*
