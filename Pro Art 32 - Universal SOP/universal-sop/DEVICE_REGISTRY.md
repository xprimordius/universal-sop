# 🏷️ DEVICE REGISTRY — Named Devices For Multi-Device GitHub Use
# VERSION: 1.0 | 2026-05-21 | Per Alan's directive: "all devices are named, changes timestamped, files aren't deleted"

---

## 🎯 PURPOSE

Every device that touches this repo must be NAMED in commits so audit trail is clear.

**Why:** Currently all 28 commits show `Alan <alan@local>` — no way to tell which device did what. If a problematic commit happens, can't investigate "which device, when, why."

---

## 📋 REGISTERED DEVICES

| 🏷️ Device Name | 📅 Registered | 🔑 Git Email | 📝 Description | 🌐 Primary Use |
|----------------|:-------------:|--------------|----------------|----------------|
| `mac-main` | 2026-05-21 | alan+mac-main@local | MacBook in Downloads/APW_EXPORT folder | Primary development device |
| `aurelia` | 2026-05-21 | alan+aurelia@local | Windows Strix Halo (hostname `Aurelia`, user `nguye`, domain `AURELIA`); repo at `C:\Users\nguye\universal-sop` | Day-1 commissioning device, second Strix Halo expected |
| _add new devices here_ | _date_ | alan+devicename@local | _what device_ | _primary use_ |

---

## 🔧 SETUP ON EACH NEW DEVICE

When you add a new device (other laptop, codespaces, etc.):

### Step 1 — Register the device
Add a row to the table above. Pick a memorable name: `alan-laptop-2`, `alan-codespaces`, `alan-work-mac`, etc.

### Step 2 — Configure git locally (PER-REPO, not global)
```bash
cd path/to/universal-sop
git config user.name "Alan ($DEVICE_NAME)"
git config user.email "alan+$DEVICE_NAME@local"
```

Replace `$DEVICE_NAME` with the name from the registry (e.g., `mac-main`, `laptop-2`).

### Step 3 — Verify
```bash
git config user.name   # Should show: Alan (mac-main)
git config user.email  # Should show: alan+mac-main@local
```

### Step 4 — First commit from this device
```bash
git commit -m "register device: $DEVICE_NAME"
```

---

## 📜 COMMIT MESSAGE CONVENTION (NEW 2026-05-21)

**Every commit message must include:**

```
[device-name | YYYY-MM-DD HH:MM TZ] One-line summary

Detailed description if needed
- Bullet points
- Specific changes

Files modified: list (optional)
```

### Examples

```
[mac-main | 2026-05-21 17:30 CDT] F.15 fix: device registry + commit convention

- Added DEVICE_REGISTRY.md with named device table
- Updated git user.email format to include device name
- Pre-commit hook added to enforce convention
```

```
[laptop-2 | 2026-05-22 09:00 CDT] APW Module 4.1 Lesson 1 outline draft

- Created source_files/section_2/4.1.1_outline.md
- Linked to BUILD_STATE_CACHE per D15
```

### Why This Format?

| 🎯 Element | 📝 Why |
|:---:|--------|
| `[device-name]` | Audit: which physical device did this commit |
| `YYYY-MM-DD HH:MM TZ` | Audit: when + timezone (for distributed users) |
| One-line summary | Standard git practice |
| Body | Details for review |

---

## 🛡️ APPEND-ONLY PROTECTION (Cache Files)

Certain files are APPEND-ONLY — content should only be added, never deleted (preserves audit history):

| 📄 Append-Only File | 🚫 Operations Forbidden |
|---------------------|------------------------|
| `cache/SESSION_STATE.md` | Don't delete decisions log entries |
| `cache/BACKUP_LOG.md` | Don't delete backup records |
| `cache/FAILURE_LEDGER.md` | Don't delete F.X entries |
| `cache/CONTINUATION.md` | Don't delete session summaries (just rewrite header) |

**Editable but append-only inside:** Update sections at top (current state) but PRESERVE all historical entries below.

**Enforcement:** Pre-commit hook checks if any append-only file got SHORTER than its previous version. If yes → warning + abort.

---

## 🔄 MULTI-DEVICE CONCURRENT EDIT SAFETY

### When Pulling From Remote

If `git pull` shows another device has committed since your last pull:

```bash
# Identify what changed and from which device
git log HEAD..origin/main --pretty=format:"%h | %an | %ad | %s" --date=iso-local

# Review files modified
git diff HEAD..origin/main --stat
```

### Merge Strategy For Append-Only Files

If both devices appended to same cache file → guaranteed merge conflict.

**Resolution:** ALWAYS keep both devices' additions:
```bash
git pull
# CONFLICT in cache/SESSION_STATE.md
# Open file, find <<<<<<< markers, KEEP BOTH blocks
# Renumber if needed, preserve all decisions
git add cache/SESSION_STATE.md
git commit -m "[$DEVICE | $(date '+%Y-%m-%d %H:%M %Z')] merge: combined decisions from device-A + device-B"
git push
```

### Detection: "What Did Other Devices Just Do?"

Run before starting any session:
```bash
git fetch origin
git log HEAD..origin/main --pretty=format:"%h | %an | %ad | %s" --date=iso-local
```

If empty → no new device activity. Safe to proceed with FAST-PATH bootstrap.
If output → REVIEW first, then `git pull`, then COLD START bootstrap (state changed).

---

## 🚨 NEVER-DELETE LIST

These files have ZERO valid deletion reasons:

| 📄 File | 🚫 Why Never Delete |
|---------|---------------------|
| Any file in `cache/` | All cache content is preserved history |
| Any file in `cache/legacy/` | Historical reference, may need future |
| Any file in `cache/backups/` | Backup snapshots, recovery resource |
| Any file in `agents/archive/` | Fusion history (Jenny, Oversight, Cache Manager preserved) |
| Any file in `chat_archive/` | Full session transcripts, audit trail |
| `STANDALONE_SOP.md` | Self-contained rulebook, ship-ready |
| `SESSION_START.md` | Bootstrap entry point |
| `CLAUDE.md` | Claude Code project config |
| `MULTI_DEVICE_GIT_PROTOCOL.md` | This protocol's rules |
| `DEVICE_REGISTRY.md` | This file |
| `FAILURE_MODES_ANALYSIS.md` | Future failure mitigations |
| `TOKEN_OPTIMIZATION_GUIDE.md` | Multi-device optimization rules |

**To "remove" a file:** Move to `cache/legacy/` with prefix `archived_YYYY-MM-DD_filename.md`. Never `rm`.

---

## 📊 DEVICE ACTIVITY DASHBOARD

Track which devices are active:

```bash
# See per-device commit counts
git shortlog -sne

# See per-device recent activity (last 7 days)
git log --since="7 days ago" --pretty=format:"%an | %ad | %s" --date=short

# Find what specific device did in last week
git log --since="7 days ago" --author="mac-main" --oneline
```

---

## 🔧 SCRIPTS RELATED TO DEVICE MANAGEMENT

| 📄 Script | 🎯 Purpose |
|-----------|----------|
| `scripts/setup_device.sh` | One-command device registration + git config (TO BUILD) |
| `scripts/check_device_activity.sh` | Show recent activity by device (TO BUILD) |
| `scripts/append_only_check.sh` | Pre-commit hook for append-only protection (TO BUILD) |
| `scripts/compliance_check.sh` | Mechanical SOP compliance (EXISTS) |
| `scripts/consistency_check.sh` | Version drift detection (EXISTS) |

---

## 🎯 GUIDING PRINCIPLES

1. **EVERY commit identifies its device** — for audit + accountability
2. **APPEND-ONLY for history files** — never lose decisions/failures/backups
3. **PULL-BEFORE-WORK rule from MULTI_DEVICE_GIT_PROTOCOL.md still applies** — but now you can see WHICH device contributed
4. **NEVER `git push --force`** — destroys other devices' commits
5. **WHEN IN DOUBT** — verify other devices' state first via `git log HEAD..origin/main`

---

*Universal Output SOP v1.3 | DEVICE_REGISTRY.md v1.0 | Multi-device naming + safety | 2026-05-21*
