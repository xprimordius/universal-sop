# Local desktop agent — runbook

Stack overview, launch/kill commands, log locations, and known caveats.

## Stack as built

| Layer | Component | Path / endpoint |
| --- | --- | --- |
| Runner (primary) | LM Studio 0.4.6 + llama.cpp Vulkan 2.14.0 | `C:\Users\light\AppData\Local\Programs\LM Studio\LM Studio.exe` |
| Runner (fallback) | Ollama 0.24.0 | `C:\Users\light\AppData\Local\Programs\Ollama\ollama.exe` |
| Model | Qwen3.6-35B-A3B Q4_K_M + BF16 mmproj | `C:\Users\light\.lmstudio\models\lmstudio-community\Qwen3.6-35B-A3B-GGUF\` |
| API (LM Studio) | OpenAI-compat | `http://localhost:1234/v1` — identifier `qwen-agent` |
| API (Ollama) | Native + OpenAI-compat | `http://localhost:11434/api/generate` — model `qwen-agent:latest` |
| Agent | Open Interpreter 0.4.3 | venv: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv` |
| MCP: filesystem | `@modelcontextprotocol/server-filesystem` v2026.1.14 | via `npx -y` |
| MCP: browser | `@playwright/mcp@latest` v0.0.75 (substitutes the non-existent `@modelcontextprotocol/server-playwright`) | via `npx -y` |
| MCP: fetch | `mcp-server-fetch` v2025.4.7 (substitutes the non-existent `@modelcontextprotocol/server-fetch`) | venv `python -m mcp_server_fetch` |
| System prompt | `agent_system_prompt.md` | `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\agent_system_prompt.md` |
| MCP client config | `mcp_config.json` | `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\mcp_config.json` |
| Logs | various | `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-logs\` |

## Voice-stack dependencies (separate from `requirements.txt`)

`requirements.txt` covers the core stack (numpy, torch, openai, fastapi, etc.) — enough to import `voice_agent.py` and run the test harness. The **voice runtime** is lazy-loaded, so these packages are only needed when you actually launch the voice agent. Install them in the same venv:

```powershell
.venv\Scripts\python.exe -m pip install `
    faster-whisper==1.2.1 `
    silero-vad `
    kokoro `
    openwakeword `
    "setuptools<81" `
    onnxruntime sounddevice soundfile
```

Plus the Piper TTS binary (or piper-tts wheel) lives under `piper-voices/`; that ships in the repo, no install needed.

If you only need agents + tests (daily routine, QA agent, etc.), skip this section — `requirements.txt` is enough.

## Launch

### Voice mode (push-to-talk) — recommended

Double-click `agent-stack\launch_voice_agent.ps1`, or:

```powershell
powershell -File "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\launch_voice_agent.ps1"
```

The launcher boots LM Studio's server and loads the model if needed, then starts the voice loop. Once you see `[voice] Push-to-talk ready.`:

- **Ctrl + Shift + Space** — tap once to start recording, tap again to stop and submit
- **Ctrl + Shift + Q** — quit cleanly

Whisper (faster-whisper `small.en`, int8 CPU) transcribes locally; nothing leaves the machine. First model load downloads ~466 MB to `~/.cache/huggingface/`; subsequent launches start in ~2s.

### Text mode (no voice)

```powershell
& "C:\Users\light\.lmstudio\bin\lms.exe" server start
& "C:\Users\light\.lmstudio\bin\lms.exe" load qwen/qwen3.6-35b-a3b `
    --gpu max --context-length 65536 --identifier qwen-agent -y

# Interactive
& "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv\Scripts\python.exe" `
    "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\qwen_agent_profile.py"

# One-shot
& "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv\Scripts\python.exe" `
    "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack\qwen_agent_profile.py" `
    "Open Notepad and type hello"
```

## Kill

```powershell
# Unload model (frees ~20 GiB)
& "C:\Users\light\.lmstudio\bin\lms.exe" unload qwen-agent

# Stop LM Studio's HTTP server
& "C:\Users\light\.lmstudio\bin\lms.exe" server stop

# Stop Ollama (if it was used)
Get-Process ollama* -ErrorAction SilentlyContinue | Stop-Process

# Quit LM Studio entirely (optional — server-only commands above don't quit the app)
Get-Process "LM Studio" -ErrorAction SilentlyContinue | Stop-Process
```

## Log locations

| Log | Path |
| --- | --- |
| LM Studio server logs | LM Studio app → "Developer" tab |
| MCP smoke test | `agent-stack-logs/mcp-smoke.log` |
| Open Interpreter install | `agent-stack-logs/open-interpreter-install.log` |
| Notepad validation | `agent-stack-logs/notepad-validation.log` |
| E2E validation (latest) | `agent-stack-logs/e2e-validation-run4.log` |
| E2E transcript JSON | `agent-stack-logs/e2e-transcript.json` |
| Validation screenshot (small) | `agent-stack-logs/validation-screenshot.png` |

## Observed performance (Qwen3.6 35B-A3B Q4_K_M on Vulkan, ctx 65536)

| Workload | tok/s | Notes |
| --- | --- | --- |
| Text-only, thinking on | **27 tok/s** | Sustained 174 tokens, "2+2" → "4" |
| Vision (small 640×480 PNG), thinking on | **33 tok/s** | 326 prompt tokens (image-embedded) + 513 completion tokens |
| Ollama text (CPU fallback — `OLLAMA_VULKAN=1` is set but mainline Ollama 0.24 does not honor it) | **9 tok/s** | Loaded via Modelfile referencing the same GGUF; ~21 GB |

## Known caveats & fixes

1. **Qwen3.6 always thinks first.** Default thinking mode burns most token budget on `reasoning_content` before any actual answer arrives in `content`. Set `max_tokens` ≥ 1024 for chat, ≥ 4096 for agent tasks. `chat_template_kwargs.enable_thinking: false` is **ignored** by LM Studio's server; the only way to disable thinking is via the LM Studio UI / `model.yaml` (`customFields.enableThinking`).
2. **Vision payload 400 on full-resolution screenshots.** A 2560×1600 PNG (~1 MB base64) intermittently returns HTTP 400. Resize to ≤1024px on the long edge before sending — works reliably. The agent profile should `PIL.Image.thumbnail((1024,1024))` before any vision call.
3. **Agent screenshots whatever window has focus.** During E2E retry 3 the agent ran `subprocess.Popen('start https://...')` then `ImageGrab.grab()`, capturing the foreground window (LM Studio) rather than the newly opened browser. Production fix: either focus the browser window first (`pyautogui.hotkey('alt','tab')` after launch + sleep) **or** route browser tasks through `@playwright/mcp` which captures inside its own browser context without needing OS focus.
4. **PowerShell execution policy blocks `npm.ps1`.** Use `npm.cmd` / `npx.cmd` directly; both work without changing the policy.
5. **`pkg_resources` deprecation warning** on every Open Interpreter invocation — harmless; pinned setuptools to <81 to keep the API alive until OI updates.
6. **`open-interpreter` ↔ `mcp` dependency conflict** on `starlette`. `mcp 1.27.1` pulls in `starlette 1.0.0`; OI wants `<0.38.0`. Doesn't break OI's terminal mode (validated post-install). If OI's async/server mode breaks later, split into two venvs.
7. **96 GB UMA target not met.** Currently 3.8 GB dedicated + 61.8 GB shared = 65.6 GB display memory. Q4_K_M model + 65k ctx + mmproj fits comfortably, so no functional problem. Revisit BIOS UMA Frame Buffer Size only if larger context or unquantized weights are needed.

## Validation results

| Step | Status | Notes |
| --- | --- | --- |
| 1 — Env audit | PASS | Documented in opening report |
| 2 — Runners | PASS | LM Studio 27 tok/s text, 33 tok/s vision; Ollama 9 tok/s text (CPU fallback) |
| 3 — Open Interpreter Notepad task | PASS | Notepad opened and "hello" typed end-to-end in 121s |
| 4 — MCP smoke | PASS (3/3) | filesystem (14 tools), playwright (23 tools), fetch (1 tool) |
| 5 — System prompt | PASS | `agent_system_prompt.md` saved |
| 6 — APW E2E | PASS with caveat | Browser opened, screenshot saved, vision summary works in isolation. Agent captured the wrong window (LM Studio in foreground vs APW in background) — see caveat #3 above. |
