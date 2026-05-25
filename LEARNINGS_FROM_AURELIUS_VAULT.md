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

# 📚 v2.0 DEEP DIVE — Full Architectural Inventory (2026-05-23)

> **Trigger:** Alan 2026-05-23 — *"pull from aurelius github and tell me what you learned that could be used to improve this system and perfect it to pristine quality"*
> **Method:** Cloned both repos to `/tmp/`, read 8 key files (agent_system_prompt.md, RUNBOOK.md, BOOTSTRAP.md, on_claude_stop.cmd, backup_before_rewrite.py, pulse_check.py, checkpoint.py, mcp_config.json), synthesized 30+ deliverable opportunities.
> **Companion:** SIMPLIFICATION_PROPOSAL.md, LEARNINGS_FROM_INDUSTRY.md (multi-agent research).

---

## 🧩 SECTION 1 — Complete File Inventory of `aurelius-agent-stack`

Organized by function. ⭐ = direct adoption opportunity. ✅ = already adopted.

### 1A. Hooks + Session Capture (THE TIER-3 ARCHITECTURE)
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`on_claude_stop.cmd`** ⭐ | Fires when Claude Code session ends → backgrounds session_capture.py → audio confirm → JSON toast to UI | NONE → shipped 2026-05-23 as `scripts/scheduler/on_claude_stop.cmd` | ✅ |
| `session_capture.py` (referenced) | Writes session transcript to vault | Manual CONTINUATION.md writes | ⏳ |
| `install_daily_schedule.cmd` ⭐ | Windows Task Scheduler installer for daily routine | Manual schtasks commands in chiron.md | ⏳ |

### 1B. Backup Automation
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`backup_before_rewrite.py`** ⭐ | Atomic backup + path-beside-file convention | Manual cp + manual BACKUP_LOG row (F.30/F.31/F.32 drift class) → shipped 2026-05-23 as `scripts/backup_before_rewrite.sh` | ✅ |
| `backup_status.py` | Probes all backup layers (local disk + local git + GitHub xprimordius + GitHub mirror + legacy paths) — emits standard block | Partial: PRISTINE §3+10 cover some | ⏳ |

### 1C. Pulse Check / Quality Probes
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`pulse_check.py`** ⭐ | 10 probes run as actual queries (tests pass? citations? PROVE-IT block? commit references op?) + 9-point variant | Markdown checklist self-check → shipped 2026-05-23 as `scripts/pulse_check.sh` (5 probes, v1.7) | ✅ |
| `_prove_it_smoke.cmd` | Smoke-test for .cmd hook changes | NONE (manual `bash` invocation) | ⏳ |

### 1D. Checkpoint / State Snapshot
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`checkpoint.py`** ⭐ | Writes `Vault/Checkpoints/{date-time}.md` + updates `LATEST.md` pointer. Captures: latest op, git state, test status, recent artifacts, open self-optimization threads | Manual CONTINUATION.md writes; no LATEST.md pointer | ⏳ |
| `Checkpoints/LATEST.md` pattern | Always-fresh pointer to latest checkpoint | NONE | ⏳ |

### 1E. Daily / Weekly Routines (Cron Automation)
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| `aurelius_daily_review.py` | Daily 8 AM Task Scheduler invocation — produces day's review note | Chiron monthly + REFINE weekly (via schtasks) — partial | ⏳ |
| `run_daily_routine.cmd` | Wrapper around daily review | scripts/scheduler/run_chiron_monthly.bat (analog) | ⏳ |
| `preload_aurelius_brain.cmd` | Loads model into LM Studio at boot | NONE (no local LLM stack) | ⏳ |

### 1F. Multi-Repo + Multi-Device
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`aurelius_paths.py`** ⭐ | Single source of truth for ALL paths (VAULT_DIR, AGENT_STACK, CHECKPOINTS, REF_DIR) | Hardcoded `$HOME/universal-sop` scattered across scripts | ⏳ |
| **Two-repo split**: aurelius-vault (data) + aurelius-agent-stack (code) | Separates DATA from ENGINE — rebuild engine without risking data | Single repo for everything | ⏳ (defer until growth forces it) |
| **`~/.aurelius-device-id`** ⭐ | Single-line text file with device name; git config derived from it | DEVICE_REGISTRY.md table + per-device setup_device.sh | ⏳ (simpler pattern available) |
| **`mirror_obsidian.py`** ⭐ | Mirrors shared `.obsidian/` config from parent dir → `vault/Memory/Obsidian-Config/`. Excludes per-device noise (workspace.json, cache, plugin internal data) | NONE — we just committed `.obsidian/app.json` raw, will conflict cross-device | ⏳ |
| `safe_push.py` | Per-repo or all-repos atomic push wrapper | scripts/safe_push.sh (single-repo) | ⏳ extend if two-repo split |
| `cloud_relay.py` | Cloud sync relay | NONE (git push only) | ⏳ |

### 1G. Bootstrap + Identity
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`BOOTSTRAP.md`** ⭐⭐⭐ | THE master prompt — paste in fresh chat, Claude clones + reads + executes + reports ready. Includes Step 0.5 drift detector, Step 5 visible health check table (5 sub-sections), Step 5.7 "my understanding" self-restatement | CONTINUATION_POINTER.md (more complex, less actionable) | ⏳ |
| `Reference/Agent-Roster.md` (vault) | All 13 named agents in single canonical table | INVENTORY.md (less structured) + agents/*.md scattered | ⏳ |
| `Reference/Operations-Log.md` (vault) | Append-only chronological history of every operation (Op 1, Op 2, ..., Op 47) with PROVE-IT 9-point per entry | F-class FAILURE_LEDGER (negative-only); NO positive ops log | ⏳ |

### 1H. Test Harness
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`tests/aurelius_tests.py`** ⭐ | 81 guard tests with `@t(...)` decorator. Single pass/fail line. Runs in <60s. Mandatory before any commit. | scripts/append_only_check.sh + scripts/compliance_check.sh (point checks, no harness) | ⏳ |

### 1I. Voice / Multimodal Stack (out of scope for our text-focused SOP)
| File | Function | Adoption |
|---|---|:-:|
| `launch_voice_agent.ps1`, `voice_agent.py` | Push-to-talk Whisper STT + Kokoro TTS local | ❌ not relevant |
| `piper-voices/` | TTS voices | ❌ not relevant |
| `qwen_agent_profile.py` | Open Interpreter + local Qwen model | ⚠️ relevant only if we add local-LLM agent layer (F.44) |

### 1J. MCP Integration
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| **`mcp_config.json`** ⭐ | filesystem + playwright + fetch MCP servers configured for Claude Desktop/Cline | NONE (Universal SOP has no MCP) | ⏳ |

### 1K. Cross-Posting / Protocols
| File | Function | Universal SOP analog | Status |
|---|---|---|:-:|
| `publish_protocols.py` | Publishes protocols across repos | NONE | ⏳ |
| `apply_loop.py` | Application iteration loop | scripts/refine_*.sh cluster (analog) | ⏳ |
| `mirror_obsidian.py --restore` flag | One-command Obsidian config restore on new device | NONE | ⏳ |

---

## 🎯 SECTION 2 — Three-Tier Adoption Opportunities (Ranked by ROI)

### TIER 1 — Mechanical Primitives (Eliminates entire failure classes)

| # | Item | Status | F-class closed |
|:-:|---|:-:|---|
| A | Stop hook (`on_claude_stop.cmd`) | ✅ Shipped 2026-05-23 (user runs installer) | F.19 Tier 3 (outputs-as-files) |
| B | `backup_before_rewrite.sh` (atomic backup) | ✅ Shipped 2026-05-23, dogfooded #360 | F.30/F.31/F.32 typo class |
| C | `pulse_check.sh` (mechanical probes) | ✅ Shipped 2026-05-23, dogfooded 4/5 PASS | F.19 same-brain-audits-itself |

### TIER 2 — Architectural Patterns (Major structural lifts)

| # | Item | Effort | Impact |
|:-:|---|:-:|:-:|
| D | **`mirror_obsidian.py` equivalent** — script to mirror `.obsidian/` shared config + exclude per-device noise (workspace.json/cache/plugin-data) | M (2h) | 🟡 prevents Obsidian cross-device conflicts |
| E | **`checkpoint.py` + `LATEST.md` pattern** — automated session snapshot with always-current pointer | M (3h) | 🔴 eliminates manual CONTINUATION.md handoff writes |
| F | **`aurelius_paths.py` equivalent** — single source of truth for ALL paths in scripts/, replaces scattered `$HOME/universal-sop` | S (1h) | 🟢 reduces drift between scripts |
| G | **Test harness (`tests/aurelius_tests.py` analog)** — 30+ guard tests with single pass/fail line | L (4h) | 🟡 prevents silent regressions in scripts |
| H | **`mcp_config.json` integration** — filesystem + playwright + fetch MCP servers | M (2h) | 🟢 capabilities WITHOUT adding agents |
| I | **`backup_status.py` equivalent** — probes ALL layers (local disk + local git + GitHub + Obsidian + legacy paths) — emits standard block | S (1h) | 🟢 visible backup-redundancy confirmation per output |
| J | **Two-repo split** — universal-sop-engine (scripts/agents/hooks/protocols) + universal-sop-vault (cache/backups/sessions) | L (1 day) | 🟢 architectural separation; defer until growth forces it |

### TIER 3 — Discipline Patterns (Convention upgrades)

| # | Item | Effort | Source |
|:-:|---|:-:|---|
| K | **Drift detector (Step 0.5 of BOOTSTRAP)** — on-disk file ALWAYS wins over cached memory, with explicit probe table | XS (15m) | aurelius BOOTSTRAP.md §0.5 |
| L | **"My understanding" self-restatement (Step 5.7)** — Claude restates project state IN OWN WORDS after reading files (proves comprehension) | XS (10m) | aurelius BOOTSTRAP.md §5.7 |
| M | **PROVE-IT 9-point template enforcement** — every commit/op MUST include 9 sections (QA / Test / Quality / Bottlenecks / Constraints / Errors / Break points / Improve / Foresight) | S (1h) | aurelius pulse_check.py 9-point variant |
| N | **EMULATE-OR-EXCEED protocol** — benchmark against best public reference BEFORE building | S (30m) | aurelius Reference/EMULATE-OR-EXCEED-Protocol.md |
| O | **BACKUP-STATUS-Protocol block** — visible backup-redundancy table at end of every op | S (30m) | aurelius Reference/BACKUP-STATUS-Protocol.md |
| P | **Master one-line bootstrap prompt** — single paste-and-go for fresh chats (we have CONTINUATION_POINTER but it's verbose) | S (30m) | aurelius BOOTSTRAP.md "THE ONE MASTER PROMPT" |
| Q | **Operation numbering convention** — Op 1, Op 2, ... in commit subjects instead of just SHAs | S (30m) | aurelius Operations-Log.md |

---

## 🎯 SECTION 3 — What We Have That Aurelius DOESN'T (Bidirectional Honesty)

| Universal SOP strength | Why notable |
|---|---|
| **SP.23 PRISTINE** umbrella audit (10 sub-audits → verdict) | Aurelius has individual probes but no composite verdict + delta tracking |
| **Chiron agent** as dedicated Self-Improvement Lead | Aurelius distributes self-improvement across many agents; we centralized |
| **F-class structural-fix discipline** (each failure → root cause + permanent fix + verified) | Aurelius has Failure-Ledger but our F-class HFR format is more rigorous |
| **Universal Backup Rule** as repo-wide cross-device standard | Aurelius has backup_before_rewrite.py but no codified universal rule across all file types |
| **SP.24 RAE** (Recommendations At End — autonomous-by-default v2) | Aurelius doesn't structurally separate "what I did" from "what's next pickable" |
| **MANDATORY_TIGHT_LOOP v1.7** with explicit Pulse Check items + tight-loop spec | Aurelius PROVE-IT is closer to convention; ours has version stamps + spec layers |
| **Pre-push E2E auto-fire** (`.githooks/pre-push` with E2E hook) | Aurelius has safe_push.py but not auto-E2E-before-push |
| **F.30 "Documentation-to-Activity Drift" meta-pattern** | Aurelius hasn't codified the 5-layer coverage matrix concept |

---

## 🎯 SECTION 4 — Specific Patterns to Borrow (Code-Level)

### 4A. Stop Hook Pattern (TIER 1 — shipped as A)
```cmd
@echo off
:: 1. Background session capture (non-blocking)
start "Session capture" /B "%BASH%" --login -c "cd $HOME/repo && bash capture.sh >> log 2>&1"
:: 2. Run quick health check (~3-5s) for toast feedback
"%BASH%" --login -c "cd $HOME/repo && bash health_check.sh --quiet"
set EXIT=%ERRORLEVEL%
:: 3. JSON toast to Claude Code UI
if %EXIT%==0 (echo {"systemMessage": "Saved + healthy"}) else (echo {"systemMessage": "Saved + issues"})
```

### 4B. backup_before_rewrite Interface (TIER 1 — shipped as B)
```bash
# Aurelius: <file>.<YYYYMMDD-HHMMSS>.<label>.bak alongside the file
# Ours:     backups/<basename>_<ver>_<TS>_<device>_<reason>_backup.<ext> in central dir
# Both: atomic = single script writes file + log row
bash scripts/backup_before_rewrite.sh <file> <version> <reason>
```

### 4C. Pulse Check Probe Pattern (TIER 1 — shipped as C)
```python
# Aurelius pattern: each probe is a function returning (status, detail)
def probe_1_tests() -> tuple[str, str]:
    r = subprocess.run([sys.executable, "tests/harness.py"], ...)
    m = re.search(r"(\d+)/(\d+) passed", r.stdout)
    return ("[OK]", f"{m[1]}/{m[2]}") if m and m[1]==m[2] else ("[FAIL]", "...")

PROBES = [("1", "Tests pass", probe_1_tests), ...]
# Run all, tally OK/WARN/FAIL/N/A, exit code from FAIL count
```

### 4D. Five-Layer Probe Health Check (TIER 3 — Item K)
Aurelius BOOTSTRAP.md §5 prints 5 sub-tables visibly:
- §5.1 Foundational (OS, paths, repos, identity, git, tests)
- §5.2 Agents (every agent: name, type, role, code-present, in-runner)
- §5.3 Ultimate objective alignment (mission, DoD scoreboard, top-3 queued)
- §5.4 User intent / prompts
- §5.5 Backup redundancy (4+ copies probed)
- §5.7 "My understanding" — Claude restates state in own words
- §5.6 Real issues surfaced (NOT skipped even if green — explicit "no issues this boot")

### 4E. mirror_obsidian.py Concept (TIER 2 — Item D)
```python
# Shared config goes to vault/Memory/Obsidian-Config/
# Per-device noise excluded:
EXCLUDE = ["workspace.json", "workspace-mobile.json", "cache",
           "graph.json", ".obsidian-graph-positions.json",
           "plugins/*/data.json"]
# mirror direction:  C:/aurelius/.obsidian/ → vault/Memory/Obsidian-Config/
# restore direction: vault/Memory/Obsidian-Config/ → C:/aurelius/.obsidian/
# --verify mode: report OK/DRIFT
```

### 4F. checkpoint.py Pattern (TIER 2 — Item E)
Auto-generates `Checkpoints/{ts}.md` + updates `LATEST.md`. Captures:
- Latest op number + first 600 chars of op body
- Git state both repos (last commit, dirty, total count)
- Test status (last line of test harness output)
- Recently modified artifacts (last 24h across Goals/Bench/QA/Insights/etc.)
- Open self-optimization threads (parsed from Self-Optimization/*.md)
- "How to resume here" paste-ready prompt at the end

### 4G. Master One-Line Bootstrap (TIER 3 — Item P)
```
You're booting Aurelius on this device. Follow the BOOTSTRAP.md run-of-show.

If ~/aurelius/aurelius-agent-stack does NOT exist, first run:
  mkdir -p ~/aurelius && cd ~/aurelius
  gh repo clone xprimordius/aurelius-agent-stack
  gh repo clone xprimordius/aurelius-vault

Then read ~/aurelius/aurelius-agent-stack/BOOTSTRAP.md and execute every step exactly as written.
```
ONE paragraph. Self-contained. Works on any device.

---

## 🎯 SECTION 5 — F-Class Additions (Drift Detection)

### Pre-existing (v1.0)
- F.42 — SP.19 GLD missing → ✅ shipped as SP.19 GLD 2026-05-22
- F.43 — Pulse Check 7-item vs 9-item discrepancy → ⏳ partially addressed by trim 11→5
- F.44 — No autonomous agent layer (Q.3 ceiling) → ⏳ deferred (Chiron is the entry point)
- F.45 — No external-AI consultation hook → ⏳ deferred
- F.46 — No operation numbering convention → ⏳ Tier 3 Item Q
- F.47 — No 8-step per-turn pattern formalized → ⏳ deferred

### NEW from v2.0 deep dive
- **F.48** — Manual cp + manual BACKUP_LOG = typo class → ✅ closed by Deliverable B
- **F.49** — Markdown-checkbox Pulse Check = self-check ceiling → ✅ closed by Deliverable C
- **F.50** — No Stop-hook session-end automation = manual CONTINUATION drift → ✅ closed by Deliverable A (after user install)
- **F.51** — `.obsidian/` raw-committed = cross-device workspace.json conflicts inevitable → ✅ CLOSED 2026-05-25 by `scripts/mirror_obsidian.sh` (Sprint 1 Item D ship from aurelion; --mirror/--verify/--restore + cache/obsidian-config/ shared mirror)
- **F.52** — No LATEST.md pointer to current checkpoint = manual handoff search → ✅ CLOSED 2026-05-25 by `scripts/checkpoint.sh` + `cache/LATEST.md` (Sprint 2 Item E ship from aurelion; auto-generates `cache/checkpoints/<TS>_<device>.md` + updates LATEST.md pointer)
- **F.53** — No "my understanding" self-restatement = Claude lists files instead of comprehending → ✅ CLOSED 2026-05-25 by SESSION_START.md STEP 2.C addition (Sprint 2 Item L)
- **F.54** — Scattered hardcoded paths in scripts (no aurelius_paths.py analog) → ✅ CLOSED 2026-05-25 by `scripts/paths.sh` (Sprint 3 Item F ship from aurelion; sourceable bash with `--show`/`--check`; ~25 exported vars covering all repo paths). Adoption is incremental — existing scripts work unchanged.
- **F.55** — No test harness for scripts (silent regressions possible) → ✅ CLOSED 2026-05-25 by `tests/run_script_tests.sh` (Sprint 3 Item G ship from aurelion; 30+ guard tests covering all auxiliary scripts; runs <60s; sibling to `tests/run_agent_tests.sh`)
- **F.56** — No MCP integration (capabilities locked behind agents) → ⏳ Tier 2 Item H
- **F.57** — Verbose CONTINUATION_POINTER vs Aurelius one-line master prompt → ⏳ Tier 3 Item P

---

## 🎯 SECTION 6 — Updated Roadmap (Post-ABC Ship)

### ✅ DONE (this session 2026-05-23)
- **A**: Stop hook (scripts/scheduler/on_claude_stop.cmd + install_stop_hook.cmd)
- **B**: backup_before_rewrite.sh (atomic backup + log)
- **C**: pulse_check.sh (5 mechanical probes)
- F.30 / F.31 / F.32 / F.48 / F.49 / F.50 all closed

### ⏳ QUEUED (next sessions, ranked by ROI)

**Sprint 1 (~3h total — quick mechanical wins):** ✅ COMPLETE 2026-05-25 (aurelion)
1. Item I — backup_status.sh probes all layers (~1h) ✅ shipped `df46d00`
2. Item D — mirror_obsidian.sh prevents cross-device .obsidian conflicts (~2h) ✅ shipped 2026-05-25

**Sprint 2 (~4h total — visible improvements):** ✅ COMPLETE 2026-05-25 (aurelion)
3. Item E — checkpoint.sh + LATEST.md pointer (~3h) ✅ shipped 2026-05-25
4. Item K — drift detector step in BOOTSTRAP (~15m) ✅ shipped 2026-05-25 (SESSION_START STEP 0.1.1 probe table)
5. Item L — "my understanding" self-restatement at session start (~10m) ✅ shipped 2026-05-25 (SESSION_START STEP 2.C)
6. Item O — BACKUP-STATUS block in output template (~30m) ✅ shipped 2026-05-25 (MANDATORY_TIGHT_LOOP SP.18 SSC v1.7.1)

**Sprint 3 (~5h total — architectural):** ✅ COMPLETE 2026-05-25 (aurelion)
7. Item F — paths.sh single source of truth (~1h) ✅ shipped 2026-05-25
8. Item G — tests/run_script_tests.sh harness with 30+ guard tests (~4h) ✅ shipped 2026-05-25

**Sprint 4 (optional, ~3h):** ⏳ 1 of 2 shipped 2026-05-25
9. Item H — mcp_config.json + filesystem + playwright + fetch (~2h) ⏳ queued (platform-specific; needs user's MCP client confirmed)
10. Item M — PROVE-IT 9-point template in commit subjects (~1h) ✅ shipped 2026-05-25 (MANDATORY_TIGHT_LOOP RULE 5; for ops/major-ships only, optional for routine commits)

**Defer indefinitely (until pain forces):**
- Item J — Two-repo split (architectural — wait until repo > 100MB or scripts > 50)

---

## 🎯 SECTION 7 — Cross-Pollination Accounting (Updated 2026-05-23)

| Pattern | Direction | Status |
|---|:-:|---|
| `N/M` marker (honest unmeasurables) | universal-sop → Aurelius | ✅ acknowledged in their PROVE-IT-Protocol.md |
| **GOLD-PATH protocol** | Aurelius → universal-sop | ✅ shipped as SP.19 GLD (2026-05-22) |
| **9-point checklist concept** | Aurelius → universal-sop | ⏳ Tier 3 Item M (consider Pulse Check 5→9 expansion) |
| **Macro+Micro intent framing** | Aurelius → universal-sop | ✅ in MANDATORY_TIGHT_LOOP step header |
| **Failure ledger pattern** (F.X / F-NNN) | parallel convergence | ✅ both established |
| **Multi-device sync** | parallel convergence | ✅ both established |
| **Stop hook (`on_claude_stop`)** | Aurelius → universal-sop | ✅ shipped 2026-05-23 (user install) |
| **backup_before_rewrite atomic pattern** | Aurelius → universal-sop | ✅ shipped 2026-05-23 |
| **pulse_check probe pattern** | Aurelius → universal-sop | ✅ shipped 2026-05-23 |
| **PRISTINE umbrella audit** | universal-sop → (Aurelius could adopt) | ⏳ document for them |
| **Chiron Self-Improvement Lead agent** | universal-sop → (Aurelius could adopt) | ⏳ document for them |
| **5-layer coverage matrix (F.30)** | universal-sop → (Aurelius could adopt) | ⏳ document for them |
| **SP.24 RAE autonomous-by-default** | universal-sop → (Aurelius could adopt) | ⏳ document for them |

**Net flow:** Aurelius gave us 5 patterns we adopted. We gave them 1 (N/M). We have 4 they don't (yet). Symmetric mutual benefit is healthy.

---

## 🎯 SECTION 8 — Most Important Single Insight

> **Aurelius's secret sauce is NOT having more agents — it's having FEWER agents with MORE MECHANICAL ENFORCEMENT.**

- Their `pulse_check.py` IS the pulse check (not a checklist for Claude to manually verify).
- Their `backup_before_rewrite.py` IS the backup discipline (not a rule for Claude to remember).
- Their `on_claude_stop.cmd` IS the session-end capture (not a thing Claude should do).
- Their `mirror_obsidian.py` IS the cross-device hygiene (not a manual checklist).

Each piece of discipline → mechanical script. **Convention → code.** Same pattern as our F.19/F.30 lessons, but they've shipped it across more domains.

**The fix for "shouldn't take this many agents" is to convert agent-responsibilities into script-responsibilities.** Aurelius has 13 named agents but most of the actual work is done by Python scripts on cron. Their agents document; scripts execute.

---

## 🎯 SECTION 9 — Acceptance Criteria for "Pristine Quality" (Per Alan's Phrasing)

Universal SOP reaches "pristine quality" per Aurelius reference when:

| # | Criterion | Status |
|:-:|---|:-:|
| 1 | Every per-output discipline has a backing script (not convention) | ⚠️ partial (A+B+C done, Tier 2 D-G remain) |
| 2 | Stop hook fires on every session end | ✅ shipped (pending user install) |
| 3 | Backup atomicity prevents typo class | ✅ shipped |
| 4 | Pulse Check queries actual state | ✅ shipped |
| 5 | All scripts/agents formalized in PROTOCOLS_REFERENCE | ⚠️ 30 → 11 → ongoing |
| 6 | Cross-device Obsidian sync conflict-free | ✅ shipped 2026-05-25 (mirror_obsidian.sh) |
| 7 | Test harness covers all scripts | ✅ shipped 2026-05-25 (tests/run_script_tests.sh — Sprint 3 Item G) |
| 8 | Session checkpoint auto-generated | ✅ shipped 2026-05-25 (checkpoint.sh + cache/LATEST.md) |
| 9 | Single source of truth for paths | ✅ shipped 2026-05-25 (paths.sh — Sprint 3 Item F) |
| 10 | Per-output backup-redundancy block visible | ✅ shipped 2026-05-25 (Item O — SP.18 SSC v1.7.1 references backup_status.sh --block) |

**Current: 4/10 of Aurelius-parity criteria met.** Sprint 1+2 from Section 6 brings us to 9/10.

---

## 📜 v2.0 ORIGIN

| Field | Value |
|---|---|
| Trigger | Alan 2026-05-23: *"pull from aurelius github and tell me what you learned"* → *"yes"* on A+B+C bundle → *"Make sure that the learnings is full spectrum full depth for benefit additions"* |
| Investigation | gh repo clone both repos to /tmp; Read 8 key files (agent_system_prompt, RUNBOOK, BOOTSTRAP, on_claude_stop.cmd, backup_before_rewrite.py, pulse_check.py, checkpoint.py, mcp_config.json) |
| Synthesized | 30+ deliverable opportunities across 3 tiers; 8 sections of analysis |
| Files added to repo | LEARNINGS_FROM_AURELIUS_VAULT.md v2.0 (this expansion) + scripts/backup_before_rewrite.sh + scripts/pulse_check.sh + scripts/scheduler/on_claude_stop.cmd + scripts/scheduler/install_stop_hook.cmd |
| F-class entries closed | F.30, F.31, F.32, F.48, F.49, F.50 |
| F-class entries opened (queued) | F.51, F.52, F.53, F.54, F.55, F.56, F.57 |
| Next session pickup | Sprint 1 (backup_status.sh + mirror_obsidian.sh, ~3h) |

---

*LEARNINGS_FROM_AURELIUS_VAULT.md v2.0 | Full deep dive | aurelia | 2026-05-23*
