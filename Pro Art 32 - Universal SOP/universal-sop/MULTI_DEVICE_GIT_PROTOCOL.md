# 🔄 MULTI-DEVICE GIT PROTOCOL — Conflict-Proof Backup Across Devices
# VERSION: 1.0 | 2026-05-21 | For: Pushing project history from multiple devices safely

---

## 🎯 PURPOSE

You'll work on this project from multiple devices (Mac, other laptop, phone-clone, Codespaces, etc.). This protocol prevents:

- 🚨 Merge conflicts losing work
- 🚨 Force-push catastrophes overwriting other devices
- 🚨 Stale state on one device clobbering newer state on another
- 🚨 Obsidian conflicts (different vault states per device)
- 🚨 Claude Code session collisions

**Read this BEFORE working on any second device.**

---

## 🏷️ NEW PREREQUISITE (F.15 fix 2026-05-21): Device Registration

**Before ANY work on a device, ensure it's registered:**

```bash
# Check current device identity
git config user.email   # Should show: alan+DEVICE-NAME@local

# If shows generic (e.g., alan@local): register the device
bash scripts/setup_device.sh DEVICE_NAME
```

Then add to `DEVICE_REGISTRY.md` table.

**Why:** Every commit identifies which physical device made the change. Enables device-specific audit trails.

---

## 📜 COMMIT MESSAGE CONVENTION (F.15 fix 2026-05-21)

**Every commit message must include device + timestamp prefix:**

```
[device-name | YYYY-MM-DD HH:MM TZ] One-line summary
```

Examples:
- `[mac-main | 2026-05-21 17:30 CDT] F.15 fix: device registry + commit convention`
- `[laptop-2 | 2026-05-22 09:00 CDT] APW Module 4.1 Lesson 1 outline draft`

---

## 🔍 SESSION START CHECK (NEW — F.15 fix 2026-05-21)

**Before STEP 1 mandatory reads, run:**

```bash
bash scripts/check_device_activity.sh 7
```

This shows:
- Recent commits from all devices (last 7 days)
- Unpulled commits from other devices
- Files most modified
- Whether `git pull` is needed

**If other devices have pushed:** review their changes BEFORE starting work to avoid conflicts.

---

## 🛡️ THE 5 GOLDEN RULES (Never Break These)

### Rule 1 — ALWAYS Pull Before Work
```bash
cd universal-sop
git pull
```
**Why:** Get latest from any other device. Skipping = guaranteed conflict later.

### Rule 2 — ALWAYS Commit + Push After Work
```bash
git add -A
git commit -m "session N — [what you did]"
git push
```
**Why:** Other devices need to see your work. Skipping = your changes invisible to next device.

### Rule 3 — NEVER Force Push
```bash
# ❌ NEVER do this:
git push --force
git push -f
```
**Why:** Overwrites other devices' commits = destroys their work permanently.

### Rule 4 — NEVER Rewrite History
```bash
# ❌ NEVER do this on main branch:
git rebase
git reset --hard
git commit --amend (after push)
```
**Why:** Other devices have committed on top of the old history. Rewriting strands them.

### Rule 5 — ONE Device At A Time For Active Work
**Don't:**
- Edit on Device A while Device B's session is also active and unpushed.

**Do:**
- Finish + push on Device A → switch to Device B → pull → work → push → switch back.

### Rule 6 — APPEND-ONLY For History Files (F.15 fix 2026-05-21)
**Never delete content from:**
- `cache/SESSION_STATE.md` (decisions log)
- `cache/BACKUP_LOG.md` (change history)
- `cache/FAILURE_LEDGER.md` (failure patterns + fixes)
- `cache/CONTINUATION.md` (session summaries)

**Enforcement:** `bash scripts/append_only_check.sh` runs before commit. If file shrunk → commit blocked unless `--no-verify`.

**To "remove" content:** Archive instead. Move outdated content to `cache/legacy/archived_YYYY-MM-DD_topic.md`.

### Rule 7 — NEVER Delete Files (F.15 fix 2026-05-21)
**Files in `NEVER-DELETE LIST` (see DEVICE_REGISTRY.md):**
- All `cache/*` files
- All `cache/legacy/*`, `cache/backups/*`, `agents/archive/*`
- All `chat_archive/*` (full session transcripts)
- All top-level governance files (STANDALONE_SOP, SESSION_START, CLAUDE.md, MULTI_DEVICE_GIT_PROTOCOL, etc.)

**To "delete" a file:** Move to `cache/legacy/` with `archived_` prefix. Never `rm`.

---

## 🛡️ ANTI-DELETION & DEVICE-IDENTITY MEASURES (Added 2026-05-21 — Per Alan)

These are repo-wide structural safeguards on top of the 5 Golden Rules. They make device attribution + anti-deletion explicit at every level (file → commit → log) so nothing breaks and nothing gets silently dropped across the fleet (2 Strix Halos, Mac, desktop, more).

### 🏷️ Commit Message Convention (Device + Timestamp at High Frequency)

**Every** commit message must encode device + timestamp as a subject prefix. This makes `git log --oneline` legible across machines.

**Format:**
```
[<hostname>@<YYYYMMDD_HHMMSS>] <summary>
```

**Examples:**
```
[Aurelia@20260521_171500] checkpoint — universal backup rule + device identity
[strix-halo-2@20260522_093000] session 7 — APW Module 4.1 lesson 1 draft
[mac-studio@20260524_140000] merge: resolved SESSION_STATE conflict, both decisions kept
```

**Why:**
- `git log --oneline` immediately shows which device made which change.
- Timestamps disambiguate when commits arrive out of order from a slow-pushing device.
- Hostname matches the `<hostname>` segment in backup filenames (per UNIVERSAL BACKUP RULE Rule 3 in `SESSION_START.md`) — single source of truth.

**Discovery of hostname:**
| OS / Shell | Command |
|------------|---------|
| Any shell (cross-platform) | `hostname` |
| Windows PowerShell | `$env:COMPUTERNAME` or `hostname` |
| macOS | `hostname` or `scutil --get LocalHostName` |
| Linux | `hostname` or `hostnamectl` |

If a device gets renamed, both backup filenames AND commit subjects will diverge from prior runs — that's not a bug, that's how you spot the rename.

### 📦 Append-Only Files (Never Truncate, Never Remove Entries)

The following files are **structurally append-only.** Existing entries are immutable history. New entries are added at the bottom. Lines can be edited for typos/formatting; their content cannot be deleted.

| 📄 File | 📝 Why Append-Only |
|---------|--------------------|
| `cache/SESSION_STATE.md` § DECISIONS LOG | Decision history. Removing a row = losing the rationale for current state. |
| `cache/BACKUP_LOG.md` | Audit trail. Every modification logged. Removing = losing the trail. |
| `cache/FAILURE_LEDGER.md` | Failures we promised not to repeat. Removing = inviting recurrence. |
| `cache/CONTINUATION.md` § cumulative session log | Cross-session memory. Removing = handoff context lost. |
| `agents/archive/*` | Historically active agents. Removing = revisionism. |
| `backups/*` and `cache/backups/*` | The whole point of the system. Never deleted. |

**Merge convention for these files:** when `git pull` produces a conflict in an append-only file, **keep both blocks** and renumber if necessary. Never resolve by picking one side.

### ✅ Pre-Push Verification Checklist (Run BEFORE Every `git push`)

Mentally (or actually, with the commands) confirm:

- [ ] `git status --short` shows no unexpected `D ` (deletion) lines. Investigate before push.
- [ ] `git diff --stat HEAD` line counts make sense. Surprises mean stale state — pull first.
- [ ] Every modified file under git has a corresponding `backups/<file>_v<ver>_<YYYYMMDD>_<HHMMSS>_<hostname>_<reason>_backup.<ext>` entry staged in the same commit.
- [ ] Every modified file is logged in `cache/BACKUP_LOG.md` with the same device hostname.
- [ ] Commit message uses `[<hostname>@<timestamp>]` prefix per convention above.
- [ ] No `--force`, `--force-with-lease`, `--no-verify`, or `--amend` (after-push) flags. Ever.

### 🪤 Anti-Deletion Tripwire (Optional Pre-Commit Hook — Install Per Device)

Belt-and-suspenders: a pre-commit hook that blocks commits which delete tracked files outside `.gitignored` areas. Install on every device:

```bash
# In universal-sop repo root on each device:
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh
# UNIVERSAL BACKUP RULE — block deletion commits
deleted=$(git diff --cached --name-only --diff-filter=D)
if [ -n "$deleted" ]; then
  echo "🚨 pre-commit blocked: this commit deletes files:" >&2
  echo "$deleted" >&2
  echo "" >&2
  echo "Per UNIVERSAL BACKUP RULE (SESSION_START.md), deletions are forbidden." >&2
  echo "If a file genuinely must go: move it to backups/ first, then commit the move." >&2
  echo "(To bypass — DISCOURAGED — use: git commit --no-verify)" >&2
  exit 1
fi
EOF
chmod +x .git/hooks/pre-commit
```

**Caveat:** `.git/hooks/` is **per-device, not committed**. Each device must install the hook independently. The install command lives in this file so it's reproducible after any clone.

### 🕐 High-Frequency State Markers

Every state-tracking file should carry **device + timestamp at the point of last edit**, not just per session:

| Layer | Where the markers live | Frequency |
|-------|------------------------|-----------|
| Per-commit | Commit subject `[<hostname>@<timestamp>]` | Every commit |
| Per-edit | Backup filename `<…>_<hostname>_<reason>_backup.<ext>` | Every modification |
| Per-edit | `cache/BACKUP_LOG.md` row | Every modification |
| Per-session | `cache/SESSION_STATE.md` § DECISIONS LOG | Every decision |
| Per-session | `cache/CONTINUATION.md` handoff | Every session end |
| Per-file-version | File-header `# VERSION: X.Y | Last updated: YYYY-MM-DD [HH:MM] | Device: <hostname>` (preferred — older files use date-only, grandfathered) | Every meaningful structural edit |

The four highest-frequency markers (commit, backup filename, BACKUP_LOG row, decisions log) together guarantee no edit on any device is lossy — every change has at least 3 independent attribution paths.

---

## 📋 STANDARD WORKFLOW (Memorize This)

### Starting work on ANY device

```bash
cd universal-sop
git pull                           # GET latest
claude                             # launch Claude Code
```

In Claude Code, paste:
```
I'm picking up where I left off, please continue.
```

### During work (every ~30 min OR after major step)
Tell Claude:
```
Checkpoint and push.
```
Claude runs:
```bash
git add -A
git commit -m "checkpoint — [summary]"
git push
```

### Ending session
Tell Claude:
```
End session. Archive chat history. Update CONTINUATION.md and push.
```

Claude:
1. Runs `bash chat_archive/archive_chat.sh session_N_[label]` (saves full JSONL transcript)
2. Updates CONTINUATION.md handoff file
3. Commits everything (cache changes + chat archive)
4. Pushes to GitHub

This way the NEXT device pulls down BOTH the current state AND the full transcript of what just happened.

---

## 🚨 CONFLICT RESOLUTION PLAYBOOK

If `git pull` shows merge conflict:

### Scenario A — Cache File Conflict (Most Common)

Example: SESSION_STATE.md edited on both devices.

```bash
git pull
# CONFLICT (content): Merge conflict in cache/SESSION_STATE.md

# Open the file — you'll see:
# <<<<<<< HEAD
# [your changes]
# =======
# [other device's changes]
# >>>>>>> origin/main

# Resolution: KEEP BOTH (cache files are append-only — never delete entries)
# 1. Open file
# 2. Remove the <<<<<<<, =======, >>>>>>> markers
# 3. Keep both blocks of decisions (merge the decision logs)
# 4. Renumber if needed

git add cache/SESSION_STATE.md
git commit -m "merge: combined decisions from both devices"
git push
```

### Scenario B — SOP File Conflict (Critical Files)

Example: STANDALONE_SOP.md edited on both devices.

**Decision tree:**
- Both edits same section? → Keep newer logically (check git log dates)
- Different sections edited? → Easy — keep both
- Conflicting structural changes? → Tell Claude: "Resolve git conflict in STANDALONE_SOP.md by keeping the more comprehensive version + log F.X entry for the conflict"

### Scenario C — You Made A Mistake, Want To Undo

```bash
# Undo last commit but KEEP changes locally
git reset --soft HEAD~1

# Undo last commit AND throw away changes (DESTRUCTIVE — be sure)
git reset --hard HEAD~1
# WARNING: only do this if you haven't pushed yet
```

### Scenario D — Catastrophic — Other Device Force-Pushed (Recoverable?)

If someone (you on another device) accidentally force-pushed:

```bash
# Find the lost commit by SHA
git reflog                         # shows recent commits
# Restore
git reset --hard [SHA-of-lost-commit]
git push --force-with-lease        # safer than --force (fails if remote moved)
```

**Better:** Never force-push in the first place.

---

## 📓 OBSIDIAN MULTI-DEVICE STRATEGY

The repo is now also an Obsidian vault. Open the project folder in Obsidian.

### What's Shared (committed to git)
- `.obsidian/app.json` — core preferences (link format, attachment folder)
- `.obsidian/appearance.json` — theme/layout preferences

### What's Per-Device (excluded via .gitignore)
- `.obsidian/workspace.json` — open files/tabs (different per device)
- `.obsidian/workspace-mobile.json` — mobile-specific
- `.obsidian/cache` — cache (rebuilds per device)
- `.obsidian/plugins/*/data.json` — plugin state (per device)
- `.obsidian/graph.json` — graph view position
- `.obsidian/hotkeys.json` — keyboard shortcuts (personal)

### Obsidian Git Plugin (Optional Auto-Sync)
1. Install via Obsidian → Settings → Community Plugins → "Git"
2. Configure: auto-pull on startup, auto-commit + push every 10 min
3. This auto-runs the Rule 1 + Rule 2 workflow

**Trade-off:** Convenience vs control. If you want auto-sync, install the plugin. If you want explicit checkpoints, don't.

### Obsidian Conflict Recovery
Obsidian sometimes creates `.obsidian-conflict-[timestamp].md` files when sync detects parallel edits. The .gitignore already excludes the conflict file pattern. Resolve by manually reading both versions and merging.

---

## 🤖 CLAUDE CODE MULTI-DEVICE STRATEGY

### Claude Code Cache Is NOT Synced
- `~/.claude/projects/[project-id]/` — chat transcripts, per-device
- `.claude/settings.local.json` — local permissions, per-device (.gitignored)

**Implication:** Each device has its own Claude Code chat history. They DON'T share conversation memory.

### Bootstrap On New Device = Read Cache Files
The cache files (`cache/SESSION_STATE.md`, etc.) ARE synced via git. So Claude on the new device reads the SAME project state — but starts a fresh conversation.

**The continuity is in the FILES, not the chat.**

---

## 🚦 PRE-FLIGHT CHECKLIST FOR EACH DEVICE SWITCH

Before switching FROM device A:
- [ ] Did you commit and push the latest work?
- [ ] Did you update CONTINUATION.md if session is ending?
- [ ] Did you save any open Obsidian notes?

Before switching TO device B:
- [ ] Did you `git pull` first?
- [ ] Does git status show clean working tree?
- [ ] Are you in the right directory (`universal-sop/`)?
- [ ] Did Claude Code bootstrap correctly (read STEP 1 files)?

---

## 📊 EFFICIENCY TIPS

### Aliases For Faster Workflow

Add to `~/.zshrc` (or `~/.bashrc`):
```bash
alias uso='cd ~/universal-sop && git pull && claude'
alias usp='cd ~/universal-sop && git add -A && git commit -m "checkpoint" && git push'
alias uss='cd ~/universal-sop && git status'
```

Then on any device:
- `uso` → pull + launch Claude Code (Start)
- `usp` → checkpoint + push (Push)
- `uss` → status (Status)

### Branch Strategy (Optional)

If you experiment with structural changes, use a branch:
```bash
git checkout -b experiment-name
# ... work ...
git push -u origin experiment-name
# Open PR on GitHub if you want to review before merging
```

Main branch stays clean for production state.

---

## 🚨 ANTI-PATTERNS (Things That Will Cause Problems)

| ❌ Anti-Pattern | 🔥 Why It Breaks Things |
|----------------|-------------------------|
| Editing on 2 devices simultaneously without push between | Guaranteed merge conflict |
| Skipping `git pull` because "I'm only doing a quick thing" | Hidden state collision |
| `git push --force` because conflict is annoying | Destroys other device's commits |
| Deleting cache files instead of merging | Loses decision history |
| Using `git rebase` on main | Strands other devices |
| Editing `.obsidian/workspace.json` then committing it | Pollutes shared config with personal layout |
| Cloning into different paths on each device | `cd` commands inconsistent across devices |
| Forgetting to update CONTINUATION.md at session end | Next device misses context |

---

## 🔧 IF EVERYTHING BREAKS (Nuclear Option)

If git history is corrupted beyond repair on a device:

```bash
# On the BROKEN device, save your local changes if any:
cp -r universal-sop universal-sop-backup-$(date +%Y%m%d)

# Delete the broken local copy
rm -rf universal-sop

# Fresh clone
gh repo clone xprimordius/universal-sop
cd universal-sop
git pull

# Manually copy back any unique work from the backup folder
# Commit those as a new commit
```

**This always works** because GitHub remote is the source of truth.

---

## 🎯 ONE-LINE SUMMARY

> Pull before work. Push after work. Never force. Never rewrite history. One device active at a time. When conflicts happen, keep both versions in cache files (append-only), merge SOP files thoughtfully. Trust GitHub as source of truth.

---

## 📋 RELATED FILES

- `SESSION_START.md` — bootstrap procedure (already has Rule 1 + 2 references)
- `SHIP_INSTRUCTIONS.md` — setup on new device
- `HARNESS_REFRESH_GUIDE.md` — Claude Code harness drift handling
- `cache/CONTINUATION.md` — latest session handoff (key file for cross-device continuity)
- `cache/SESSION_STATE.md` — current position (append-only decisions log)

---

*SOP v1.3 | This file: MULTI_DEVICE_GIT_PROTOCOL.md v1.0 | Multi-device backup hygiene | 2026-05-21*
