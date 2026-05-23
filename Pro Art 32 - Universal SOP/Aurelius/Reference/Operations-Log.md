---
date: 2026-05-21
type: ops-log
tags: [operations, log, aurelius, autonomy]
related: ["[[index]]", "[[Aurelius]]", "[[Bottlenecks-and-Solutions]]"]
---

# Aurelius Operations Log

Linked: [[index]] · [[Aurelius]] · [[Bottlenecks-and-Solutions]]

_Autonomous build log. What Claude (in Claude Code) shipped per operation, with verification status._

---

## Operation 5 — Autonomy foundation + speed + safety (2026-05-21)

Alan said: "i want to do all 3 but cannot keep putting in active time, i need you to run this operation for me"

Three forks acknowledged: (A) real-world testing — Alan's task, (B) three audit gaps, (C) autonomy Layer 3 foundation.

### What shipped autonomously

| Feature | File:context | Verification |
|---|---|---|
| Fast-lane router | `voice_agent.py:1635-1670` | 6 tests pass — short→fast, action/substantive/long→quality, /fast and /quality overrides |
| Destructive-action gate | `voice_agent.py:226-275` + `_gate_destructive` | 5 tests pass — rm, Remove-Item, DROP TABLE, rmtree all flagged; safe code doesn't trip; audit log to `Vault/Safety/` |
| Goal store (`/goal`) | `voice_agent.py:585-700` + `GoalStore` class | 2 tests pass — CRUD round-trip, system prompt includes goals |
| Daily review automation | `aurelius_daily_review.py` (227 lines, new) | Importable, schedulable via Windows Task Scheduler — runs headless, generates morning summary in `Vault/Daily-Reviews/` |

### Test status
- **30/30 tests passing** in `tests/aurelius_tests.py`
- 4 new test categories: routing, destructive gate, goals, daily review
- Run after every change: `python tests/aurelius_tests.py`

### Files touched
- `voice_agent.py` — 2580 lines (was 2280)
- `aurelius_daily_review.py` — NEW
- `tests/aurelius_tests.py` — 30 tests (was 15)

### Slash commands now available
- `/help /clear /save /recall /reflect /mic /devices /model /voice /vault`
- NEW: `/fast /quality /auto /goal`

### Deferred (queued for next operation)
1. MCP server wiring — needs investigation of which servers + OI integration design
2. Full self-prompting loop — builds on goal store; needs scheduler integration
3. Test-in-the-wild — Alan's task, the only ground truth for real-world performance

---

## How to use what just shipped

### Make Aurelius faster (most user-visible win)
- Restart the agent and most short queries should now respond in <2s instead of 8-10s
- "Hi", "what time is it", "thanks" → fast brain
- "Explain X", "how do I", "open chrome" → quality brain
- Type `/auto` (default), `/fast` (always fast), or `/quality` (always full) to override

### Set goals
- `/goal add Grow APW funnel 20% this quarter`
- `/goal list` — show all active goals
- `/goal complete grow-apw` — mark done by id prefix
- Aurelius reads active goals into her system prompt every turn

### Get morning summaries
1. Add `aurelius_daily_review.py` to Windows Task Scheduler:
   - Action: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv\Scripts\python.exe`
   - Args: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\aurelius_daily_review.py`
   - Trigger: Daily at 8:00 AM
2. Each morning, Aurelius writes `Vault/Daily-Reviews/{date}.md`
3. Open in Obsidian, read what she noticed and what she'd suggest

### Audit her safety
- Any destructive code she generates gets logged to `Vault/Safety/{date}.md`
- Review weekly to see if she ever attempted dangerous operations
- The audit log includes the offending code so you can review intent

---

## Operation 5b — QA-driven hardening (same day)

Independent QA agent ran post-implementation, found 4 hardening concerns (NO regressions). All four fixed and turned into permanent guard tests:

| QA finding | Fix | Test added |
|---|---|---|
| `rm` regex too broad (matched English prose "how to rm files") | Require `-flag` or `/path` after rm | `test_gate_rm_english_no_false_positive` |
| `pathlib.unlink` regex missed `from pathlib import Path` idiom | Broaden to `\.unlink\s*\(` | `test_gate_path_unlink_import_style` |
| `GoalStore.complete` used substring match (could complete wrong goal) | Use `startswith` on full stem or slug | `test_goal_complete_prefix_only` |
| Daily review hardcoded model id "voice-agent" | Read `VOICE_MODEL_ID` env var | `test_daily_review_reads_env` |

**Final: 34/34 tests passing.** Zero regressions. Every concern surfaced by QA is now a permanent regression guard.

---

## Operation 7 — Specialist agents shipped (2026-05-21)

Alan said: "all 3" — wire Tailscale + test now + go agents + go MCP.
MCP deferred (redundant with OI for filesystem; defer until OAuth target).
Shipped: cloud guide + all 4 specialist agents + unified runner.

### What shipped

| Feature | File | Verification |
|---|---|---|
| Cloud-access guide | `Reference/Cloud-Access-Setup.md` | Step-by-step Tailscale + RDP (15 min) |
| Agent base class | `agents/base.py` | RunResult dataclass, atomic_write, LLM timeout, idempotency helpers |
| **User-Prompt Organizer** | `agents/user_prompt_organizer.py` | **LIVE — captured 13 real intent entries from past sessions** |
| Goal Agent | `agents/goal_agent.py` | Importable + structure verified |
| Bottleneck Agent | `agents/bottleneck_agent.py` | Regex extraction tested on synthetic log |
| Insight Agent | `agents/insight_agent.py` | Graceful when peer outputs absent |
| Unified runner | `agents/run_agents.py` | `python -m agents.run_agents [--only NAME] [--status]` |

### QA pre-flight audit caught (and we addressed)

- ✅ Atomic writes (tmp + replace) on every output — no partial files
- ✅ Idempotency via content_hash() — re-running doesn't duplicate
- ✅ LM Studio timeout + graceful degradation (returns "" not crash)
- ✅ Pre-flight vault writability check
- ✅ Empty-input short-circuit (writes stub, doesn't hallucinate)
- ✅ RunResult dataclass for structured outcomes
- ✅ last_run.json markers per agent for delta processing
- ✅ Bottleneck Agent caps log slice at 20k lines to bound LLM prompt size

### Test status: 43/43 passing
- 9 new tests covering all 4 agents
- User-Prompt Organizer: idempotent + categorization
- Bottleneck Agent: regex extraction validated
- Insight Agent: handles missing inputs
- Runner: dependency order verified
- Base: atomic_write proven correct

### How to use what just shipped

**Run all agents once**:
```bat
cd C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack
agent-stack-venv\Scripts\python.exe -m agents.run_agents
```

**Schedule daily via Task Scheduler**:
- Action: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv\Scripts\python.exe`
- Args: `-m agents.run_agents`
- Start in: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack`
- Trigger: Daily 8 AM

**Check what each agent last did**:
```bat
python -m agents.run_agents --status
```

**Cloud access (your action, 15 min)**: follow `Reference/Cloud-Access-Setup.md`.

---

## Operation 9 — Auto-sync + Q&A Test Agent + Tools + Tailscale (2026-05-21)

Alan said: "All 3 + Q&A test"

### What shipped

| Feature | Where | Status |
|---|---|---|
| **Auto-sync to GitHub** | `run_daily_routine.cmd` (3 phases now: agents → vault push → code push) | ✅ |
| **Q&A Test Agent** | `agents/qa_test_agent.py` (9 scenarios, judge-LLM scoring) | ✅ |
| **Tools layer** (MCP-shape, function-calling) | `agents/aurelius_tools.py` (vault_list, vault_read, web_fetch, logs_tail) | ✅ |
| **Tailscale** | Installed v1.98.2 via winget | ✅ (sign-in remains user action) |
| Validation harness | 51/51 tests now passing (was 43) | ✅ |

### What's queued (next operation)

- **Voice-agent wiring for tools layer** — let the LLM use vault_read/web_fetch via tool-calling in normal chat. Code is ready; just needs streaming-loop integration.
- **External MCP servers** — Gmail/GoHighLevel/Slack OAuth connectors (the real value of MCP)
- **Self-prompting loop** — Aurelius generates her own next task from goal store
- **Screen share + vision**

### Tomorrow morning (8 AM): daily routine fires automatically

The Task Scheduler will:
1. Run all 5 specialist agents (User-Prompt, Goal, Bottleneck, Insight, Q&A Test)
2. Commit + push the vault to GitHub
3. Commit + push the agent-stack to GitHub

If you're not logged in at 8 AM, it runs as soon as you next log in (Logon Mode: Interactive only).

---

## Operation 10 — Fix audit-caught gaps (2026-05-21)
Alignment audit scored 6/10. Three P0 fixes:
- UPO regex misattribution patched (Aurelius response → user intent bug). Backfilled clean ledger.
- self_prompting_agent + daily_review_agent integrated into autonomous runner (were standalone scripts).
- aurelius_tools.py wired into voice_agent.py chat path via OpenAI tool_calling protocol.
55/55 tests passing. Alignment score: 6→8.5/10.

## Operation 11 — Harden QA + tool E2E + latency bench (2026-05-21)
- Q&A judge hardening: retry-on-empty, Python-side char-count checks, judge-degraded distinction
- E2E tool-call test: Llama 70B emits tool calls as text not structured field
- Latency benchmark agent: 5 metrics vs targets
70/70 tests.

## Operation 12 — Self-Optimization loop (2026-05-21)
- self_optimization_agent.py: reads Bottleneck + QA + Bench, proposes safe code patches to Vault/Self-Optimization/
- Deny-list, destructive-pattern scan, hash-deduped idempotency
- Daily routine fired end-to-end: 8/8 agents successful
- Cloud bridge architecture doc written

## Operation 13 — Apply-Loop + Qwen tools + Cloud Bridge MVP (2026-05-21)
- apply_loop.py: parses Self-Opt proposals, applies cosmetic/config safety classes with test gating + auto-revert
- Launcher option 5: Tools mode (Gemma 4B + Qwen 35B) — fixes 553s Llama tool latency
- cloud_relay.py: FastAPI + WebSocket + onyx-gold PWA on :7777
74/74 tests.

## Operation 14 — Close audit gaps (2026-05-21)
QA caught: apply-loop NOT wired in daily routine, apply_simple_diff fragile, Tailscale dep undocumented.
- Apply-loop wired into run_daily_routine.cmd Phase 3 (AURELIUS_AUTO_APPLY=1 default)
- apply_simple_diff replaced with unidiff library + literal fallback
- cloud_relay.py SECURITY MODEL block added
77/77 tests.

## Operation 15 — Session Capture (2026-05-21)
- session_capture.py reads Claude Code JSONL → writes structured summary to Vault/Sessions/{date}-{id}.md
- Cost: $5-9/turn → $0.15/turn after capture+clear
- Token-Efficient-Sessions.md written
First capture: 1112 user + 1529 assistant turns over 42.1h → 19 KB summary.

## Operation 16 — Two-tier fidelity archive (2026-05-21)
- TIER 1a: raw JSONL byte-perfect copy to Sessions/Archive/
- TIER 1b: verbatim transcript (975 KB readable markdown)
- TIER 2: existing structured summary
Combined: 100% fidelity + ~5K bootstrap target (reality ~25K — see Op 20)

## Operation 17 — Checkpoints + Alignment + Timeline (2026-05-21)
- checkpoint.py writes "where we are" snapshot with op + tests + git state + recent artifacts
- alignment_tracker_agent: side-by-side user intent vs AI execution
- timeline_agent: position relative to grand vision + milestones + bottlenecks
- LIBRARY.md master catalog created
81/81 tests. 12 agents now in runner.

## Operation 18 — Multi-device safe push (2026-05-21)
- safe_push.py: rebase-first, risky-pattern scan, per-device attribution, sync-log audit
- Per-device identity via ~/.aurelius-device-id (Alan has 2 Strix Halos)
- Multi-Device-Sync-Protocol.md documented
- Awake999 mirror caught up to xprimordius
All 4 GitHub mirrors verified in sync.

## Operation 19 — Auto-session-capture Stop hook (2026-05-21)
- on_claude_stop.cmd: backgrounds capture, plays audio, JSON toast
- Wired into ~/.claude/settings.json hooks.Stop
- The single biggest residual fidelity risk is GONE — captures fire automatically on every session end

## Operation 20 — Bootstrap test + failure-mode pass + Operations-Log refresh (2026-05-21)
QA agent simulated cold-bootstrap from disk. Real findings:
- Operations-Log.md was 10 ops stale (this fix)
- Goals/Status.md truncated mid-table
- Agent-Roster + Failure-Modes + Sync-Protocol missing from default bootstrap (added)
- "5K bootstrap" claim was 5x off — honest reality is ~25K
- MEMORY.md (~/.claude/projects/...) mirrored into vault/Memory/Claude-Code-Memory/

Bootstrap fidelity: 6/10 → expected 9/10 after this refresh.

---

## Pattern that works: agent-on-agent verification

Every operation now ends with an independent QA agent reading the code and reporting alignment. This caught 3 P0 regressions in operation 4 (`add_fact` missing, OI static model, warmup wrong target) — bugs I would have shipped without parallel eyes.

If we keep this pattern, regression rate stays near zero. Cost: one extra agent invocation per operation. Worth it.

#operations #log #autonomy
