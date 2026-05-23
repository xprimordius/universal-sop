# 🚀 AURELIUS BOOTSTRAP — Master Run-of-Show

> **Claude Code: when a user points you at this file, execute every step in order. Don't skip any. Verify each step before moving to the next.**

> **User**: paste the one-line master prompt at the bottom of this file into a fresh Claude Code session on any device. Claude does the rest.

---

## Step 0 — Determine OS + project root

### Step 0.5 — Drift detector (Op 26)

Before trusting anything cached in this session, check whether on-disk state has moved:

| Symptom you see | Reality check | What it means |
|---|---|---|
| "I remember the latest op was N" (without re-reading) | `grep "^## Operation" Reference/Operations-Log.md | tail -3` | If N doesn't match the latest entry, you have stale cached state. Re-read. |
| `Goals/Status.md` says "21 ops" | Compare to git log count `git log --oneline | wc -l` | Doc drift; trust the file, not memory |
| `Checkpoints/LATEST.md` exists | `cat Checkpoints/LATEST.md` first line date | If date is days old, treat as historical not current |
| Vault path uncertain | `python -c "from aurelius_paths import VAULT_DIR; print(VAULT_DIR)"` | Authoritative — never guess |

**Precedence rule**: on-disk file ALWAYS wins over cached memory of an earlier session. If you can't reconcile, re-read the file. Do not improvise.

Detect the OS the user is on (uname / systeminfo). Set `AURELIUS_ROOT`:
- **Windows**: `C:/aurelius/`
- **macOS/Linux**: `~/aurelius/` (resolves to `/Users/{name}/aurelius/` or `/home/{name}/aurelius/`)

Inside `AURELIUS_ROOT`, two folders should exist:
- `aurelius-agent-stack/`
- `aurelius-vault/`

If they DON'T exist, do Step 1. If they DO exist, skip to Step 2.

---

## Step 1 — Clone repos (only if missing)

```bash
mkdir -p "$AURELIUS_ROOT" && cd "$AURELIUS_ROOT"
gh repo clone xprimordius/aurelius-agent-stack
gh repo clone xprimordius/aurelius-vault
```

If `gh` isn't installed, stop and tell the user:
> Install GitHub CLI first. Windows: `winget install GitHub.cli`. macOS: `brew install gh`. Linux: `sudo apt install gh`. Then run `gh auth login`, sign in as `xprimordius`, run `gh auth setup-git`, then re-invoke me.

### Step 1b — Install Python deps (only if `.venv/` missing in agent-stack)

```bash
cd "$AURELIUS_ROOT/aurelius-agent-stack"
# Windows: setup.cmd  | macOS/Linux: bash setup.sh
```

The setup script creates `.venv/`, pip-installs `requirements.txt`, and runs the test harness as a smoke test. Tests should report `81/81 passed.` If pip fails, stop and surface the error — do NOT proceed to Step 2 until deps install cleanly.

---

## Step 2 — Verify per-device identity (only if missing)

Check `~/.aurelius-device-id`. If it doesn't exist:

1. Ask the user: "What unique name should this device have? Examples: 'MacBook-Travel', 'Aurelion-Office', 'Linux-Server'."
2. After they reply with `<NAME>`:

```bash
echo "<NAME>" > ~/.aurelius-device-id

cd "$AURELIUS_ROOT/aurelius-vault"
git config user.name "Alan @ <NAME>"
git config user.email "alan+<name-lowercase>@local.aurelius"

cd "$AURELIUS_ROOT/aurelius-agent-stack"
git config user.name "Alan @ <NAME>"
git config user.email "alan+<name-lowercase>@local.aurelius"
```

Confirm: `cat ~/.aurelius-device-id` should print the name.

---

## Step 3 — Pull latest from GitHub (always)

```bash
cd "$AURELIUS_ROOT/aurelius-vault" && git pull --rebase
cd "$AURELIUS_ROOT/aurelius-agent-stack" && git pull --rebase
```

If either fails with merge conflicts, stop and tell the user to read `aurelius-vault/Reference/Multi-Device-Sync-Protocol.md` § "Conflict scenarios".

---

## Step 4 — Load full project state (read these files in order)

These are the canonical bootstrap files. Read EACH one fully:

1. `aurelius-vault/LIBRARY.md` — master catalog of every folder
2. `aurelius-vault/Checkpoints/LATEST.md` — where we are RIGHT NOW
3. `aurelius-vault/Reference/Operations-Log.md` — chronological history of every operation shipped
4. `aurelius-vault/Reference/Agent-Roster.md` — all 13 specialist agents (11 in runner + 2 Claude-dispatched)
5. `aurelius-vault/Reference/Aurelius-Master-SOP.md` — the operating manual
6. `aurelius-vault/Reference/Failure-Modes-and-Resolutions.md` — what could go wrong + how it's mitigated
7. `aurelius-vault/Reference/Multi-Device-Sync-Protocol.md` — push/pull safety
8. `aurelius-vault/Reference/PROVE-IT-Protocol.md` — the verification protocol every op runs (Op 24+)
9. `aurelius-vault/Reference/GOLD-PATH-Protocol.md` — research SOTA before recommending any new component (Op 38+)
10. `aurelius-vault/Reference/EMULATE-OR-EXCEED-Protocol.md` — benchmark against best public reference before building (Op 42+)
11. `aurelius-vault/Reference/BACKUP-STATUS-Protocol.md` — visible backup confirmation block at end of every op (Op 44+)
12. `aurelius-vault/Goals/Status.md` — current goals + position + queue
13. `aurelius-vault/Sessions/` — find the MOST RECENT file (sort by date desc) and read it. This is the previous session's summary.

Expected token cost: ~27-32K cold. Plan for it.

### Step 4 fast-path — `--continuation` mode (~8K, Op 26)

If you're continuing on the SAME device, SAME project, and the most recent session ended within ~24h (check `Checkpoints/LATEST.md` timestamp), you can skip files 1, 4, 5, 6, 7, 8 (master catalog, agent roster, SOP, failure modes, sync protocol, PROVE-IT — all should still be in your cached memory from the last session). Read only:

1. `Checkpoints/LATEST.md` — diff vs your memory
2. Most recent `Sessions/*.md` — what happened last
3. `Goals/Status.md` — current queue

Then run Step 5 health check anyway (it's cheap and catches drift).

**Cold-start (new device / new chat / ≥24h gap) = read all 10**. Warm continuation = these 3 + health check.

If you're not sure, do the cold-start. The 20K extra tokens are cheaper than a fidelity gap.

---

## Step 5 — Health check (VISIBLE — print this table to the user)

This is the standing bootstrap quality-check. Run every probe, then render the table verbatim so the user sees ✅/⚠️/❌ for every line. Do NOT collapse this into "everything looks good" prose — the value is the row-by-row visibility.

### 5.1 Foundational / operational

Probe each of these and emit a row:

| # | Check | How to verify |
|---|---|---|
| 1 | OS detected | `uname` or `systeminfo` — state version |
| 2 | `AURELIUS_ROOT` resolved | echo the path used |
| 3 | `aurelius-agent-stack/` present | `ls` the dir |
| 4 | `aurelius-vault/` present + all 18 folders | `ls` vault root |
| 5 | Device identity set | `cat ~/.aurelius-device-id` |
| 6 | Git author configured (agent-stack) | `git config user.name` MUST be `Alan @ <device-id>`. If not, FIX NOW (re-run Step 2 commands) |
| 7 | Git author configured (vault) | Same as #6 in vault repo |
| 8 | Repos pulled clean (both) | `git status -s` empty + `git log -1` shown |
| 9 | GitHub auth (`gh`) working | The clone in Step 1 succeeded, or `gh auth status` if pre-existing |
| 10 | Python available | `python --version` |
| 11 | Test harness can find its deps | Try `python tests/aurelius_tests.py` from a fresh shell. If it fails on imports, locate the venv (legacy path: `C:/Users/light/Desktop/Claude Codde 5.19.2026/agent-stack-venv/`) and re-run with that interpreter. Note WHICH interpreter worked |
| 12 | Test suite passing | Report the exact `N/N passed` line |
| 13 | Last checkpoint readable | `Checkpoints/LATEST.md` op number + tests count |
| 14 | Most recent session capture present | Newest `Sessions/*.md` + matching JSONL + transcript in `Archive/` |
| 15 | Claude-Code memory mirror | `vault/Memory/Claude-Code-Memory/` exists |

### 5.2 Agents — every specialist, role, presence

Render a table of all 13 agents (2 Claude-dispatched + 11 autonomous in `agents/run_agents.py`). For each: name, type, one-line role, code-file present (✅/❌), in-runner (✅/❌/n/a). Source of truth: `Reference/Agent-Roster.md` + `agents/run_agents.py` AGENTS list. Flag any drift between docs and code.

### 5.3 Ultimate objective alignment

Pull from `Reference/Aurelius-Master-SOP.md §0` (mission) and `Goals/Status.md` (DoD scoreboard). Print:
- One-sentence mission restatement
- Definition-of-Done count: `<shipped>/<total>` per Master-SOP §9
- Top 3 queued milestones from `Goals/Status.md`

### 5.4 User intent / prompts

- Verbatim archive: most recent `Sessions/Archive/*.transcript.md` present? (✅/❌)
- Structured ledger: `Intent/Master-Intent.md` present + last entry date
- Capture mechanism: Stop hook wired (check `~/.claude/settings.json` for `on_claude_stop.cmd`)
- Last session turn counts (from newest `Sessions/*.md` frontmatter)

### 5.5 Backup redundancy (the 4+ copies)

| Copy | Verify |
|---|---|
| Local disk (canonical) | `ls` the vault path |
| Local git | `git log -1` in vault |
| GitHub `xprimordius` | `git ls-remote origin HEAD` matches local HEAD |
| GitHub `Awake999` mirror | If a mirror remote exists, `git ls-remote <mirror> HEAD` — else flag as ⚠️ "not verified this session" |
| Legacy vault path | If `C:/Users/light/Documents/The Beginning/Aurelius/` exists, note it — daily routine may still be writing there |

Or just run `python backup_status.py` — it probes all layers and emits the standard block. Use that block at end of every op writeup per BACKUP-STATUS-Protocol.md.

### 5.8 Obsidian state (Op 46 + Op 47 — canonical: parent-folder pointing)

**Canonical setup as of Op 47**: Obsidian is opened on `C:/aurelius/` (the parent of `aurelius-vault/` and `aurelius-agent-stack/`). Both repos appear as one big vault view — graph view connects code + docs. The `.obsidian/` config lives at `C:/aurelius/.obsidian/` — outside both git repos.

**Cross-device sync** (R-008 permanent fix): `agent-stack/mirror_obsidian.py` mirrors the shared config into `vault/Memory/Obsidian-Config/` (which IS in vault git). Per-device noise (`workspace.json`, cache, plugin internal data) is excluded.

Probe at bootstrap:
- `C:/aurelius/.obsidian/` exists?  → expected ✓ on Aurelion-Primary
- `vault/Memory/Obsidian-Config/` exists?  → expected ✓ (mirror present)
- `python mirror_obsidian.py --verify`  → reports OK / DRIFT
- Obsidian registry: `cat ~/AppData/Roaming/obsidian/obsidian.json` lists which folder Obsidian has been opened on (sanity check)

**Restore on a new device** (after `gh repo clone`):
```bash
python agent-stack/mirror_obsidian.py --restore
# Then open Obsidian → "Open folder as vault" → C:/aurelius/
```

**Refresh after Obsidian config changes** (new theme, hotkey, plugin):
```bash
python mirror_obsidian.py            # mirror local → vault
python safe_push.py --repo all "msg"  # commit + push
```

If `.obsidian/` is found at a different location (vault folder or legacy `Documents/The Beginning/Aurelius/`), flag it as drift — the canonical setup is parent-folder pointing.

### 5.7 My understanding (Claude restates project state in own words — Op 26 gap closure)

After all probes above, write a 4-bullet self-restatement so the user sees you actually comprehend the project, not just inventoried files:

- **Mission (one sentence)**: What is Aurelius and what is it for?
- **Where we are**: Latest op number, what shipped most recently, current test count
- **What I just verified**: Concrete file paths + commands you exercised this session (not what BOOTSTRAP.md *says* to verify — what you actually ran)
- **What I'd do next if you said "go"**: Top one from Goals/Status.md queue, OR the most pressing item from Op N's foresight section, with a 1-line "why this first"

This is the proof you read the files vs. just listed them. If you can't write this section without re-reading, re-read.

### 5.6 Surface issues, don't hide them

Close the health check with a "Real issues this surfaced" block: P0/P1/P2 rows for anything that came back ⚠️ or ❌. Do NOT skip this even if everything is green — write "no issues this boot" explicitly so the absence is intentional, not forgotten.

**Hard rule**: do not advance to Step 6 if any row in §5.1 is ❌, or if §5.2 shows a code-file ❌, without explicitly telling the user "X is broken, do you want me to fix it before continuing?"

---

## Step 6 — Report ready to the user

Tell the user, briefly:
> ✅ Bootstrap complete on this device. Read [N] files (~[X]K tokens). State restored through Op [last-op-number], [N]/[N] tests passing, [N] agents in runner. Device ID: `<NAME>`. Ready to continue.
>
> Goals/Status.md has the queued items. The top three are: [list top 3 from queue]. What would you like to tackle?

---

## Step 7 — Workflow conventions (apply going forward)

For the rest of this session and every future session:

- **Pushing**: use `python "$AURELIUS_ROOT/aurelius-agent-stack/safe_push.py" "what you did"` — never raw `git push`
- **Capturing**: auto-fires on session end via Stop hook (if configured); otherwise manual `python session_capture.py`
- **Checkpointing**: `python checkpoint.py --note "your note"` at any meaningful pause
- **Daily routine**: scheduled at 8 AM via Task Scheduler (Windows) / launchd (Mac) / cron (Linux)
- **Multi-item asks**: Claude relays back a checklist BEFORE acting (SOP per `feedback_sop_alignment_checklist.md` in Claude memory)

---

## THE ONE MASTER PROMPT TO PASTE IN A NEW CHAT

Copy-paste this into a fresh Claude Code session on any device:

```
You're booting Aurelius on this device. Follow the BOOTSTRAP.md run-of-show.

If ~/aurelius/aurelius-agent-stack does NOT exist (or C:/aurelius/aurelius-agent-stack on Windows), first run:
  mkdir -p ~/aurelius && cd ~/aurelius
  gh repo clone xprimordius/aurelius-agent-stack
  gh repo clone xprimordius/aurelius-vault

Then read ~/aurelius/aurelius-agent-stack/BOOTSTRAP.md and execute every step exactly as written.
```

That's it. One block, paste, done. Claude clones (if needed) + reads BOOTSTRAP + executes everything + reports ready.

---

## Quick reference — what the master prompt accomplishes

| Capability after bootstrap | Status |
|---|---|
| Full project state (20 ops, all decisions) | ✅ |
| Read every word ever said in past chats | ✅ |
| Per-device identity registered | ✅ |
| Multi-device safe push enabled | ✅ |
| All 12 agents named + roles understood | ✅ |
| Failure modes + recovery known | ✅ |
| Current goals + queue understood | ✅ |
| Ready to push commits with attribution | ✅ |

---

#bootstrap #cold-start #master-prompt #aurelius
