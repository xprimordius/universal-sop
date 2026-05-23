---
date: 2026-05-21
type: master-sop
tags: [sop, operations, master, aurelius, claude-code]
related: ["[[index]]", "[[Aurelius]]", "[[Operations-Log]]", "[[Bottlenecks-and-Solutions]]"]
---

# Aurelius Master SOP

The physical execution protocol Claude (in Claude Code) runs every turn.
This is the operating system of how we build and validate Aurelius.

Linked: [[index]] · [[Aurelius]] · [[Operations-Log]] · [[Bottlenecks-and-Solutions]]

---

## 0 · The Vision (macro intent — always frontline)

**Aurelius is a local, free, autonomous AI assistant — every person's personal digital employee.**

Not a chatbot. A 5-star digital staffer that:
- Talks naturally over voice + screen share (Google AI Studio caliber)
- Executes any task on the computer via natural language
- Runs locally on personal hardware (privacy + zero recurring cost)
- Improves itself with every interaction
- Cross-device accessible (cloud-bridged, multi-screen continuity)

**Equivalence target**: Claude / ChatGPT quality on conversation + reasoning, plus screen+voice modalities, plus task execution. **Not** a limitation problem — a build-it problem.

This is the frontline target. Every micro-decision serves this macro.

---

## 1 · Per-Turn Execution Pattern

```
┌─────────────────────────────────────────────────────────────────────┐
│  1. RECEIVE  → Alan's message (voice transcript or typed text)      │
│  2. UNDERSTAND → micro intent (this turn) + macro intent (vision)   │
│  3. RELAY    → SOP checklist BEFORE doing work (multi-item only)    │
│  4. PLAN     → TaskCreate for everything I'll do, in priority order │
│  5. EXECUTE  → batched tool calls, parallel agents where applicable │
│  6. VALIDATE → tests + QA agent dispatch                            │
│  7. PERSIST  → vault artifacts (logs, reflections, audits, SOP)     │
│  8. SUMMARIZE→ what shipped vs queued, with metrics                 │
└─────────────────────────────────────────────────────────────────────┘
```

### 1.1 Receive
Read user message. Note tone, urgency, frustration cues. Multi-item or single?

### 1.2 Understand (micro + macro)
Always hold BOTH levels in mind:
- **Micro**: what does this turn fix or build?
- **Macro**: how does this serve the 5-star digital employee vision?

If micro contradicts macro: flag and ask before acting.

### 1.3 Relay (SOP checklist)
For ANY message with 2+ items, output a table:

| # | Request | What I'll do |
|---|---------|--------------|
| 1 | ... | ... |

Plus: open questions I'll choose sensibly + out-of-scope items being deferred.

This is the alignment contract. Never skip.

### 1.4 Plan
TaskCreate for everything — even sub-steps. Track in_progress → completed.
Tasks are visible to user; they're the live progress bar.

### 1.4.5 GOLD-PATH research (Op 38+)
Before recommending any NEW component (TTS, STT, LLM, vision, embedding, vector DB, framework, agent runtime, tool layer), apply GOLD-PATH Protocol from `Reference/GOLD-PATH-Protocol.md`:
1. Gather top 3 SOTA options today (not what training data defaults to)
2. Observe license, hardware fit, cost, real-world adoption
3. Lead the recommendation with the gold option
4. Deviate only with explicit constraint cited
5. Prove with source link
Render the GOLD-PATH comparison table in the recommendation. Skipping a required scan → F-NNN entry in Failure-Ledger.

### 1.4.6 EMULATE-OR-EXCEED reference scan (Op 42+)
Before BUILDING any new feature/capability or major architectural change, apply EOE Protocol from `Reference/EMULATE-OR-EXCEED-Protocol.md`:
1. **Search** — WebSearch top 3 public projects with this capability (not training-data memory)
2. **Profile** — stack, measured perf, license, limitations per reference; cite URLs
3. **Decide** — pick ONE benchmark; declare "Emulate on axis X, Exceed on axis Y"
4. **Build** — implement with reference architecture as scaffold
5. **Compare** — measure Aurelius result vs reference; verdict in Op closeout

Render the EOE Reference Scan table BEFORE scope is set. Append EOE Compare block to Op writeup AFTER building. Skipping a required scan → F-NNN entry in Failure-Ledger.

**Relationship**: GOLD-PATH picks best COMPONENTS; EOE picks best REFERENCE IMPLEMENTATION to benchmark against. Apply EOE first (architectural pattern), then GOLD-PATH (component choices within that pattern).

### 1.5 Execute
- Batch tool calls in parallel when independent (Read + Grep + Bash together)
- Dispatch agents in parallel with my own coding for QA / audits
- Mark chapters when work phases shift (`mcp__ccd_session__mark_chapter`)
- Use `mcp__ccd_session__spawn_task` to flag side-issues without breaking flow

### 1.6 Validate
- Run `tests/aurelius_tests.py` (currently 34 tests) before declaring "done"
- Dispatch QA agent (general-purpose) for independent code review
- Every concern QA flags becomes a NEW test → permanent regression guard

### 1.7 Persist
Every operation produces these vault artifacts:
- `Conversations/{session}.md` — transcript with frontmatter + wikilinks
- `Daily/{date}.md` — chronological daily note
- `Reflections/{session}.md` — Aurelius's self-critique (when /reflect run)
- `Reference/Operations-Log.md` — append entry for this operation
- `Bottlenecks-and-Solutions.md` — update if perf changed
- `Safety/{date}.md` — append if destructive code detected

### 1.9 Cite-with-substance (no naked acronyms) (Op 43+)
Every time a named protocol, acronym, or shorthand is invoked in conversation or in a writeup, **expand it inline with what it does + the steps it executes.** No exceptions for "we both know what this means."

Specifically — whenever any of these names appear, include a 1-line expansion with the steps:

| Name | Required inline expansion |
|---|---|
| **PROVE-IT** | "PROVE-IT (7-step verification: Pre-flight → Run → Observe → Verify → Evidence → Identify → Test)" |
| **PROVE-IT 9-POINT** | "PROVE-IT 9-POINT (the 9 closeout sections: QA, Test, Quality, Bottlenecks, Constraints, Errors, Break points, Improve/Resolve, Foresight)" |
| **Pulse Check 2.0** | "Pulse Check 2.0 (10-item mechanical gate: tests pass, citations, no fab numbers, foresight, guard tests, real exec, PROVE-IT block, commit ref, sync-log, HFR)" |
| **GOLD-PATH** | "GOLD-PATH (8-step research-SOTA-first: Gather → Observe → Lead → Deviate → Prove → Audit → Track → Honor)" |
| **EOE / EMULATE-OR-EXCEED** | "EOE (5-step reference scan: Search → Profile → Decide → Build → Compare)" |
| **HFR** | "HFR (Honest Failure Report: root cause + permanent fix + proof)" |
| **N/M** | "N/M (Not Measurable — write the reason or provide uncertainty bound)" |
| **9-point gate** | "9-point gate (safe_push refuses vault push if latest op missing the 9 closeout sections)" |
| **F-NNN** | "F-NNN (Failure-Ledger entry — append-only HFR row, never edit prior rows)" |

Long-form responses may set the expansion ONCE in the first reference and then use the short form. Brief responses must expand every time.

Rationale: F-011 (Op 43) — using protocol acronyms as jargon without inline expansion creates ambiguity for user and external AI consultants reading the gist. Cost of expansion: ~10-20 tokens. Benefit: zero ambiguity.

Failure mode if skipped: user/consultant must context-switch to look up the protocol; defeats the purpose of having protocols.

Audit handle: user can say "what's that?" or "expand it" — that's a §1.9 violation flag.

### 1.8 Summarize
Closing report MUST include the **PROVE-IT 9-Point Block** (Op 31+, user-specified). Every op writeup renders the 9 items as visible checkboxes with concrete content:

```
PROVE-IT 9-POINT
[x] 1. QA              — {who/what audited, verdict}
[x] 2. Test            — N/N passing
[x] 3. Quality         — {what got better, concrete}
[x] 4. Bottlenecks     — {issue + file:line, or N/A — reason}
[x] 5. Constraints     — {deps / limits exposed, or N/A — reason}
[x] 6. Errors          — {HFR if any, or N/A — nothing failed}
[x] 7. Break points    — {2-3 specific places that could break}
[x] 8. Improve/Resolve — {fixes shipped, with file:line + SHA}
[x] 9. Foresight       — {2-3 forward-looking risks, queued}
```

If anything failed during the op (item 6 non-empty): also append a new F-NNN row to `vault/Reference/Failure-Ledger.md` with the full HFR (Root cause + Permanent fix + Proof).

Plus the standard wrap-up:
- Checklist of what was asked → status of each
- Files touched + line counts
- What's queued for next operation
- What Alan needs to do (testing, decisions)
- **BACKUP STATUS block** (Op 44+, per BACKUP-STATUS Protocol) — render `python backup_status.py` output showing all 4 redundancy layers (local disk + local git + GitHub remote + public gist) + device ID + op number + restore commands. No silent "trust me, it's backed up." Run brief mode (`--brief`) for short responses; full mode for op closeouts.

---

## 2 · Agent Roster

Claude (me) operates as the **orchestrator**. Specialist agents are dispatched via the Agent tool for parallel work.

### 2.1 Active agents (in rotation)

| Agent | Role | Cadence | Output |
|---|---|---|---|
| **QA Validation Agent** | Reads code, finds regressions vs stated requirements | Every operation, post-implementation | Markdown audit with ✅/⚠️/❌ verdicts |
| **Alignment Audit Agent** | Verifies macro alignment with original mission | Every 3-5 operations | Score 1-10 + gap list |

### 2.2 New agents queued (designed below, implement after Alan shares his SOP)

| Agent | Role | Cadence | Output |
|---|---|---|---|
| **User-Prompt Organizer** | Captures every user statement of intent, categorizes (feature/bug/vision/preference), feeds into validation prompts | Continuous (post-turn) | `Vault/Intent/Master-Intent.md` running ledger |
| **Goal Agent** | Maintains timeline: macro goals + micro milestones, current position, requirements, time estimates | Daily + on /goal events | `Vault/Goals/Status.md` with "you are here" + next milestone |
| **Bottleneck Agent** | Proactively scans for latency, race conditions, error patterns; surfaces and resolves | Weekly + on perf drop | `Vault/Bottlenecks/{date}.md` + auto-suggest fixes |
| **Insight Agent** | Reads conversations + reflections + daily reviews for patterns; surfaces important things | Daily | `Vault/Insights/{date}.md` |

### 2.3 Agent dispatch protocol

When I dispatch an agent:
1. Brief it with self-contained context (no this-conversation references)
2. Tell it specifically what to audit/check/find
3. Set output format expectation
4. Run in background (`run_in_background=true`) when parallel work is possible
5. Surface findings verbatim to Alan + act on them

---

## 3 · Memory Stack (what gets persisted, where)

```
~/.claude/projects/.../memory/        ← Cross-session Claude memory
  MEMORY.md                           ← Index
  user_alan_apw.md                    ← Who Alan is
  hardware_strix_halo.md              ← His machine
  project_local_agent_stack.md        ← This project
  feedback_*.md                       ← Behavioral protocols (SOP alignment, model escalation, etc.)

C:/Users/light/Documents/The Beginning/Aurelius/   ← Obsidian vault
  index.md                            ← Hub note
  Aurelius.md                         ← Human-readable memory
  Memory/master.jsonl                 ← Golden record (append-only)
  Memory/active.json                  ← Cache (rebuildable)
  Conversations/                      ← Per-session transcripts
  Daily/                              ← Per-day notes
  Reflections/                        ← Aurelius's self-critique notes
  Daily-Reviews/                      ← Morning summaries (autonomous)
  Goals/                              ← One file per active goal
  Safety/                             ← Destructive-action audit logs
  Reference/                          ← Bottlenecks, Operations Log, this SOP, etc.
  Intent/                             ← (queued) User-Prompt Organizer output
  Insights/                           ← (queued) Insight Agent output
```

Append-only philosophy: nothing destroys history. Caches are rebuildable from masters.

---

## 4 · Escalation Protocols (already in persistent Claude memory)

### 4.1 Model + effort escalation
Before complex work, surface a **Model check** recommending Sonnet/Opus + Medium/High/Very High/Max effort.
- Routine bug fix → Sonnet 4.6 Medium
- Multi-file refactor → Sonnet 4.6 High
- Stuck after 2+ attempts → Opus 4.6 High
- Architecture / hardest bugs → Opus 4.7 Very High / Max

### 4.2 SOP alignment checklist
For 2+ item requests: relay the table BEFORE acting (see §1.3).

### 4.3 Confirm-before-irreversible
Never delete, send, purchase, or modify config without explicit chat approval. One action per step. Screenshot to verify.

---

## 5 · Validation Harness

`tests/aurelius_tests.py` is the gate. Currently 34 scenarios:
- 4 memory store invariants
- 5 wake / echo / chunking invariants
- 9 progressive-loading / dynamic-model invariants
- 6 fast-lane router scenarios
- 7 destructive-gate patterns
- 3 goal store scenarios
- Misc (vocab, init, etc.)

**Every QA-flagged concern becomes a new test.** Regressions become impossible (in theory) because they all have a permanent guard.

Run: `python tests/aurelius_tests.py` → must show "34/34 passed."

---

## 6 · Metrics + Transparency

Every turn surfaces:
- ✅/❌ checklist completion
- Tests passing count
- Files touched (with line counts)
- Time spent (when meaningful)
- Token cost (when meaningful)
- What's queued for next operation

I'm visible. No black-box thinking. Every step has a status line.

---

## 7 · Cloud-Accessibility Architecture (queued, not built)

Goal: Aurelius accessible from any device, anywhere, securely.

### Proposed stack
- **Brain**: Stays on Strix Halo (LM Studio + voice_agent.py). Don't move the heavy compute.
- **Bridge**: [Tailscale](https://tailscale.com) — free, encrypted mesh VPN. Every device (phone, laptop, work PC) joins the mesh.
- **Frontend**: Lightweight web UI hosted by voice_agent.py (Flask or FastAPI added to the Python process). Talks WebSocket to Aurelius core.
- **Mobile**: PWA (progressive web app) — works on iPhone/Android as a homescreen icon, no app store. Mic + speaker access via browser APIs.
- **Auth**: Tailscale handles it. Only devices on your Tailnet can reach Aurelius.

### Effort estimate
- Tailscale setup: 15 min
- Flask/FastAPI bridge + WebSocket: ~4 hrs
- Web UI (HTML + JS): ~6 hrs
- PWA polish: ~2 hrs
**Total**: ~1 day of focused build for v1.

This is queued. Will spec it out fully when prioritized.

---

## 8 · Limiting Beliefs — Not Tolerated

Per Alan's direction: stop saying "can't be done". Pivot frame:
- "This requires X hardware → here's the path with current hardware"
- "True autonomy AGI is unsolved → here's the proxy that delivers 95% of the experience"
- "Latency floor on 70B is X → here's the architecture that hides the latency"

Anything is approachable. The job is mapping the realistic path.

---

## 9 · What "Done" Looks Like (Definition of Acceptance)

Aurelius is "done" when:
- ✅ Voice + text both work, naturally
- ✅ Boots in seconds (progressive loading)
- ✅ Doesn't talk over user (barge-in calibrated)
- ✅ Wake word reliable
- ✅ Multi-turn conversation works (no self-conversation)
- ✅ PC control via OI works for daily tasks
- ✅ Memory persists, append-only
- ✅ Obsidian vault graphs beautifully
- ✅ Goals tracked, progress surfaced daily
- ✅ Safety gate logs destructive patterns
- ⏳ Cloud-accessible across devices
- ⏳ Screen share + vision (see what user sees)
- ⏳ MCP servers wired (filesystem, web, calendar, email)
- ⏳ Self-prompting (Aurelius generates her own next task)
- ⏳ Continuous improvement (auto-updates her own prompts based on reflections)

11/15 currently. Closing the last 4 is the next 2-3 operations of work.

#sop #operations #master
