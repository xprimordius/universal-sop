# SOP PATCH: v3.9.1 → v3.9.2
## Session Checkpointing & Cache Versioning
**Date:** March 13, 2026
**Type:** Process refinement patch
**Triggered By:** Alan identified 2 architectural risks: (1) compaction is lossy — should cache and start fresh instead, (2) cache overwrites destroy prior versions with no rollback

---

## GAPS IDENTIFIED

| # | Gap | Impact |
|---|-----|--------|
| 1 | No manual checkpoint before compaction risk | Compaction = lossy compression we don't control. Should cache + start new session instead. |
| 2 | Cache overwrites with no backup | If a bad edit corrupts cache, no rollback available. Prior state destroyed. |

---

## NEW D-RULES (2 added: D31-D32)

**D31 — Session Checkpoint Protocol (Anti-Compaction)**
Never allow compaction to happen. Instead:
1. Before any multi-step task, estimate total token cost (input + output).
2. If the task risks pushing past YELLOW (~120K), break into cache-safe chunks.
3. At the end of each chunk: full cache write + copy to outputs.
4. When session is running long or approaching YELLOW: STOP all work, write all state to cache, and instruct Alan: "Start a new session. Caches are current at [version]. Next task: [X]."
5. New session picks up via D25 (Session Start) with FULL token budget.

**Why this is strictly better than compaction:**
- Compaction = lossy, system-controlled, unpredictable, reduces remaining token budget
- Checkpointing = lossless, human-controlled, predictable, resets to full token budget
- Cache carries 100% of state; conversation memory carries 0% after checkpoint

**D32 — Cache Versioning Protocol (Backup Before Modify)**
Before ANY cache file modification:
1. Create timestamped backup of ALL cache files to /cache/backups/[YYYYMMDD_HHMMSS_v(version)]/
2. Log the backup in BACKUP_LOG.md with: timestamp, SOP version, trigger reason, files backed up
3. THEN proceed with modification
4. If modification introduces errors → rollback from backup + document in Error Log

**Backup structure:**
```
/cache/backups/
  BACKUP_LOG.md              ← Master log of all snapshots
  20260313_052348_v391/      ← Timestamped snapshot
    APW_MASTER_CACHE.md
    BUILD_STATE_CACHE.md
    SCIO_KNOWLEDGE_CACHE.md
    SOP_V39_CHANGES.md
    SOP_V391_CHANGES.md
    subcache/
      [all sub-cache files]
```

**Retention:** Keep all backups. Storage cost is minimal (~100KB per snapshot). Never delete backups.

---

## NEW PROMPT ITEMS (A66-A67)

**A66 — Anti-Compaction Checkpoint:**
Never rely on compaction. Before long tasks, estimate token cost. If session is getting deep, stop, cache all state, and tell Alan to start fresh. New session = full token budget + cached state = strictly better than compacted session.

**A67 — Backup Before Modify:**
Every cache write must be preceded by a full snapshot of all cache files. Log in BACKUP_LOG.md. This creates a version history for rollback. No exceptions — even minor edits get backed up first.

---

## NEW ERROR LOG ENTRY

**ERR-6:**
- Error: All cache updates in prior sessions overwrote files with no backup. No rollback capability existed.
- Root Cause: No versioning protocol. Cache treated as mutable single-copy.
- Protocol Created: D32 (Cache Versioning) + backup directory structure + BACKUP_LOG.md
- SOP Version: v3.9.2

---

## VERSION HISTORY ENTRY

**v3.9.2 (Patch):** Added D31 (Session Checkpoint Protocol — anti-compaction), D32 (Cache Versioning — backup before modify). ERR-6 added. A66-A67 added. Backup directory structure + BACKUP_LOG.md established. First backup snapshot created. Total: 126 prompt items across 17 messages, 32 D-rules.

---

## WHERE TO INSERT IN JS FILE

| Change | Insert Location |
|--------|----------------|
| D31-D32 | After D30 in Section D table array |
| ERR-6 | After ERR-5 in Section N table array |
| A66-A67 | In Section A prompt table |
| Version history v3.9.2 | After v3.9.1 entry |
