---
date: 2026-05-23
type: risk-analysis
tags: [multi-device, multi-chat, race-conditions, sync, hygiene, aurelius]
related: ["[[Multi-Device-Sync-Protocol]]", "[[BACKUP-STATUS-Protocol]]", "[[Failure-Modes-and-Resolutions]]"]
---

# Multi-Chat / Multi-Device Race Risks (Live Continuation Hazards)

Linked: [[Multi-Device-Sync-Protocol]] · [[BACKUP-STATUS-Protocol]] · [[Failure-Modes-and-Resolutions]]

**Status**: Active risk register (introduced Op 46, 2026-05-23)
**Purpose**: Catalog risks that arise when Aurelius is used from **multiple Claude Code sessions on multiple devices simultaneously**, with safe_push + git pull happening live. Each row has: trigger condition, blast radius, current mitigation, residual risk, and proposed permanent fix.

---

## R-001 — Simultaneous pushes to the same file
**Trigger**: Device A edits `Operations-Log.md`. Before A pushes, Device B also edits the same file. B's push goes first; A's safe_push rebases and hits a content conflict.
**Blast radius**: A's push blocked. User intervention needed to resolve rebase.
**Current mitigation**: `safe_push.py` always rebases first (Op 18). Conflict raises a visible error. No silent data loss.
**Residual risk**: User confusion if they're not git-savvy.
**Permanent fix**: Op 46 candidate — `safe_push.py --pre-check` that warns "Device X pushed to this file 3 min ago — your edit may conflict" BEFORE you start editing.

## R-002 — Two chats claim the same op number
**Trigger**: Chat A reads "Op 45 is latest" → starts Op 46. Chat B (running parallel on same device or another) also reads "Op 45" → also starts Op 46. Both write Op 46 entries with different content. Last-pusher wins on git; first content lost.
**Blast radius**: One op entry overwritten. Code changes survive (separate files); only the Operations-Log entry collides.
**Current mitigation**: None today.
**Residual risk**: Real. Probability rises with more parallel chats.
**Permanent fix**: `op_close.py --claim` that atomically reserves the next op number by appending a stub entry FIRST (before doing the work). Or: pre-allocate op numbers in a `Reference/.ops-counter` file with file-lock.

## R-003 — Sync-Log append race
**Trigger**: Two safe_push calls running in the same ~1s window. Each reads `Sync-Log.md`, appends its row, writes. Second write loses first row.
**Blast radius**: One sync-log row missing. Forensic gap; commits still in git history.
**Current mitigation**: Probability is low (safe_push is human-driven, rarely truly simultaneous).
**Residual risk**: Low impact, low probability.
**Permanent fix**: Use append-only file mode (`open(path, "a")`) which is atomic on most filesystems for sub-page writes. Currently `safe_push.py:append_sync_log` already does this — verified safe within a single device. Cross-device race is git-resolved on next pull.

## R-004 — Settings.json device divergence
**Trigger**: Device A enables plugin X. Device B disables plugin Y. `~/.claude/settings.json` is local-only, never pushed. Devices diverge over time.
**Blast radius**: Per-device plugin/permission/hook differences. Aurelius behaves differently per device.
**Current mitigation**: Op 40 pruned 26 plugins; backup at `settings.json.pre-op40-prune.bak`. Op 40 foresight item (d) called for mirroring redacted settings into vault.
**Residual risk**: Quiet drift. New devices get stale settings.
**Permanent fix**: Op 47 candidate — `mirror_settings.py` that copies sanitized `settings.json` to `vault/Memory/Claude-Code-Memory/settings.json` periodically. Vault git then syncs across devices.

## R-005 — Public gist drift after vault changes from a non-Aurelion device
**Trigger**: Device B edits a protocol in vault, pushes to GitHub. B does NOT run `publish_protocols.py`. Aurelion-Primary (which holds the canonical gist refresh role) doesn't know. Gist stale until next manual refresh.
**Blast radius**: External AI consultants fetching the gist see outdated protocol.
**Current mitigation**: `publish_protocols.py --verify` detects drift on demand. No automation today.
**Residual risk**: Real. External consultants get stale data.
**Permanent fix**: Op 47 candidate — post-push hook in `safe_push.py` that runs `publish_protocols.py` automatically when vault/Reference/*.md changes. Or: any device that touches vault protocols becomes responsible for the refresh.

## R-006 — Uncommitted work blocks device-switch
**Trigger**: Device A in middle of Op 46 (~200 lines of uncommitted edits). User starts Chat B on Device B, does Op 47, pushes. Returns to A. A's next safe_push triggers rebase. If A's uncommitted edits touch the same files as B's Op 47, conflict.
**Blast radius**: Conflict resolution required; possible work loss if user resolves wrongly.
**Current mitigation**: Documented in Multi-Device-Sync-Protocol §"Conflict scenarios" (Scenario B).
**Residual risk**: User must remember to commit before device-switching.
**Permanent fix**: BOOTSTRAP §5 already covers this via "uncommitted file count" probe. Add §1.4 rule to Master-SOP: "before switching devices, commit pending OR explicitly note the work-in-progress in `Goals/Status.md`."

## R-007 — Daily routine fires on stale git
**Trigger**: Device A pushes a code change at 7:55 AM. Device B's daily routine fires at 8:00 AM without pulling first. B runs OLD code, pushes outputs based on old logic.
**Blast radius**: One day of slightly-stale agent outputs. Self-correcting next day.
**Current mitigation**: `run_daily_routine.cmd` Phase 0 (Op 27) checks gh auth; does NOT git pull first.
**Residual risk**: One day of mild staleness.
**Permanent fix**: Add `git pull --rebase` as Phase 0.5 in `run_daily_routine.cmd`, AFTER gh auth check and BEFORE agents.run_agents.

## R-008 — Obsidian config not in any repo
**Trigger**: `.obsidian/` lives at `C:/aurelius/.obsidian/` on Aurelion-Primary (Op 46 discovery). Not in `aurelius-vault` repo, not in `aurelius-agent-stack` repo. If device dies, Obsidian config lost.
**Blast radius**: Loss of theme, hotkeys, graph settings, plugins. Vault data itself safe.
**Current mitigation**: None — config is local-only.
**Residual risk**: Real. Trivial to lose on disk failure or device replacement.
**Permanent fix**: Op 47 candidate — copy `C:/aurelius/.obsidian/` into `vault/Memory/Obsidian-Config/` periodically. New devices restore from there. OR: move Obsidian to point at `C:/aurelius/aurelius-vault/` (the vault folder itself), commit `.obsidian/` directly into vault repo with proper gitignore for per-device noise (`workspace.json`, cache).

## R-009 — Agent-stack-logs not pushed
**Trigger**: `C:/Users/light/Desktop/Claude Codde 5.19.2026/agent-stack-logs/` contains `voice-agent.log`, `daily-routine.log`, agent run markers. Not in either git repo.
**Blast radius**: Forensic log history lost on device death.
**Current mitigation**: None.
**Residual risk**: Real. Recent ops debugging would lose context.
**Permanent fix**: Op 47 candidate — symlink or periodic copy of logs into `vault/Logs/`. Or: rotate logs into vault on a schedule.

## R-010 — Multi-device device-ID collision
**Trigger**: Alan has two Strix Halos (per Op 18 notes). Both default to hostname `Aurelion`. If `~/.aurelius-device-id` not set on second device, both commits attributed to same identity.
**Blast radius**: Confused audit trail; can't tell which device pushed which commit.
**Current mitigation**: `safe_push.py --set-device-id` (Op 22) lets each device claim a unique ID. Aurelion-Primary set.
**Residual risk**: Only if second device hasn't been set up yet.
**Permanent fix**: Already in BOOTSTRAP §2 — Step 2 explicitly checks `~/.aurelius-device-id` and prompts user to name the device if missing.

## R-011 — Two chats simultaneously running daily routine
**Trigger**: User opens Chat A in Claude Code on Device 1 and Chat B on Device 1 at same time. Both trigger `run_daily_routine.cmd`. Two `agents.run_agents` instances racing for LM Studio HTTP, file writes, etc.
**Blast radius**: Race conditions everywhere. Possible corrupted agent output files.
**Current mitigation**: None — `agents.run_agents` doesn't lock.
**Residual risk**: Real but probability low (daily routine fires once per day at 8 AM).
**Permanent fix**: PID-file lock in `run_daily_routine.cmd`: refuse to start if a `/tmp/aurelius-daily.pid` exists and process is alive.

## R-012 — BACKUP STATUS lies about other devices
**Trigger**: `backup_status.py` only probes THIS device + GitHub origin. It cannot see that Device B has 5 uncommitted local commits not yet pushed.
**Blast radius**: User thinks "all in sync" when really another device has unpushed work.
**Current mitigation**: BACKUP STATUS probes only the local + origin tier honestly.
**Residual risk**: User cannot tell what other devices are doing without running BACKUP STATUS on them too.
**Permanent fix**: Op 47 candidate — `backup_status.py --multi-device` reads Sync-Log to identify recent activity per device and flags "Device X last pushed 3 min ago" so user has cross-device awareness.

---

## Severity matrix

| ID | Probability | Impact | Composite |
|---|---|---|---|
| R-001 | medium | low (conflict only) | **monitor** |
| R-002 | medium (rises with parallel chats) | medium (entry overwrite) | **fix Op 47** |
| R-003 | low | low | accept |
| R-004 | high (silent drift) | medium | **fix Op 47** |
| R-005 | medium | medium | **fix Op 47** |
| R-006 | medium | low (documented) | doc only |
| R-007 | high (daily routine) | low (1-day staleness) | **fix Op 47** |
| R-008 | high (until copied) | low (config only) | **fix Op 47** |
| R-009 | medium | low | **fix Op 48+** |
| R-010 | low | medium | covered |
| R-011 | low | medium | **fix Op 48+** |
| R-012 | medium | low (visibility gap) | **fix Op 47** |

**Op 47 candidate batch** (highest leverage cluster): R-002 (op-number claim), R-004 (settings mirror), R-005 (auto gist refresh), R-007 (daily routine pull-first), R-008 (Obsidian config backup), R-012 (multi-device BACKUP STATUS).

---

## Rule additions for Master-SOP §1.4

1. Before switching devices, commit pending work OR document it in `Goals/Status.md` "what's in flight."
2. Before starting an op number, run `python op_close.py --next` to confirm the latest op (Op 47+ once `--claim` ships).
3. If editing a protocol/SOP, refresh the public gist via `python publish_protocols.py` before declaring the op done.
4. Daily routine `run_daily_routine.cmd` Phase 0 must `git pull --rebase` after gh auth check (Op 47 fix).

#multi-chat #multi-device #race-conditions #aurelius #risk-register
