# Aurelius — Local Voice Agent

A local AI desktop voice assistant for Alan Nguyen. Runs entirely on a Strix Halo
workstation (Ryzen AI Max+ 395 + 128 GB unified memory). No cloud APIs, no
subscriptions, no data leaves your hardware.

## Stack

- **STT**: faster-whisper `tiny.en` (utterance) + `small.en` fallback
- **VAD**: silero-vad
- **LLM**: LM Studio (OpenAI-compatible streaming on :1234)
  - Llama 3.3 70B Q4_K_M (quality lane)
  - Gemma 4B (fast lane)
  - Progressive loading: Gemma in 3s, Llama promoted in background
- **TTS**: Kokoro 82M (af_heart, 24kHz)
- **Actions**: Open Interpreter (lazy-loaded)
- **Wake word**: Whisper tiny.en on rolling 2.5s buffers → "Hey Aurelius"

## Features

- Voice + text input — talk OR type, both work
- Live VU meter (always know if mic is hot)
- Onyx + gold UI, transparent status panel
- Acoustic echo suppression (no self-conversation loop)
- Smooth mid-stream pivot (typed input weaves in naturally)
- Append-only memory in Obsidian vault
- Fast-lane router (short queries → fast brain, complex → quality)
- Destructive-action safety gate with audit log
- Self-reflection (`/reflect`)
- Goal store + daily review automation
- 4 specialist agents running daily (User-Prompt, Goal, Bottleneck, Insight)
- 43+ regression tests in `tests/aurelius_tests.py`

## Slash commands (in the text input)

```
/help      /clear     /save TEXT   /recall QUERY
/reflect   /mic       /devices     /model
/voice     /vault     /goal        /fast /quality /auto
```

## Quick start

```cmd
launch_voice_agent.cmd
```

Pick a model (default: **[4] Progressive** — Gemma 4B in 3s, Llama 70B in background).

## Daily routine (autonomous)

The 4 specialist agents run via Windows Task Scheduler at 8:00 AM daily.
Outputs land in `Documents\The Beginning\Aurelius\` (Intent, Goals,
Bottlenecks, Insights, Reflections).

Manually:

```cmd
run_daily_routine.cmd
```

## Restore from backup

See [RESTORE.md](RESTORE.md) for cloning to a new machine.

## Validation harness

```cmd
agent-stack-venv\Scripts\python.exe tests\aurelius_tests.py
```

Should print `43/43 passed.`

## License

Private project. All rights reserved.
