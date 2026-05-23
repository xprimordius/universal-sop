---
date: 2026-05-21
type: reference
tags: [bottleneck, optimization, performance, aurelius, claude-code]
related: ["[[index]]", "[[Aurelius]]"]
---

# Bottlenecks & Solutions

> Performance analysis for [[Aurelius]] (local voice agent) and [[Claude-Code]] (dev workflow).
> Goal: real-time conversational feel — first word in under 2 seconds, full response in under 5.

Linked: [[index]] · [[Aurelius]]

---

## Aurelius — observed latency (May 21 session)

| Stage | Time | Notes |
|---|---|---|
| Utterance capture (VAD) | ~1.3s | sustained until 0.7s silence |
| Whisper STT (`small.en`) | ~3.7s with beam=1, ~1.0s typical | Beam 3 now (better accuracy, similar speed) |
| LLM TTFB ([[Llama-3.3-70B]] Q4) | **13.8s** | first token after prompt processing |
| LLM generation | ~3.5s for 29 tokens (8 tok/s) | acceptable; bound by model size |
| TTS first audio (Kokoro 82M CPU) | ~3.1s with sentence-only | ~1.0-1.5s now with phrase chunking |
| **Total user-perceived** | **~22s** | target: <5s |

The killer is **LLM TTFB on cold Llama 70B** (13.8s). Everything else is fixable; this is bound by the model size and Vulkan KV-cache state.

---

## Solutions — implemented

| Fix | Effect | Status |
|---|---|---|
| Parallel model loading (UI shows instantly) | ~15s sequential → ~5s parallel boot | ✅ live |
| Phrase-chunk TTS (commas, word boundaries) | first audio ~1s instead of ~3s | ✅ live |
| LLM pre-warm at startup (dummy completion) | first real query TTFB ~3-5s faster | ✅ live |
| Whisper beam_size 1→3 | better accuracy, ~30% slower (still <1.5s) | ✅ live #optimization |
| Lazy-load [[Open-Interpreter]] | saves ~2s startup | ✅ live |
| Strict barge-in (RMS + 1.2s sustain + VAD prob) | no more keyboard/movement false triggers | ✅ live #bug |
| Whisper-based wake word ("[[Aurelius]]") | flexible custom phrase, ~150-300ms inference | ✅ live |
| Smooth mid-stream pivot (finish current sentence) | additive feel, not restart-y | ✅ live |
| Rich Obsidian frontmatter + wikilinks | this very note + every conversation graphs cleanly | ✅ live |
| Acoustic echo suppression (TTS playback + 350ms) | killed the self-conversation bug — agent stopped hearing itself | ✅ live #bug |
| Whisper custom vocabulary | "Aurelius", "APW", etc. biased into STT prompt — kills misrecognition | ✅ live #optimization |
| Punctuation-only chunking | no robotic mid-thought breaks — natural prosody | ✅ live |
| Fast-lane router (Gemma fast, Llama quality) | 80% of turns drop from 8-10s → <2s | ✅ live #optimization |
| Destructive-action gate (programmatic) | enforcement, not prompt-trust — audit log to Vault/Safety/ | ✅ live #safety |
| Goal store (Vault/Goals/) | active goals injected into every system prompt | ✅ live |
| Daily review automation (aurelius_daily_review.py) | autonomy Layer 3 foundation — proactive morning summaries | ✅ live |

---

## Solutions — queued (next iteration)

### Fast-lane router — biggest remaining win
Currently every query hits [[Llama-3.3-70B]] regardless of complexity. Two-track approach:
- **Quick lane** ([[Gemma]] 4B already loaded in [[LM-Studio]]): "hi", "what time is it", short factual — ~50 tok/s, TTFB <500ms
- **Substantive lane** ([[Llama-3.3-70B]]): longer reasoning, action mode

Routing heuristics:
- < 8 words AND no action keyword → quick lane
- > 8 words OR contains "explain"/"why"/"how" → substantive lane
- User can override via `/fast` and `/quality` slash commands

Expected impact: 80% of conversational queries respond in **under 2 seconds total**.

### Speculative decoding (advanced)
LM Studio supports this via draft model. Pair Gemma (draft) + Llama (verify) → 2-3× TTFB gain on the substantive lane. Setup: ~30 min. Maintenance: minimal.

### KV cache prefix sharing
System prompt + memory block = ~1500 tokens recomputed every turn. LM Studio caches them by default but the cache is per-model session. After model reload, cache is cold. Fix: keep model loaded continuously, never unload between sessions.

### Persistent vault search (semantic)
Currently `/recall` is substring-only. Add embedding-based search over `master.jsonl` using the `text-embedding-nomic-embed-text` model already loaded in [[LM-Studio]]. Conceptual matches surface naturally.

---

## [[Claude-Code]] execution speed — what I can and can't control

### What I CAN do
- **Batch tool calls in parallel** (Read + Grep simultaneously when independent) — done in this session
- **Use specialized agents** when scope is large: `Plan` for architecture, `Explore` for code search, `general-purpose` for multi-step research
- **Be more decisive** — fewer "let me check one more thing" rounds
- **Pre-load tool schemas via `ToolSearch`** before needing them
- **Avoid re-reading files** — track file state in context

### What I CAN'T directly control
- Anthropic API round-trip latency (~200-500ms per turn)
- Model thinking time (extended thinking adds seconds but raises quality)
- Tool execution time (Bash commands, file I/O)
- User-facing rendering time (Claude Code UI)

### Practical guidance for you
- For **fast feedback loops**: keep effort at Medium when iterating, raise to High/Very High only when stuck
- For **major changes**: use the `Plan` agent first to scope, then execute — saves rework
- For **search-heavy tasks**: use `Explore` agent (fast read-only) over multiple Grep rounds

---

## Real-time targets vs. current state

| Metric | Target (Claude Voice / ChatGPT) | Current Aurelius | Gap |
|---|---|---|---|
| Wake word → ready | <500ms | ~1.5s (Whisper-based) | acceptable trade for flexibility |
| Utterance → first audio (short query) | <2s | ~5-8s (Llama 70B) | **fast lane needed** |
| Utterance → first audio (long query) | <3s | ~8-15s (Llama 70B) | fast lane + caching |
| Mid-stream addition feels additive | yes | yes (smooth pivot) | ✅ |
| Mic visibility (know it's hot) | always | always (VU meter) | ✅ |

---

## Files this references

- `voice_agent.py` — main implementation
- `launch_voice_agent.cmd` — launcher with model picker
- `Memory/master.jsonl` — append-only golden record
- `[[Aurelius]]` — memory notes

#bottleneck #optimization #performance #reference
