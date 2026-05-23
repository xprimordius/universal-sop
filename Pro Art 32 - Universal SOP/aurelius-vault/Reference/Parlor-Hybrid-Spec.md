---
date: 2026-05-23
type: spec
tags: [spec, parlor-hybrid, screen-streaming, vision, voice, design, aurelius]
related: ["[[index]]", "[[EMULATE-OR-EXCEED-Protocol]]", "[[GOLD-PATH-Protocol]]", "[[Aurelius-Master-SOP]]"]
---

# Aurelius + Parlor Hybrid — Implementation Spec

Linked: [[index]] · [[EMULATE-OR-EXCEED-Protocol]] · [[GOLD-PATH-Protocol]]

**Status**: Specification (Op 45, 2026-05-23). Implementation ops follow.
**Benchmark**: Parlor — https://github.com/fikrikarim/parlor (per EOE scan, Op 42)
**Goal**: Match Parlor's 2.5-3.0s end-to-end latency for local voice+screen+chat AI, on Windows + Vulkan iGPU (Parlor targets Mac/Linux only).

---

## 1 · Parlor's actual architecture (from source read)

| Layer | Parlor's choice | Source location |
|---|---|---|
| Server | FastAPI WebSocket | `src/server.py` |
| LLM | Gemma 4 E2B (~2.6GB) | via LiteRT-LM (Google runtime) |
| TTS | Kokoro (MLX on Mac, ONNX on Linux) | `src/tts.py` |
| VAD | Silero VAD — **browser-side** | (in HTML/JS frontend) |
| Audio in | PCM over WebSocket from browser | binary frames |
| Video in | JPEG frames over WebSocket from browser | binary frames |
| Audio out | Streamed audio chunks over WebSocket | sentence-level chunking |
| Frontend | Plain HTML/JS at localhost:8000 | browser-native |
| Barge-in | Browser VAD detects new speech → cancels TTS playback + server gen | client-driven |
| Streaming | Sentence-level TTS chunking — playback starts before full response generated | critical for perceived latency |
| Config | `MODEL_PATH` (auto-downloads from HF), `PORT` (default 8000) | `.env.example` |
| License | Apache 2.0 | LICENSE |

**Setup**:
```bash
git clone https://github.com/fikrikarim/parlor.git
cd parlor/src
uv sync
uv run server.py
# → opens browser at localhost:8000
```

**Measured perf** (Parlor's own README): 2.5-3.0s end-to-end on M3 Pro. 83 tok/s decode.

---

## 2 · What Aurelius can reuse, swap, or extend

| Component | Parlor | Aurelius current | Decision |
|---|---|---|---|
| **LLM (chat+vision)** | Gemma 4 E2B via LiteRT-LM | Qwen 3.6 35B-A3B via LM Studio | **SWAP** — LiteRT-LM not Vulkan-compat. Use Gemma 3 4B (gguf) via LM Studio for streaming; keep Qwen 35B for deep reasoning on-demand. |
| **TTS** | Kokoro (MLX/ONNX) | Kokoro (already loaded) | **KEEP** — same engine, already wired in `voice_agent.py` |
| **STT** | (Gemma 4 handles speech natively) | faster-whisper small.en | **KEEP for v1** — Gemma 3 4B doesn't have native audio understanding; whisper still needed. Re-evaluate when Qwen 2.5-Omni Vulkan-confirmed (Op 48+). |
| **VAD** | Silero (browser-side) | Silero (server-side) | **MIGRATE** — move VAD to browser frontend for ~200ms latency cut. v1 keeps server-side; v2 moves. |
| **Server** | FastAPI + WebSocket | Tkinter desktop only | **ADD** — new `aurelius_server.py` alongside voice_agent.py. WebSocket on :7777 (matches cloud_relay convention). |
| **Frontend** | HTML/JS browser at :8000 | none (Tkinter only) | **NEW** — minimal HTML/JS in `agent-stack/web/` mimicking Parlor's structure. Phone-friendly. |
| **Barge-in** | Client-driven cancel | Server-side `voice_agent._barge_in` flag | **EXTEND** — add WebSocket "cancel" message → cancels in-flight gen + drains TTS queue (same as F-Aurelius's current OnlyText bug fix from prior session) |
| **Streaming TTS** | Sentence-level chunking | Currently blocks until full LLM response | **NEW** — implement sentence chunker + incremental TTS in server. Single biggest perceived-latency win. |
| **Screen capture** | Browser camera + screen sharing API | `mss` server-side capture | **CHOOSE** — for v1 keep `mss` server-side (works today). v2 switches to browser `getDisplayMedia()` for any-device support. |
| **Multimodal** | Gemma 4 unified | Caption-then-reason via Qwen mmproj | **STAGED** — v1: Gemma 3 4B handles both chat AND screen captions (small enough to be fast). v2: evaluate Qwen 2.5-Omni for true native multimodal. |
| **Orchestration framework** | Custom FastAPI | Custom voice_agent.py | **CUSTOM** — both Parlor and Aurelius use custom. Pipecat migration is a separate, later decision (not blocking parlor-hybrid). |

---

## 3 · GOLD-PATH scan for the LLM swap

GOLD-PATH (8-step research-SOTA-first: Gather → Observe → Lead → Deviate → Prove → Audit → Track → Honor) for Vulkan-compatible small multimodal LLM in 2026:

| Option | Size | Vulkan compat | Multimodal | Streaming | License | Pick? |
|---|---|---|---|---|---|---|
| **Gemma 3 4B-it (gguf)** | 4B (~2.5GB Q4) | confirmed via llama.cpp Vulkan | text+vision | yes | Gemma terms (commercial OK with attribution) | **GOLD** — Parlor's spiritual sibling on Vulkan |
| Gemma 4 E2B | 2B (~2.6GB) | LiteRT-LM only, no gguf | text+vision | yes | Gemma terms | what Parlor uses, but unsupported on Vulkan |
| Qwen 2.5-Omni 7B | 7B | text confirmed, audio output unknown on Vulkan | text+vision+audio | yes | Apache 2 | **runner-up** — verify in Op 48 |
| MiniCPM-V 2.6 | 8B | confirmed | text+vision | yes | Apache 2 | larger, slightly slower |
| Moondream2 | 1.8B | confirmed | text+vision (caption only) | fast | Apache 2 | use for caption-only path, not chat |
| Qwen 3.6 35B-A3B (current) | 35B MoE (3B active) | confirmed (33 tok/s vision per RUNBOOK) | text+vision via mmproj | yes | Apache 2 | keep for deep reasoning, too slow for streaming |

**Pick**: **Gemma 3 4B-it gguf** as primary streaming model. Retain Qwen 35B-A3B as "deep mode" for non-streaming tasks (long reasoning, complex analysis).

**Deviation justification**: Parlor uses Gemma 4 E2B but it requires LiteRT-LM which doesn't run on Vulkan iGPU. Gemma 3 4B is the closest Vulkan-compatible alternative and is the model most similar in capability profile.

---

## 4 · Target architecture (Aurelius+Parlor hybrid)

```
┌─────────────────────────────────────────────────────────────────┐
│  BROWSER (phone or desktop, via Tailscale or localhost)         │
│  - getUserMedia (mic)                                           │
│  - getDisplayMedia (screen)  ← v2                                │
│  - Silero VAD (browser)  ← v2                                    │
│  - HTML/JS chat + audio playback                                │
└────────────────────────────┬────────────────────────────────────┘
                             │ WebSocket (audio PCM, JPEG, JSON ctrl)
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  aurelius_server.py  (FastAPI on :7777)                          │
│  - WebSocket handler                                            │
│  - VAD (v1: server, v2: trusts browser)                          │
│  - Frame sampling/diff (reuse agents/screen_stream.py)          │
│  - Sentence chunker for streaming TTS  ← NEW                    │
│  - Cancel + barge-in coordination                                │
└────────┬──────────────────┬──────────────────┬──────────────────┘
         │ STT              │ LLM              │ TTS
         ▼                  ▼                  ▼
   faster-whisper      LM Studio HTTP        Kokoro
   (CPU, small.en)     :1234 /v1/chat        (already loaded)
                       Gemma 3 4B (gguf)    streamed sentence
                       (NEW model load)      chunks
```

Existing components (mostly reused):
- `voice_agent.py` — keeps running for Tkinter desktop; FastAPI bridge added alongside, not replacing
- `agents/screen_stream.py` (Op 41) — already does frame sampling + diff + caption queue
- `agents/aurelius_tools.py` — tool layer stays
- `aurelius_paths.py` — path resolver stays
- All 13 specialist agents — orchestrator stays unchanged

---

## 5 · Op breakdown (the implementation plan)

| Op | Title | Effort | Deliverable | Blocking |
|---|---|---|---|---|
| 46 | Download Gemma 3 4B gguf + verify Vulkan inference | ~30 min | Model loaded in LM Studio; smoke test confirms vision+chat at >20 tok/s | User action (LM Studio model download) |
| 47 | `aurelius_server.py` FastAPI WebSocket skeleton + minimal HTML/JS frontend | ~3 hrs | `localhost:7777` serves chat UI; types text → Gemma 3 → response back | None |
| 48 | Wire faster-whisper STT into WebSocket audio pipeline | ~2 hrs | Browser mic → server → transcript → Gemma → audio reply (with Kokoro server-side) | None |
| 49 | Sentence-level TTS streaming (the perceived-latency win) | ~2 hrs | First audio chunk plays in <1.5s after speech-end | None |
| 50 | Screen capture wiring (server-side `mss` via screen_stream.py) | ~2 hrs | Browser receives caption stream; user can ask "what's on my screen" | None |
| 51 | Barge-in via WebSocket cancel message | ~1 hr | Speaking while AI is talking → cancels both gen + audio | None |
| 52 | Tailscale + phone access verification | ~30 min | Open URL on phone via Tailscale, full voice+screen+chat works | Tailscale running on phone |
| 53 | EOE Compare — measure Aurelius+Parlor hybrid e2e latency vs Parlor's 2.5-3.0s | ~30 min | Verdict: matched / exceeded / below target. F-NNN entry if below target. | All above shipped |

**Total**: ~12 hours of implementation across 8 ops. Realistic over 2-3 days.

---

## 6 · Risks + mitigations

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Gemma 3 4B vision quality too weak on Vulkan iGPU | medium | medium | EOE Compare step measures; fallback to Qwen mmproj if Gemma 3 fails |
| Vulkan + LM Studio HTTP can't sustain streaming (per-token TTFB high) | medium | high | Smoke test in Op 46 before building further; consider llama-cpp-python direct binding if LM Studio HTTP adds overhead |
| FastAPI + WebSocket on Windows has firewall quirks | low | low | Document firewall exception in RUNBOOK; standard pattern |
| Browser audio APIs (Web Audio API) latency varies by browser | medium | low | Recommend Chrome/Edge; Firefox known to be slower on Web Audio |
| Sentence chunker incorrectly splits mid-sentence (TTS plays "He said ' " then "hello.") | medium | low | Use spaCy or regex on `[.!?]\s+` boundaries; test with edge cases |
| Voice_agent.py and aurelius_server.py race on LM Studio HTTP | low | medium | Single-flight pattern: one in-flight gen at a time; queue/reject second |
| Mobile data plans choke on JPEG frame streaming | medium | medium | Configurable fps (1 fps default); diff-skip already in screen_stream.py |
| Barge-in cancellation races: TTS chunks still in browser audio queue after cancel | high | low | Browser-side: clear AudioContext queue on cancel; pattern is standard |

---

## 7 · What stays unchanged

- All 6 mandatory protocols (Master-SOP, PROVE-IT, GOLD-PATH, EOE, Multi-Device-Sync, BACKUP-STATUS) apply per op
- 9-point gate enforced (safe_push refuses vault push if latest op missing the 9 closeout sections)
- BACKUP-STATUS block at end of every op writeup
- All 13 specialist agents continue daily routine
- Failure-Ledger appended for any caught failure (HFR format: Root cause + Permanent fix + Proof)
- LM Studio remains the LLM runtime (just adds Gemma 3 4B alongside Qwen 35B)

---

## 8 · What this op (Op 45) actually delivers

This document is the spec. Implementation begins Op 46. Op 45 ships:

1. **This spec file** (`vault/Reference/Parlor-Hybrid-Spec.md`)
2. **EOE Compare entry** in Op 42 (Parlor scan retroactively) → Op 45's "Build" step is the spec itself
3. **Updated Goals/Status.md** with the 8-op breakdown queued
4. **Operations-Log Op 45 entry** with PROVE-IT 9-POINT (9 closeout sections: QA, Test, Quality, Bottlenecks, Constraints, Errors, Break points, Improve/Resolve, Foresight)
5. **No code changes** — spec only. Tests still 102/102.
6. **Push** through 9-point gate (safe_push refuses vault push if latest op missing the 9 closeout sections)

---

## 9 · External-AI consultant note

If you are an external AI reviewing this spec, the key insight is that **Aurelius is NOT cloning Parlor**. It is:
- Emulating Parlor's WebSocket + browser + Kokoro + sentence-streaming architecture
- Exceeding Parlor on: Windows+Vulkan support, persistent vault memory, multi-agent daily routine, phone-via-Tailscale, on-demand deep reasoning via Qwen 35B
- Using different LLM (Gemma 3 vs Gemma 4) only because Vulkan iGPU requires gguf via llama.cpp, not LiteRT-LM

Both projects are Apache 2.0 (Parlor) / Aurelius is private but borrows architecture not code. No license violation.

#spec #parlor-hybrid #screen-streaming #aurelius
