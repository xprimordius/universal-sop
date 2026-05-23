---
date: 2026-05-21
type: setup-guide
tags: [setup, migration, new-device, bootstrap, cold-start, aurelius]
related: ["[[index]]", "[[LIBRARY]]", "[[Multi-Device-Sync-Protocol]]"]
---

# New Device Migration — Cold Start to Full Continuity

Linked: [[index]] · [[LIBRARY]] · [[Multi-Device-Sync-Protocol]]

**Scenario**: You're on a brand-new machine. Nothing installed. Want to continue Aurelius work with full project state. Here's how.

---

## What you'll get

- ✅ Every chat (verbatim, 1018 KB of transcript)
- ✅ All 20 operations of code + decisions
- ✅ All 140+ vault notes
- ✅ Multi-device push attribution from this new machine
- ⚠️ Voice agent runtime (needs Python + LM Studio — separate)

**Time**: 10-15 min for chat continuity. +30 min for full runtime.

---

## Step 1 — Prerequisites (5 min)

| OS | Install |
|---|---|
| **Windows** | `winget install Git.Git GitHub.cli` |
| **macOS** | `brew install git gh` |
| **Linux** | `sudo apt install git gh` |

## Step 2 — Auth with GitHub (2 min)

```bash
gh auth login              # github.com → HTTPS → Y → web browser → sign in as xprimordius
gh auth setup-git          # configures git to use gh creds
```

## Step 3 — Clone both repos (1 min)

```bash
mkdir -p ~/aurelius && cd ~/aurelius
gh repo clone xprimordius/aurelius-vault
gh repo clone xprimordius/aurelius-agent-stack
```

You now have ~21 MB of full project state locally.

## Step 4 — Per-device identity (1 min — one time per device)

```bash
DEVICE_NAME="MacBook-Travel"   # pick something unique + meaningful

echo "$DEVICE_NAME" > ~/.aurelius-device-id

for repo in aurelius-vault aurelius-agent-stack; do
    cd ~/aurelius/$repo
    git config user.name "Alan @ $DEVICE_NAME"
    git config user.email "alan+$(echo $DEVICE_NAME | tr '[:upper:]' '[:lower:]')@local.aurelius"
done
```

## Step 5 — Verify

```bash
cd ~/aurelius/aurelius-vault
cat Checkpoints/LATEST.md | head -20
git log --oneline | head -5
```

Should show recent ops + checkpoint.

## Step 6 — Bootstrap a new Claude Code session

Paste in Claude Code (adapting paths to your clone location):

```
Read ~/aurelius/aurelius-vault/LIBRARY.md
then ~/aurelius/aurelius-vault/Checkpoints/LATEST.md
then ~/aurelius/aurelius-vault/Reference/Operations-Log.md
then ~/aurelius/aurelius-vault/Reference/Agent-Roster.md
then ~/aurelius/aurelius-vault/Reference/Aurelius-Master-SOP.md
then ~/aurelius/aurelius-vault/Reference/Failure-Modes-and-Resolutions.md
then ~/aurelius/aurelius-vault/Reference/Multi-Device-Sync-Protocol.md
then ~/aurelius/aurelius-vault/Goals/Status.md
then ~/aurelius/aurelius-vault/Sessions/2026-05-20-93a59399.md

You now have full project state. We're at 21 operations shipped, 81/81 tests, 13 agents (11 in runner + 2 Claude-dispatched).
Continue from where we left off — Goals/Status.md has the queue.
```

Cost: ~25-30K tokens. Fast, complete.

## Step 7 — Daily workflow on this new device

```bash
# Pull before working (in case other devices pushed)
cd ~/aurelius/aurelius-vault && git pull --rebase
cd ~/aurelius/aurelius-agent-stack && git pull --rebase

# Do your work — edit files, run Claude Code, etc.

# Push via the safety wrapper (NOT raw git push)
python ~/aurelius/aurelius-agent-stack/safe_push.py "what I did"

# Vault changes:
python ~/aurelius/aurelius-agent-stack/safe_push.py "vault note edited" --repo vault
```

Every commit shows `Alan @ MacBook-Travel` (or your chosen name). Sync-Log.md grows with each push, showing the audit trail of who/where/when.

---

## Optional — Run Aurelius runtime on this device (30 min)

If you want the VOICE AGENT to run here too (not just continue chats):

### Install Python 3.12+

| OS | Command |
|---|---|
| Windows | `winget install Python.Python.3.12` |
| macOS | `brew install python@3.12` |
| Linux | `sudo apt install python3.12 python3.12-venv` |

### Create venv + install deps

```bash
cd ~/aurelius
python3.12 -m venv agent-stack-venv

# Activate
source agent-stack-venv/bin/activate           # Mac/Linux
# or: agent-stack-venv\Scripts\activate.bat    (Windows cmd)

# Install (this is what voice_agent.py needs)
pip install faster-whisper kokoro silero-vad openwakeword \
            sounddevice torch openai mcp fastapi uvicorn unidiff
```

### Install LM Studio + models

1. Download [LM Studio](https://lmstudio.ai)
2. In LM Studio: download `meta/llama-3.3-70b` and `google/gemma-4-e4b`
3. Load both with identifiers `aurelius-fast` (Gemma) and `aurelius-full` (Llama)

### Important — paths in voice_agent.py are Windows-hardcoded

`voice_agent.py` references `C:\Users\light\...` literally. To run on Mac/Linux:
- Either symlink / mirror the Windows path
- Or do the cross-platform port (~6 hours) per Op 14 queue

For chat-continuity ONLY (Steps 1-7), this doesn't matter. You can clone, read, edit, and push everything without running voice_agent.py.

---

## Troubleshooting

### "gh repo clone failed"
- Verify Step 2 worked: `gh api user --jq .login` should return `xprimordius`
- If on a different network: try `gh auth refresh`

### "git push failed: permission denied"
- Same fix: `gh auth setup-git` reconfigures git to use gh's token

### "safe_push.py says risky pattern"
- Use `--force-allow` if intentional, otherwise revert your changes

### "Vault folder is in a weird location"
- Symlink it: `ln -s ~/aurelius/aurelius-vault "~/Documents/The Beginning/Aurelius"` (Mac/Linux)
- Or update path constants in agent scripts if you actually want to run them

### "git pull says merge conflicts"
- See `Multi-Device-Sync-Protocol.md` § "Conflict scenarios" — full playbook

---

## What survives across all this

The git history. The vault content. The operations log. The verbatim transcript archive. The audit trail. Every commit attributed.

You can move between any number of devices forever without losing any of it.

#setup #migration #new-device #cold-start
