---
date: 2026-05-21
type: protocol
tags: [protocol, gold-path, sota, research, recommendation, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]", "[[PROVE-IT-Protocol]]", "[[Failure-Ledger]]"]
---

# GOLD-PATH Protocol — Reach for the Best Solution First

Linked: [[index]] · [[Aurelius-Master-SOP]] · [[PROVE-IT-Protocol]] · [[Failure-Ledger]]

**Status**: Active (introduced Op 38, 2026-05-21)
**Authority**: Mandatory before recommending any new component (TTS, STT, vision model, chat model, embedding model, vector DB, framework, tool layer, voice clone tool, screen-capture tool, agent framework).
**Owner**: Claude (orchestrator) self-administers; user can demand a GOLD-PATH scan at any time with "did you GOLD-PATH this?"

---

## The principle

> Always reach for the gold-standard solution first. Deviation requires explicit justification (cost, license, hardware, time).

This exists because PROVE-IT verifies what was done, but does not govern *what gets proposed*. Status-quo bias + flattery of existing docs = recommendations that incrementally extend a baseline instead of independently asking "what's actually best today."

The cost of skipping GOLD-PATH is a real one Alan named: **"bouncing around from different experiments and LLMs just to get to broken versions... wasting time experimenting on failure."** F-010 in the Failure-Ledger documents the original incident.

---

## The acronym

| Letter | Step | Concrete action |
|---|---|---|
| **G** | **Gather** | List top 3 SOTA options for this problem TODAY (not "what's already in our docs"). Use 2026 awareness, not training-data defaults. |
| **O** | **Observe** | License, hardware fit, cost, real-world adoption (who's using it in production today). |
| **L** | **Lead** | Recommend the gold option FIRST in the response. Don't bury it. |
| **D** | **Deviate** | Only if forced by a constraint — explicitly cite the trade-off (cost ceiling, license incompat, hardware miss, time budget). |
| **P** | **Prove** | Link or cite source for the SOTA claim (changelog, benchmark, deployment example). |
| **A** | **Audit** | Every recommendation is grep-able — user can ask "did you GOLD-PATH this?" and I show the scan. |
| **T** | **Track** | Gold-path-skip incidents → Failure-Ledger F-NNN. Don't hide misses. |
| **H** | **Honor** | If user later asks "isn't X better?", treat it as a GOLD-PATH miss, not a debate. Update the recommendation. |

Read it as **"GOLD-PATH"** — the phrase you should ask yourself before naming any new technology.

---

## When GOLD-PATH is mandatory

Any recommendation that:
1. Introduces a new external tool or model (TTS, STT, LLM, vision, embedding, vector DB, framework, agent runtime)
2. Replaces an existing component (Kokoro → OpenVoice, Llama → Qwen, etc.)
3. Picks a stack for a new feature (cloud bridge, screen-streaming, RAG, voice clone)
4. Names a vendor or library for the first time

## When GOLD-PATH can be lighter

Incremental code changes inside a chosen stack (fixing a bug in `safe_push.py`, refactoring a function, writing a test). Still do a quick scan for "is there a library that solves this?" but full G→A audit not required.

---

## The minimum GOLD-PATH pass

```
GOLD-PATH for: <component name>

| Option | License | Hardware fit | Cost | Adoption | Notes |
|---|---|---|---|---|---|
| Option A (GOLD)   | ... | ... | ... | ... | recommended |
| Option B          | ... | ... | ... | ... | runner-up |
| Option C          | ... | ... | ... | ... | for comparison |

Recommendation: <Option A>
Justification: <one sentence on why gold-path applies>
If deviating from gold: <constraint forcing the deviation>
```

Render this table BEFORE the body of the recommendation, not after.

---

## Example — TTS for Aurelius (the actual Op 38 scan)

GOLD-PATH for: Text-to-speech engine

| Option | License | Hardware fit | Cost | Adoption | Notes |
|---|---|---|---|---|---|
| **OpenVoice v2 (MyShell)** | MIT | iGPU OK (Vulkan/CUDA/CPU) | free | growing — voice-cloning open standard | **GOLD** — 5s sample → clone, commercial-OK |
| XTTS-v2 (Coqui) | CPML (non-commercial) | GPU preferred | free | very large adoption | runner-up, license blocks resale |
| ElevenLabs cloud | proprietary | n/a | $22-99/mo | dominant in 2026 production AI | gold cloud option; deviates from local+free |
| Kokoro 82M (current) | Apache 2 | iGPU/CPU OK | free | small | weaker — no voice cloning, sounds robotic |
| Piper (current) | MIT | CPU | free | medium | faster than Kokoro on CPU, no cloning |

Recommendation: **OpenVoice v2**
Justification: only option satisfying (local AND free AND voice-cloning AND commercial-OK).
Deviation: none — gold path is achievable.

That's what the per-component scan looks like.

---

## Anti-patterns this protocol prevents

| Anti-pattern | What it looks like | GOLD-PATH counter |
|---|---|---|
| **Doc-anchoring** | "Our docs say Kokoro is the TTS, so let's improve Kokoro" | Forces the question: "is Kokoro still gold in 2026?" |
| **Training-data defaults** | Recommending a library that was popular in 2023 because that's what training data is rich on | Forces independent check of 2026 adoption |
| **Incrementalist bias** | "Let's tweak our current X" when the right move is "replace X with Y" | Forces side-by-side compare with replacement |
| **Skipping cost honesty** | Comparing options without naming their real cost (cloud APIs, license restrictions) | "Observe" step requires explicit cost + license columns |
| **Sacred cows** | "We can't change the LLM, we already chose Qwen" | "If a better option lands in 2027, GOLD-PATH says we swap. No sacred cows." |

---

## What GOLD-PATH is NOT

- **Not a permission gate** — it's a recommendation discipline. Doesn't block ops from shipping.
- **Not for already-shipped scaffolding** — applies to NEW components and REPLACEMENTS, not bug fixes inside chosen stacks.
- **Not a debate framework** — gold-path winner stands unless user contests with new info.

---

## Audit hook (post-recommendation)

After any GOLD-PATH-required recommendation, the user (or a future Claude) can run:

```bash
grep -B2 -A20 "GOLD-PATH for" vault/Reference/Operations-Log.md | tail -60
```

This surfaces every gold-path scan ever done, so audits can confirm the protocol was applied.

---

## Audit history of GOLD-PATH itself

- **Op 38** (2026-05-21): Introduced. First retroactive scan applied to TTS (OpenVoice gold), STT (faster-whisper-large-v3-turbo gold), vision (Qwen mmproj already loaded), voice clone (OpenVoice gold), wake word (openWakeWord still gold), RAG (ripgrep gold for <1000 files).

---

## How external systems use this protocol

If you are an external AI (ChatGPT, Gemini, Claude.ai chat, etc.) consulting on Aurelius or any related project, **apply GOLD-PATH to every technology recommendation**. The protocol is in this file. Pull it via:

```
https://raw.githubusercontent.com/xprimordius/aurelius-vault/main/Reference/GOLD-PATH-Protocol.md
```

If the repo is private (xprimordius is currently private), the user can either:
1. Make the file public via gist: `gh gist create vault/Reference/GOLD-PATH-Protocol.md --public`
2. Paste the contents directly into the external chat

Either way, the rule for the consulting AI is: **GOLD-PATH every recommendation. No exceptions for "what's already in the existing stack."**

#protocol #gold-path #sota #recommendation #aurelius
