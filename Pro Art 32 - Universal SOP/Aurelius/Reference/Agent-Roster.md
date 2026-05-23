---
date: 2026-05-21
type: reference
tags: [agents, sop, aurelius, queued]
related: ["[[Aurelius-Master-SOP]]", "[[index]]"]
---

# Agent Roster — Aurelius's Specialist Team

Linked: [[Aurelius-Master-SOP]] · [[index]]

Each agent has a defined role, input, output, cadence, and dispatch prompt.
Claude (in Claude Code) dispatches these via the Agent tool. They run in
parallel with main work. Their outputs flow back as artifacts in the vault.

---

## Active (currently in rotation)

### 1. QA Validation Agent — `general-purpose`
**Role**: Independent code audit against stated requirements.
**Cadence**: Every operation, post-implementation.
**Input**: Recent code changes + Alan's stated requirements.
**Output**: Markdown audit with ✅/⚠️/❌ verdicts + overall score 1-10.
**Status**: Live — has caught 3+ P0 regressions to date.

### 2. Alignment Audit Agent — `general-purpose`
**Role**: Verify macro alignment with original mission (the 12 intents in [[Aurelius-Master-SOP]] §0).
**Cadence**: Every 3-5 operations.
**Input**: Codebase + original mission spec.
**Output**: Per-intent verdict table + drift report + recommendations.
**Status**: Live — last audit scored 8/10.

---

## Queued (designed, implement after Alan shares his SOP)

### 3. User-Prompt Organizer Agent
**Role**: Captures Alan's intent statements as they happen. Categorizes them into a structured ledger so QA/validation/proficiency agents have stable inputs to check against.

**Cadence**: Continuous (run post-turn, light operation).

**Input**:
- Latest `Conversations/{session}.md` (just the user turns)
- Previous `Intent/Master-Intent.md` ledger

**Output** (writes/appends to `Vault/Intent/Master-Intent.md`):
```yaml
2026-05-21T14:30: "she keeps talking over me"
  category: bug-report
  priority: P0
  status: resolved (op 6)
  related: [barge-in, echo-suppression]
```

**Dispatch prompt template**:
```
You are the User-Prompt Organizer. Read this session transcript:
[transcript]

For each user turn, extract:
- Verbatim intent (what they said)
- Category (feature-request, bug-report, vision-statement, preference,
   clarifying-question, decision)
- Priority signal (P0/P1/P2 — based on tone, urgency words, repetition)
- Related topic tags

Append entries to Master-Intent.md preserving prior content.
Format as YAML blocks for easy parsing later.
```

### 4. Goal Agent
**Role**: Maintain timeline (macro: yearly/quarterly vision; micro: this-week milestones). Always knows "you are here" + "next milestone" + "what's blocking".

**Cadence**: Daily auto-run + on every `/goal` event.

**Input**:
- All active `Vault/Goals/*.md` files
- Recent `Daily-Reviews/`
- `Operations-Log.md`

**Output** (overwrites `Vault/Goals/Status.md`):
```markdown
# Goal Status — {date}

## You are here
[concrete current position in timeline]

## Next milestone
[X by date Y, requires Z]

## Currently blocking
[bottleneck or external dependency]

## Effort estimate
[hours/days to next milestone]
```

**Dispatch prompt template**:
```
You are the Goal Agent. Synthesize:
- Active goals: [list]
- Recent operations: [excerpt]
- Daily reviews: [last 7]

Produce a "you are here" snapshot:
1. Current timeline position (paint the macro picture)
2. Next concrete milestone (one specific thing)
3. What's currently blocking (be honest)
4. Time to next milestone (best estimate with confidence)

Write to Goals/Status.md (overwriting prior).
```

### 5. Bottleneck Agent
**Role**: Proactively scans for latency issues, race conditions, memory growth, error patterns. Doesn't wait for Alan to report. Surfaces fixes.

**Cadence**: Weekly auto-run + on perf regression in logs.

**Input**:
- `voice-agent.log` (last 7 days)
- Test pass times
- Conversation log timings
- Current `Bottlenecks-and-Solutions.md`

**Output** (appends to `Vault/Bottlenecks/{week}.md`):
```markdown
# Bottleneck Scan — Week of {date}

## New issues found
- [issue]: [evidence — log line / metric]
  - Suggested fix: [concrete code change]

## Optimizations available (not yet applied)
- [optimization]: [expected impact]
```

**Dispatch prompt template**:
```
You are the Bottleneck Agent. Read:
- voice-agent.log entries from last 7 days
- Operations-Log.md
- Bottlenecks-and-Solutions.md (known issues)

Find:
1. Any LLM responses >5s after warmup (TTFB regressions)
2. Any session that ended with errors
3. Any pattern of repeated failures (same Whisper miss 3x, same OI error)
4. Any threading anomalies (utterance queued + dispatched twice)

For each finding, propose a specific code change with file:line reference.
Output to Bottlenecks/{week-of-monday-date}.md.
```

### 6. Insight Agent
**Role**: Bird's-eye micro+macro pattern recognition. Reads everything. Surfaces important things Alan would want to know but might miss. Resolves trivial ones automatically.

**Cadence**: Daily.

**Input**:
- Yesterday's `Conversations/`
- This week's `Daily/`
- Recent `Reflections/`
- `Master-Intent.md` (from User-Prompt Organizer)

**Output** (writes `Vault/Insights/{date}.md`):
```markdown
# Daily Insight — {date}

## Worth your attention
- [Important pattern or anomaly]

## Things I resolved
- [Routine maintenance done autonomously]

## Questions for you
- [Decisions only you can make]
```

**Dispatch prompt template**:
```
You are the Insight Agent. Cross-reference:
- Recent conversations
- Active goals
- User intent ledger
- Reflections

Identify:
1. Patterns Alan should know about (something he said 4x this week,
   a problem recurring, an opportunity surfacing)
2. Things you can resolve yourself (small follow-ups, cleanup)
3. Decisions only Alan can make (escalations)

Be concise. Surface what matters, hide what doesn't.
Write to Insights/{date}.md.
```

---

## Why this architecture works

- **Parallelism**: Each agent runs in its own context, doesn't compete with the orchestrator.
- **Specialization**: Each has one job. Easy to audit each independently.
- **Composability**: User-Prompt feeds Insight. Goal informs Bottleneck. Etc.
- **Auditability**: Every agent writes to the vault. Alan can read what each is finding.
- **Reversibility**: All outputs are markdown. If an agent goes off the rails, delete its files and re-run.

---

## Activation order (when we build)

1. **User-Prompt Organizer** first — needed as input to validation agents.
2. **Goal Agent** second — gives Alan the "where are we" view he keeps asking for.
3. **Bottleneck Agent** third — proactive perf hygiene.
4. **Insight Agent** last — synthesizes the rest into a daily executive summary.

Each is ~2-4 hours of build + integration. ~1-2 days total to land all four.

#agents #roster #queued #sop
