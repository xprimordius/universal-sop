# 🔄 REFINE PROTOCOL — Proposal For SP.20 (Self-Improvement Loop)
# Born: 2026-05-22 | aurelia | Per Alan: "learn + self improve + audit + refine + proactive problem solve... break down the checklist with agents"
# Ship via `scripts/add_protocol.sh SP.20 REF "REFINE Protocol" "Weekly Self-Improvement Loop"` in a fresh chat.

---

## 🎯 NAME

**SP.20 REFINE — Recursive Evaluation + Foresight + Intervention + Notation + Evolution**

Six letters = six steps. Mnemonic matches project style (PROVE-IT, GOLD-PATH).

---

## 🎯 WHAT IT IS

The **self-improvement loop** the Universal SOP currently lacks. Today we have observation infrastructure (SIR, FAILURE_LEDGER, META_AUDIT_LOG) but **zero intervention infrastructure**. REFINE is the missing layer: weekly cycle that reviews, extracts patterns, predicts breaks, intervenes preemptively, logs the intervention, and evolves the protocol set when patterns recur.

Closes Quintessence properties Q.1 (closed feedback loops) + Q.4 (proactive drift detection) + Q.8 (failure-to-fix automation) + Q.9 (session lifecycle automation) at a single architectural stroke.

---

## 📋 THE 6 STEPS

```
R · Review     — look back at last N outputs/commits/sessions
E · Extract    — pull patterns (recurring failures, SIR insights, chain warnings)
F · Foresee    — predict next break-points, constraints, bottlenecks
I · Intervene  — apply preemptive fix BEFORE the predicted break lands
N · Note       — log to FAILURE_LEDGER as "PREEMPTIVE FIX" (new type)
E · Evolve     — propose protocol/architecture change to eliminate the pattern class
```

---

## 🤖 AGENT ASSIGNMENTS

Six new agents, each backed by a script. Following Aurelius's Python-on-schedule pattern (cron / Windows Task Scheduler).

| Step | Agent file (new) | Script (new) | Cadence | Reads | Writes |
|:-:|---|---|---|---|---|
| R | `agents/refine_reviewer.md` | `scripts/refine_review.sh` | weekly + on-demand | `META_AUDIT_LOG`, `BACKUP_LOG`, `SIR_LOG`, `FAILURE_LEDGER`, last 50 commits | `cache/refine/REVIEW_<date>.md` |
| E | `agents/refine_extractor.md` | `scripts/refine_extract.sh` | weekly | Review output + same logs | `cache/refine/EXTRACT_<date>.md` |
| F | `agents/refine_foresight.md` | `scripts/refine_foresee.sh` | weekly + pre-major-commit | Extract output + repo state | `cache/refine/FORESEE_<date>.md` |
| I | `agents/refine_intervention.md` | `scripts/refine_intervene.sh` | weekly OR on Foresee 🔴 | Foresee output | Code changes, new files, commits tagged `[REFINE]` |
| N | `agents/refine_scribe.md` | `scripts/refine_note.sh` | per intervention | Intervention output | `cache/FAILURE_LEDGER.md` (PREEMPTIVE row) + `cache/refine/INTERVENTION_LOG.md` |
| E | `agents/refine_evolution.md` | `scripts/refine_evolve.sh` | quarterly OR on pattern-recurrence ≥ 3× | INTERVENTION_LOG over time | `cache/refine/PROPOSALS/<date>_<name>.md` |

### Existing agents within REFINE

| Existing | Role |
|---|---|
| **Controller** | Orchestrates the 6-step cycle; schedules; ensures all steps fire |
| **Verifier** | Each step's artifact present + well-formed? |
| **Validator** | Intervene step: does the fix actually address what Extract surfaced? |
| **QC** | Evolve step: does proposed protocol change cite specific patterns? Anti-rubber-stamp on "evolution theatre". |
| **Meta-Verifier** | Audits the cycle itself — all 6 steps fired? Any skipped? |

---

## 🗓️ CADENCE

| Cadence | Steps | Trigger | Where wired |
|---|---|---|---|
| Per-output (existing) | V → VL → QC → MV | every commit | `.githooks/pre-commit` |
| **Weekly (NEW)** | R → E → F → I → N | Saturday 8 AM | Task Scheduler / cron |
| **Quarterly OR on pattern-recurrence (NEW)** | Evolve | pattern returns 3+ times after intervention | Task Scheduler / event-driven |
| On-demand | Any step | Alan: `/refine` slash command (future) OR `bash scripts/refine_<step>.sh` direct | Manual |

---

## 💾 NEW CACHE FILES

| Path | Purpose | Append-only? |
|---|---|:-:|
| `cache/refine/REVIEW_<date>.md` | Weekly review output | new file per week |
| `cache/refine/EXTRACT_<date>.md` | Pattern extracts | new file per week |
| `cache/refine/FORESEE_<date>.md` | Predictions priority-tagged | new file per week |
| `cache/refine/INTERVENTION_LOG.md` | Master append-only log of every preemptive fix | ✅ append-only |
| `cache/refine/PROPOSALS/<date>_<name>.md` | Per-evolution proposal docs (Alan reviews + approves) | new file per proposal |

The `INTERVENTION_LOG.md` is the **proof-of-self-improvement** artifact. When it has 10+ rows, that's evidence the system is genuinely self-perfecting.

---

## 🆕 NEW FAILURE_LEDGER ENTRY TYPE

Today: `REPEAT` (user asked 2+ times) and `FAILURE` (single occurrence detected).

REFINE adds: **`PREEMPTIVE`** — "predicted by REFINE step F before user noticed; fix applied at step I; this entry documents the catch."

Format:

```
<details>
<summary><b>F.X — <pattern name> [PREEMPTIVE × N, caught by REFINE before manifest] — ✅ FIXED <date></b></summary>

- **Type:** PREEMPTIVE (caught by SP.20 REFINE before user-visible failure)
- **Predicted by:** F (Foresight) — `cache/refine/FORESEE_<date>.md`
- **Intervention:** I (Intervene) — <description of preemptive fix> — `cache/refine/INTERVENTION_LOG.md` row N
- **Confirmed prevented:** <how we know the predicted failure didn't happen>
- **Lesson:** <if pattern recurs 3+ times, escalate to E (Evolve) for protocol change>
</details>
```

---

## 🔄 RELATIONSHIPS TO EXISTING PROTOCOLS

| Protocol | How REFINE uses it |
|---|---|
| **SP.9 FE** (Foresight Engine — reference-only today) | REFINE step F finally invokes SP.9 — operationalizes it |
| **SP.17 SIR** (System Improvement Reflection) | Per-output insight surfacing. SIR is INPUT to REFINE step R. |
| **SP.12 HFR** (Honest Failure Report) | Step N writes to FAILURE_LEDGER. HFR's "permanent fix" → "preemptive fix" |
| **SP.18 SSC** (Sync Status Confirmation) | Step I commits + pushes → SSC confirms cross-device propagation |
| **SP.19 GLD** (GOLD-PATH — pending adoption from Aurelius) | When step I or step E proposes a new tool, GOLD-PATH scan is mandatory |
| **EN.1 Output Skeleton** | Each REFINE step's output file uses the skeleton |

REFINE doesn't replace anything. It **operationalizes** the existing protocols on a schedule.

---

## ✅ HOW REFINE WOULD HAVE CAUGHT RECENT MISSES (Retrospective)

| Recent issue Alan caught manually | Step that would have caught it | Confidence |
|---|---|:-:|
| Mermaid source not rendered as visuals | F (Foresight) | 🟢 high |
| Validator-Merged checking APW D-rules not SubSOPs (ghost agents) | E (Extract) | 🟢 high |
| Pulse Check stuck at 5/5 limit while 7-item shipped | E (Extract) | 🟡 medium |
| Quintessence Q.3 same-brain ceiling persistence | F (Foresight) | 🟢 high |
| GOLD-PATH protocol absent | R + E | 🟡 medium (needs cross-repo learning hook) |

**Estimated catch rate: ~80% of recent surfaced gaps.** That's the leverage.

---

## 📦 SHIP CHECKLIST (Use `scripts/add_protocol.sh` In A New Chat)

When ready to ship SP.20:

```bash
# 1. Ship SP.19 GLD first (simpler, proves the script)
bash scripts/add_protocol.sh SP.19 GLD "GOLD-PATH Protocol" "Reach for gold-standard solution first; deviation requires explicit constraint citation"

# 2. Then ship SP.20 REF
bash scripts/add_protocol.sh SP.20 REF "REFINE Protocol" "Weekly self-improvement loop: Review, Extract, Foresee, Intervene, Note, Evolve"

# 3. For SP.20 specifically, also build the 6 agent files + 6 scripts:
#    agents/refine_{reviewer,extractor,foresight,intervention,scribe,evolution}.md
#    scripts/refine_{review,extract,foresee,intervene,note,evolve}.sh

# 4. Create cache/refine/ directory + INTERVENTION_LOG.md seed

# 5. Wire weekly cron / Windows Task Scheduler:
#    Action: bash scripts/refine_review.sh && bash scripts/refine_extract.sh && bash scripts/refine_foresee.sh
#    Trigger: every Saturday 8 AM

# 6. Update bootstrap_verify.sh to expect SP.20 + REFINE cache directory
```

Each script can start as a v1.0 stub (similar to how SP.17 SIR + SP.18 SSC started) — log the run, output a skeleton report, return exit 0. Sophistication grows over time.

---

## 🎯 EXPECTED IMPACT ON QUINTESSENCE SCORE

| Property | Before SP.20 | After SP.20 (estimated) |
|:-:|:-:|:-:|
| Q.1 Closed feedback loops | partial+ (6.5/10) | ✅ full |
| Q.4 Proactive drift detection | NO | ✅ partial (weekly + on-event) |
| Q.8 Failure-to-fix automation | partial (sir_recurrence detects) | ✅ full (intervene step automates) |
| Q.9 Session lifecycle automation | partial | ✅ partial+ (weekly cycle = session lifecycle at slower cadence) |
| **Overall quintessence score** | **6.5 / 10** | **~8.0 / 10** projected |

Single biggest quintessence jump available. Q.3 (same-brain ceiling) and Q.2 (mechanical enforcement full-blocking) are the other large levers — REFINE doesn't directly fix them but **its weekly Evolve step would naturally surface them as proposals.**

---

## 📜 ORIGIN

| Field | Value |
|---|---|
| Trigger | Alan 2026-05-22: "learn and self improve and audit and refine, and proactive problem solve, identify constraints, break points, and optimize and resolve in advance... what can [it] be called?" |
| Naming influences | Aurelius's PROVE-IT + GOLD-PATH mnemonic acronym pattern |
| Agent layer influences | Aurelius's `agents/insight_agent.py`, `bottleneck_agent.py`, `self_optimization_agent.py`, `daily_review_agent.py` |
| Existing protocols composed | SP.9 FE, SP.12 HFR, SP.17 SIR, SP.18 SSC, EN.1, EN.4 |
| Status | **Proposal — ship in new chat** via `add_protocol.sh` per `CONTINUATION_POINTER.md` |
| Effort | L (4-6h to build all 6 scripts + 6 agent files; v1.0 stubs sufficient initially) |

---

*REFINE_PROTOCOL_PROPOSAL.md v1.0 | SP.20 spec | aurelia | 2026-05-22*
