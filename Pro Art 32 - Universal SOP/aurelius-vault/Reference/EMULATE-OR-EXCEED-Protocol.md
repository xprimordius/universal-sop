---
date: 2026-05-22
type: protocol
tags: [protocol, emulate-or-exceed, eoe, reference, benchmark, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]", "[[GOLD-PATH-Protocol]]", "[[PROVE-IT-Protocol]]"]
---

# EMULATE-OR-EXCEED (EOE) Protocol — Compare Before You Build

Linked: [[index]] · [[Aurelius-Master-SOP]] · [[GOLD-PATH-Protocol]] · [[PROVE-IT-Protocol]]

**Status**: Active (introduced Op 42, 2026-05-22)
**Authority**: Mandatory before building any new feature, capability, or major architectural change. Optional for bug fixes and internal refactors.
**Owner**: Claude (orchestrator) self-administers; user can demand an EOE scan with "what's the reference?"

---

## The principle

> Everything we build should be benchmarked against the best public reference implementation. We then **emulate it** (match its architecture + performance) **or exceed it** (beat it on at least one explicit axis). We do not invent in isolation.

This sits next to GOLD-PATH (components) and PROVE-IT (verification) as the third leg of the discipline triangle:

```
              ┌──────────────────┐
              │   THE TRIANGLE   │
              ├──────────────────┤
GOLD-PATH ──► │  Best components │
EOE       ──► │  Best reference  │  ──► The thing you build
PROVE-IT  ──► │  Real verify     │
              └──────────────────┘
```

Without EOE, GOLD-PATH alone can pick gold components but still build an inferior whole (because no one is comparing the integrated result against a working public implementation).

This exists because of a real failure pattern: building from a sketch of "what should work" instead of from a study of "what's already proven to work." F-011 in the Failure-Ledger documents the precipitating case (Op 41 screen-streaming MVP designed without first checking that Parlor existed and had already solved this).

---

## The 5-step EOE scan (render BEFORE writing code)

| Step | Verb | Concrete action |
|---|---|---|
| **1. Search** | Find | Search public sources (GitHub, blog posts, paper releases) for the top 3 projects implementing this capability TODAY. Use WebSearch/WebFetch — do not rely on training-data memory. |
| **2. Profile** | Measure | For each: stack, hardware target, measured latency/quality, license, known limitations. Cite sources (URL + date). |
| **3. Decide** | Commit | Pick ONE reference as the benchmark. State explicitly: "Emulate on axis X, Exceed on axis Y." |
| **4. Build** | Build | Implement with the reference's architecture as scaffold. Borrow ideas, not code (license-aware). |
| **5. Compare** | Verify | After building, measure Aurelius's result against the reference's numbers. Verdict: matched / exceeded / below target. Record in Op writeup. |

---

## When EOE is mandatory

Any operation that:
1. Introduces a new user-facing capability (voice clone, screen-stream, RAG, vision)
2. Replaces an existing major component (chat LLM, TTS engine, agent runtime)
3. Designs a new architecture (cloud bridge, MCP server, daily routine)
4. Adopts a framework (Pipecat, LiveKit, LangChain, etc.)

## When EOE can be lighter

- Bug fixes inside an existing chosen architecture
- Internal refactors with no user-facing change
- Performance tuning of a chosen component (use the reference's tuning notes if available, but skip full search)
- Documentation, hooks, ledger entries, gist refreshes

---

## The minimum EOE pass

Render this table BEFORE the recommendation body:

```markdown
EOE Reference Scan for: <capability name>

| Reference | Stack | Measured perf | License | Notes | URL |
|---|---|---|---|---|---|
| Reference A (GOLD) | ... | latency, throughput | ... | known limits | https://... |
| Reference B | ... | ... | ... | ... | https://... |
| Reference C | ... | ... | ... | ... | https://... |

Picked benchmark: <Reference A>
Emulate on: <architecture / latency / approach>
Exceed on: <one specific axis we will beat — e.g., Windows+Vulkan support, multilingual, lower memory>
Source URLs: <list>
```

After building, append a Compare block:

```markdown
EOE Compare (Op N closeout)

| Metric | Reference A | Aurelius | Verdict |
|---|---|---|---|
| End-to-end latency | 2.5-3.0s | <measured> | matched / exceeded / below target |
| Memory footprint | <X> | <Y> | ... |
| Setup complexity | <Z> | <W> | ... |

Overall: matched ref / exceeded on <axis> / below target — corrective action queued
```

---

## Example — EOE applied to Op 41 screen-streaming (retroactive)

This is the scan that SHOULD have run before Op 41 was scoped. Op 42 ships this protocol so future ops do it preemptively.

### EOE Reference Scan for: local voice+screen+chat AI assistant

| Reference | Stack | Measured perf | License | Notes | URL |
|---|---|---|---|---|---|
| **Parlor** | Gemma 4 E2B (LiteRT-LM GPU) + Kokoro TTS + FastAPI/WebSocket + browser frontend + Silero VAD | **2.5-3.0s end-to-end on M3 Pro** (1.8-2.2s vision/speech + 0.3s gen + 0.3-0.7s TTS) | MIT | Mac+Linux only, no Windows. "Research preview" | https://github.com/fikrikarim/parlor |
| Parlor-jarvis (fork) | Same + multilingual (en/ko/es/pt/fr) + screen + PDF + video | N/M | MIT | More features, same arch | https://github.com/typomonster/parlor-jarvis |
| Pipecat | Production framework for voice + multimodal | varies by config; sub-second for cloud LLM, slower for local | BSD-2 | Orchestration only, brings your own LLM | https://github.com/pipecat-ai/pipecat |
| LiveKit Agents + vision-demo | LiveKit RTC + STT/TTS/LLM stack | N/M | Apache-2 | WebRTC built-in (cloud bridge friendly) | https://github.com/livekit-examples/vision-demo |
| TEN Framework | Open-source realtime multimodal conversational | N/M | Apache-2 | Lower adoption | https://github.com/TEN-framework/ten-framework |
| LocalAI | OpenAI-compatible API for local LLMs/vision/voice | N/M | MIT | Vulkan supported; broader scope than pure voice+screen | https://github.com/mudler/LocalAI |

**Picked benchmark: Parlor**
**Emulate on**: caption-then-reason architecture, Kokoro TTS, Silero VAD, WebSocket frontend pattern, target ≤3s end-to-end
**Exceed on**: Windows + Vulkan iGPU support (Parlor doesn't target this); persistent vault memory; multi-agent orchestration
**Source URLs**: see table above

This single scan would have prevented:
- Anchoring on Qwen 35B mmproj as the streaming vision model (Parlor uses 2GB Gemma 4 E2B; 35B is 10× too big for streaming)
- The 5-7s caption lag baseline that Aurelius's current architecture has built into it
- Designing a custom orchestration when Pipecat/LiveKit are battle-tested

---

## Anti-patterns this protocol prevents

| Anti-pattern | What it looks like | EOE counter |
|---|---|---|
| **Building from sketch** | "Here's how I think this should work" without checking what exists | Forces a search step before scope is set |
| **Reinventing the wheel** | Custom WebSocket orchestration when Pipecat exists | Profile step lists production frameworks |
| **Ignorance bias** | "I don't know of any project that does this" without searching | Mandatory WebSearch — claim of absence requires proof of search |
| **Wrong-axis comparison** | Beating reference on latency while ignoring it has 10× the features | Pick explicit axis to emulate AND exceed |
| **No measurement after build** | "It works on my machine" without comparing to reference numbers | Step 5 compare table is mandatory in Op writeup |

---

## What EOE is NOT

- **Not a clone command** — "Emulate" means borrow architecture and ideas, not copy code. License compatibility matters.
- **Not a permission gate** — recommendation discipline, not a push blocker (unlike PROVE-IT 9-point gate).
- **Not for incremental fixes** — applies to new features and major changes only.
- **Not a debate framework** — once benchmark is picked, build to it. Re-scan only if new reference emerges.

---

## Integration with GOLD-PATH and PROVE-IT

Within a single operation:

1. **EOE first** — pick the reference implementation to compare against
2. **GOLD-PATH second** — within the reference's architecture, pick the gold-standard component for each layer (sometimes overriding the reference's choice)
3. **PROVE-IT throughout** — verify what you built actually works
4. **9-point closeout** — every op writeup includes EOE Compare block + GOLD-PATH scan + PROVE-IT pass

If the three protocols ever conflict (rare):
- PROVE-IT wins on safety (don't ship unverified)
- GOLD-PATH wins on component choice (don't use inferior tech because reference did)
- EOE wins on architectural pattern (don't rebuild what's proven)

---

## How external systems use this protocol

External AI consultants (ChatGPT, Gemini, Claude.ai) reviewing Aurelius work should apply EOE to every recommendation. The protocol is in this file and the public gist:

```
https://gist.github.com/xprimordius/b6b78c9bca02b94bb74c0db555586923
```

Rule for the consulting AI: **Before recommending any feature implementation, render an EOE Reference Scan. No exceptions for "I'll build from scratch." Reference search is mandatory.**

---

## Audit history of EOE itself

- **Op 42** (2026-05-22): Introduced. First retroactive scan applied to local voice+screen+chat AI — Parlor identified as primary benchmark. Wired into Master-SOP §1.4.6, BOOTSTRAP reading list (item #10), INDEX.md mandatory protocols (4 → 5).

#protocol #emulate-or-exceed #eoe #benchmark #aurelius
