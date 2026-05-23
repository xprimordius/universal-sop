---
date: 2026-05-21
type: setup-guide
tags: [vision, screen, setup, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]"]
---

# Screen + Vision — Activation Guide

Linked: [[index]] · [[Aurelius-Master-SOP]]

> **What you get when done**: Aurelius can SEE your screen. Ask "what am I looking at?" and she answers from the actual pixels.

---

## Current state (after Op 10)

- ✅ Screen capture library installed (`mss==10.2.0`)
- ✅ Capture + send code ready in `agents/screen_vision.py`
- ✅ `ask_about_screen(question)` function ready to call
- ⏳ **Blocked on**: vision model not loaded in LM Studio

---

## What to do (one-time setup, ~5 min + download time)

### Step 1: Download a vision model in LM Studio

Open LM Studio → Discover → download ONE of these (GGUF quantized):

| Model | Size | Speed on Strix Halo | Quality |
|---|---|---|---|
| **Qwen/Qwen2-VL-7B-Instruct-GGUF** (Q4_K_M) | ~5 GB | Fast | Excellent — recommended |
| **bartowski/llava-v1.6-vicuna-7b-GGUF** | ~5 GB | Fast | Good |
| **MiniCPM-V-2_6-GGUF** | ~6 GB | Medium | Best for UI/screenshots |

My pick: **Qwen2-VL-7B** — best balance of speed, quality, and UI understanding.

### Step 2: Load the model

LM Studio → Local Server → load the vision model. Note the identifier
(e.g., `qwen/qwen2-vl-7b` — whatever LM Studio's model list shows).

### Step 3: Set the env var

Add to `launch_voice_agent.cmd` before `%PYTHON% %AGENT%`:

```cmd
set VISION_MODEL_ID=qwen/qwen2-vl-7b
```

### Step 4: Test

```cmd
agent-stack-venv\Scripts\python.exe -m agents.screen_vision
```

Expected output:
```
mss available: True
PIL available: True
VISION_MODEL_ID: qwen/qwen2-vl-7b
Screenshot captured: ...png (N bytes)
```

Then test a real query:
```cmd
agent-stack-venv\Scripts\python.exe -c "from agents.screen_vision import ask_about_screen; import json; print(json.dumps(ask_about_screen('What is on my screen?'), indent=2))"
```

---

## Next: `/look QUESTION` slash command (queued for next op)

Once the env var works on your end, I'll wire `/look QUESTION` into voice_agent.py.
Say "go on look" after you've activated vision.

---

## Privacy notes

- All processing is LOCAL. Screenshots never leave your machine.
- Screenshots saved to `Vault/Screenshots/` for audit — delete anytime.
- LM Studio sees the image only over localhost.

#vision #setup #screen
