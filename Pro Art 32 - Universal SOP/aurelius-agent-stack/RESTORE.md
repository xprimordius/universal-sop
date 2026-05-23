# Restore Aurelius on a New Machine

Use this if you:
- Got a new Windows workstation (e.g., Dell Area 51 with 5090)
- Reinstalled Windows
- Want to run Aurelius on a second machine
- Lost your local files and need to rebuild

Prerequisites on the target machine:
- Windows 11 Pro (or 10)
- Python 3.12 installed
- LM Studio installed + your models downloaded (Llama 3.3 70B, Gemma 4B, Whisper)
- GitHub CLI: `winget install GitHub.cli` then `gh auth login`

---

## 1. Clone both repos

```cmd
:: Code
cd %USERPROFILE%\Desktop
mkdir "Claude Codde 5.19.2026" 2>nul
cd "Claude Codde 5.19.2026"
gh repo clone aurelius-agent-stack agent-stack

:: Vault
mkdir "%USERPROFILE%\Documents\The Beginning" 2>nul
cd "%USERPROFILE%\Documents\The Beginning"
gh repo clone aurelius-vault Aurelius
```

## 2. Recreate the virtual environment

```cmd
cd "%USERPROFILE%\Desktop\Claude Codde 5.19.2026"
python -m venv agent-stack-venv
agent-stack-venv\Scripts\activate
pip install --upgrade pip
pip install ^
    faster-whisper ^
    silero-vad ^
    sounddevice ^
    numpy ^
    openai ^
    kokoro ^
    openwakeword ^
    onnxruntime ^
    torch ^
    open-interpreter
```

## 3. Start LM Studio + load your model

Open LM Studio. Make sure `meta/llama-3.3-70b` and `google/gemma-4-e4b` are downloaded.
The launcher will load them on first run.

## 4. Test

```cmd
cd "%USERPROFILE%\Desktop\Claude Codde 5.19.2026\agent-stack"
agent-stack-venv\Scripts\python.exe tests\aurelius_tests.py
```

Should print `43/43 passed.`

## 5. Launch Aurelius

```cmd
launch_voice_agent.cmd
```

## 6. (Optional) Schedule the daily agents

```cmd
install_daily_schedule.cmd
```

## 7. (Optional) Set up cloud access

See `..\Documents\The Beginning\Aurelius\Reference\Cloud-Access-Setup.md`.

---

## What's in each repo

| Repo | Contents | Size |
|---|---|---|
| `aurelius-agent-stack` | Python code, tests, launchers, agents/ package | ~216 KB |
| `aurelius-vault` | Conversations, memory, goals, reflections, Reference/ | ~308 KB |

**Neither repo contains models or virtual environments.** Those are re-downloaded /
re-built on the target machine.

---

## Keeping the backup current

Both repos are private. To push updates:

```cmd
cd "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack"
git add . && git commit -m "your message" && git push

cd "C:\Users\light\Documents\The Beginning\Aurelius"
git add . && git commit -m "your message" && git push
```

#restore #backup #github #aurelius
