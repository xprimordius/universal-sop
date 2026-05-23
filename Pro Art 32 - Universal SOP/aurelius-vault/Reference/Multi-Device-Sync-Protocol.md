---
date: 2026-05-21
type: protocol
tags: [sync, multi-device, protocol, safety, audit, aurelius]
related: ["[[index]]", "[[LIBRARY]]", "[[Sync-Log]]"]
---

# Multi-Device Sync Protocol

Linked: [[index]] · [[LIBRARY]] · [[Sync-Log]]

**How to safely use Aurelius from multiple devices without losing work, creating conflicts, or making the trail confusing.**

---

## The golden rules

1. **Never `git push --force`** — overwrites history. Don't.
2. **Always use `safe_push.py`** — instead of raw `git push`.
3. **Set per-device git identity** — every commit is signed with the device name.
4. **Sync log is the source of truth** — `Sync-Log.md` records every push.

If you follow these four rules, **you literally cannot lose data** through normal use.

---

## Per-device git identity (one-time setup per machine)

On each new device, run this ONCE in each repo:

```bash
DEVICE=$(hostname)   # or whatever you want to call this machine
git config user.name "Alan @ $DEVICE"
git config user.email "alan+${DEVICE,,}@local.aurelius"
```

After that, EVERY commit from this device is signed:

```
Author: Alan @ Aurelion <alan+aurelion@local.aurelius>
Commit: ee063a3
Message: [Aurelion] Op 18: ship safe_push.py + ...

Device: Aurelion
Time: 2026-05-21T16:32:23
```

`git log --pretty='%h %an %s'` shows you instantly: which device made which commit.

---

## Daily workflow on ANY device

```bash
# 1. Pull latest before working
cd /path/to/repo
git fetch && git pull --rebase

# 2. Do your work — edit files, run scripts, whatever

# 3. Push via the safety wrapper
python safe_push.py "what you did"

# That's it. The script handles:
#   - fetching remote
#   - rebasing if remote moved
#   - detecting risky deletions
#   - signing with device + time
#   - logging the push
```

---

## What `safe_push.py` does on every push

| Step | What it does | Why |
|---|---|---|
| 1 | `git fetch origin main` | Get latest state from remote |
| 2 | Compare local vs remote | Detect if remote moved while you worked |
| 3 | If remote moved: `pull --rebase` | Replay your commits on top of remote's — no merge mess |
| 4 | `git add .` + diff scan | Stage everything + look for risky deletions |
| 5 | If risky: REFUSE unless `--force-allow` | Voice-agent.py, tests, MEMORY.md need explicit override |
| 6 | Commit with attribution | "Alan @ {device}" + trailer with full timestamp |
| 7 | `git push origin main` | Push the rebased + signed commit |
| 8 | Append to `Sync-Log.md` | Human-readable audit row |

---

## Risky patterns that trigger a warning

These get caught BEFORE the push, requiring `--force-allow` to proceed:

- Deletion of `voice_agent.py`
- Deletion of `aurelius_tests.py`
- Deletion of `MEMORY.md`
- Deletion of `master.jsonl`
- Changes to `.git/` internals

**Why warn but not block**: sometimes you genuinely need to reorganize. The point is to never do it by ACCIDENT.

---

## The audit trail

### `Sync-Log.md` — human-readable

Every push appends a row:

| Time | Device | Repo | Action | Commit | Message |
|---|---|---|---|---|---|
| 2026-05-21 16:32:24 | Aurelion | agent-stack | push | `ee063a3` | Op 18: ship safe_push.py... |

Read it in Obsidian. See exactly what happened, when, from which device.

### Git log — programmatic

```bash
git log --all --pretty='%h | %an | %ai | %s'

ee063a3 | Alan @ Aurelion | 2026-05-21 16:32:23 -0500 | Op 18: ...
16d52fc | Alan @ Aurelion | 2026-05-21 16:29:19 -0500 | Backup checkpoint
210f6e1 | Alan @ Aurelion | 2026-05-21 15:51:42 -0500 | Add LIBRARY.md
```

Every commit's author shows the device. Forever.

---

## Conflict scenarios (and what to do)

### Scenario A: "Remote has commits I don't have"

`safe_push.py` auto-handles this — it rebases your commits on top of remote's.

```
[safe-push] remote state: local ahead 3, behind 2
[safe-push] remote has new commits we don't have. Rebasing...
[safe-push] rebased cleanly.
[safe-push] committed abc1234
[safe-push] pushed.
```

You do nothing. It just works.

### Scenario B: "Rebase hit a real conflict"

Two devices edited the same lines in the same file. Git can't auto-merge.

```
[safe-push] REBASE CONFLICT — manual resolution required:
   CONFLICT (content): Merge conflict in Reference/Operations-Log.md
```

What to do:
1. Open the conflicted file in your editor / Obsidian
2. You'll see `<<<<<<<` and `>>>>>>>` markers around the conflict
3. Edit to keep what you want (usually both sides, merged)
4. `git add <fixed-file>`
5. `git rebase --continue`
6. Re-run `safe_push.py`

### Scenario C: "I accidentally deleted something on another device"

Don't panic. Git keeps EVERYTHING.

```bash
# See when the file was last present
git log --all --diff-filter=D --name-only --pretty='%h %s'

# Restore the file from the commit just before deletion
git checkout <hash>^ -- path/to/lost-file

# Commit + safe-push the restoration
python safe_push.py "restored accidentally-deleted file"
```

Deletions in git are NEVER permanent until you actively garbage-collect (which you don't do).

---

## Device Registry (structured — Op 26 upgrade from prose to table)

Source of truth for which devices participate in the mesh. Update on every new device registration. Each row links to the `~/.aurelius-device-id` value on that machine and the commit attribution it produces.

| Device ID | Role | Hardware | OS | Status | Git identity | Last seen | Notes |
|---|---|---|---|---|---|---|---|
| `Aurelion-Primary` | Primary brain + workstation | Strix Halo (Ryzen AI Max+ 395, 128 GB) | Win 11 Pro | ✅ active | `Alan @ Aurelion-Primary` | 2026-05-21 (Op 26) | Runs LM Studio + daily routine. Both vault dirs (canonical + legacy) exist on disk. |
| `Aurelion-Office` | Second Strix Halo | Strix Halo | Win 11 | 🔄 planned | `Alan @ Aurelion-Office` | — | Per Op 18 note (Alan has 2 Strix Halos) |
| _future_ `Mac-Travel` | Mobile work | MacBook | macOS | 🔄 planned | `Alan @ Mac-Travel` | — | Vault read/write, voice via cloud_relay |
| _future_ `iPhone` | On-the-go | iPhone | iOS | 🔄 planned | n/a (no git) | — | Obsidian Mobile + browser → cloud_relay |

### How to register a new device

```bash
# 1. Set the device ID file
python safe_push.py --set-device-id "Mac-Travel"

# 2. Configure git identity in both repos
cd $AURELIUS_ROOT/aurelius-agent-stack
git config user.name "Alan @ Mac-Travel"
git config user.email "alan+mac-travel@local.aurelius"
cd $AURELIUS_ROOT/aurelius-vault
git config user.name "Alan @ Mac-Travel"
git config user.email "alan+mac-travel@local.aurelius"

# 3. Make a checkpoint commit
python safe_push.py "register device Mac-Travel"

# 4. Add a row to the table above
```

### Append-only rule

Device rows can change status (planned → active → retired) but should never be deleted from the table. If a device is decommissioned, mark status `🗑️ retired (YYYY-MM-DD)` so audit trails remain intact.

To register a new device:
1. Pick a name (`hostname` or whatever)
2. `git config user.name "Alan @ {name}"` in both repos
3. Push a small commit (e.g., a checkpoint) to verify identity shows up
4. Add a row to this table

---

## What you DON'T do

- ❌ `git push --force` / `git push -f` / `git push --force-with-lease`
- ❌ `git reset --hard origin/main` without backup
- ❌ Edit `.git/` files directly
- ❌ Bypass `safe_push.py` unless you're doing maintenance
- ❌ Delete `Sync-Log.md` — it's the audit record

---

## What you ALWAYS do

- ✅ `python safe_push.py "message"` instead of `git push`
- ✅ Pull before starting work on a device that may be stale
- ✅ Commit small, frequent, descriptive
- ✅ Check `Sync-Log.md` periodically to see the trail

---

## Why this protocol prevents data loss

1. **Rebase before push** = you NEVER overwrite remote work
2. **No force-push** = git history is append-only
3. **Risky-pattern detection** = accidental deletes get caught
4. **Per-device attribution** = always know who/where
5. **Sync-Log audit trail** = full provenance, human-readable
6. **GitHub canonical remote** (`xprimordius/aurelius-vault` + `xprimordius/aurelius-agent-stack`) = 1 cloud copy
7. **Local .git on each machine** = N device copies of full history

Total redundancy: **N devices + 1 cloud account = N+1 places where the data lives**. Adding a second cloud mirror is queued (see Failure-Modes #15). For now, losing all copies requires simultaneous failure of every machine you own AND the `xprimordius` account.

#sync #protocol #multi-device #safety #audit
