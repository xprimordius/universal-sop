---
date: 2026-05-21
type: failure-analysis
tags: [failure-modes, risks, mitigation, audit, aurelius]
related: ["[[index]]", "[[LIBRARY]]", "[[Multi-Device-Sync-Protocol]]"]
---

# Failure Modes — Where This Could Break + How We Resolve Each

Linked: [[index]] · [[LIBRARY]] · [[Multi-Device-Sync-Protocol]]

Brutally honest catalog. **Each row: what could go wrong, what we'd lose, the resolution shipped (or queued).**

---

## 🔴 P0 — Would cause fidelity / accuracy loss

| # | Failure mode | What's lost | Resolution status |
|---|---|---|---|
| 1 | `/compact` instead of `/clear` (compact creates a lossy summary in chat) | Subtle context if you don't capture first | ✅ Resolved: run `python session_capture.py` BEFORE `/compact`. Documented in `Token-Efficient-Sessions.md`. |
| 2 | Session JSONL not captured before clear | The most recent chat's verbatim words | ⚠️ Partial: capture is manual today. **Queued: Stop hook to auto-fire `session_capture.py`** when Claude Code session ends. |
| 3 | Apply-loop lands a bad patch silently | Subtle code regression that tests don't catch | ✅ Resolved: only `cosmetic` + `config` safety classes auto-apply. `logic` + `structural` always require human review. Pre-flight tests must be green; post-apply tests must STAY green or auto-revert. |
| 4 | MEMORY.md (Claude Code memory) lives in `~/.claude/` — NOT in our git repos | Cross-session memory if `.claude` folder is deleted | ⚠️ **Queued: sync `~/.claude/projects/.../memory/` into vault as Memory/Claude-Memory.md mirror.** Easy fix. |
| 5 | User Prompt Organizer regex misses new intent patterns | Some user intents not captured in ledger | ✅ Resolved: Tier 1 verbatim transcript catches everything. Ledger is convenience layer; archive is truth. |
| 6 | Two devices push simultaneously, conflict in same file | Could lose one device's changes if force-merged | ✅ Resolved: `safe_push.py` always rebases-first. No force-pushes. Worst case: manual conflict resolution (documented playbook). |

## 🟠 P1 — Would cause efficiency / reliability issues

| # | Failure mode | What's lost | Resolution status |
|---|---|---|---|
| 7 | JSONL grows past GitHub's 100 MB single-file limit | Push fails silently in daily routine | ⚠️ **Watched:** current biggest JSONL is 11.5 MB. Will hit ceiling around ~3000h of chat. **Queued: rotate / compress when approaching 80 MB.** |
| 8 | Vault grows large enough that Obsidian indexing slows | Slower search across many files | ⚠️ Watched: 285 files / 21 MB is fine. Obsidian handles 10k+ files. **Queued: archive old sessions to separate folder when >1000 files.** |
| 9 | Daily routine times out (LM Studio slow) | Some agents marked "degraded", reports may be misleading | ⚠️ Each agent reports status (`ok` / `degraded` / `failed`). Run `python -m agents.run_agents --status` to see last-run state per agent. **Queued: alert when >2 agents degraded in a row.** |
| 10 | `gh` CLI token expires | Daily auto-push fails silently | ⚠️ **Queued: token-expiry check in daily routine.** Workaround: `gh auth login` to refresh. |
| 11 | Git remote unreachable (network outage) | Daily auto-push fails; local commits accumulate | ✅ Resolved: commits land locally. Next successful push catches up. Safe-push surfaces error visibly. |
| 12 | Vault folder accidentally moved/renamed on disk | Local copy unreachable but GitHub still has it | ✅ Resolved: `git clone` recovers from GitHub. Both mirrors. |

## 🟡 P2 — Would cause confusion / cleanup work

| # | Failure mode | What's lost | Resolution status |
|---|---|---|---|
| 13 | Time-zone drift between devices in commit timestamps | Ordering looks weird in logs | ⚠️ Watched: git stores commits in UTC internally; display in local tz. Practically fine. **Queued: standardize display to UTC.** |
| 14 | Force-push bypassing `safe_push.py` | Local history rewriting | ⚠️ Discipline only. **Queued: GitHub branch protection (free for public, paid for private).** |
| 15 | GitHub account compromise | Repository contents could be force-pushed/emptied | ⚠️ Mitigation: 2FA enabled on both accounts (your action). Private repos. **Queued: branch protection.** |
| 16 | Secrets accidentally captured in chat → committed to vault | API keys / passwords exposed (in private repo but still) | ✅ Resolved: Both repos PRIVATE. Documented in `Token-Efficient-Sessions.md` to not paste secrets. **Queued: pre-commit hook scanning for secret patterns.** |
| 17 | Two Strix Halos with identical hostname | Confusing audit trail | ✅ Resolved: per-device IDs via `~/.aurelius-device-id`. Different MAC suffix fallback even without explicit ID. |
| 18 | Self-Optimization agent loops on the same bad proposal daily | Junk accumulates in `Vault/Self-Optimization/` | ✅ Resolved: hash-deduplication. Same proposal never re-suggested. |
| 19 | Daily artifacts overwrite each other if scheduler runs twice in same day | Latest run wins, earlier lost | ✅ Resolved: artifacts dated per day, atomic-write. Multiple runs on same day update the file in place (intentional — keeps the dated file = "today's").

## 🟢 P3 — Documented gaps for future ops

| # | Failure mode | Resolution status |
|---|---|---|
| 20 | Cloud_relay phone input doesn't yet dispatch to voice loop (Phase 2 work) | ⏳ Queued for Op 14 Phase 2 |
| 21 | Vision (screen capture + vision LLM) not yet wired | ⏳ Queued for future op (needs vision model download) |
| 22 | Self-prompting agent may produce only structural proposals | ⏳ Monitor; tune Self-Opt prompt if it drifts |
| 23 | macOS/Linux port (path abstraction + .sh launchers) | ⏳ ~6 hours of work; pending need |

---

## What we'd LOSE if everything failed simultaneously

Honest disaster scenarios:

| Scenario | What's gone forever |
|---|---|
| Strix Halo dies | Nothing — both GitHub mirrors have it all |
| One GitHub account compromised | Nothing — other mirror has it |
| BOTH GitHub accounts compromised | Local Strix Halo has full history |
| Strix Halo dies + ONE GitHub gone | Other GitHub still has it |
| Strix Halo dies + BOTH GitHubs gone | **THIS IS THE ONLY TRUE DATA LOSS SCENARIO** — would need to add a 4th copy (e.g., another cloud provider or external drive) to mitigate |

**Recommendation for absolute paranoia**: add a periodic copy to OneDrive, Dropbox, or external USB. Easy add. Say "go redundancy" if you want it.

---

## The single biggest risk RIGHT NOW

**Session-end capture is manual.**

If you forget to run `python session_capture.py` before `/clear` or `/compact`, the chat's reasoning is lost (the code + vault notes survive; the IN-CHAT context doesn't).

**Resolution** (queue this as Op 19): wire `session_capture.py` into Claude Code's Stop hook so it fires automatically when a session ends. ~30 minutes of work. Removes the single biggest risk in the system.

---

## How to test these failure modes yourself

```bash
# Test backup integrity (verify all 6 mirrors match)
cd "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack"
python -c "
import subprocess
for repo in ['agent-stack', 'vault']:
    paths = {
        'local': 'C:/Users/light/Desktop/Claude Codde 5.19.2026/agent-stack' if repo == 'agent-stack'
                 else 'C:/Users/light/Documents/The Beginning/Aurelius',
    }
    sha = subprocess.run(['git','rev-parse','HEAD'], cwd=paths['local'], capture_output=True, text=True).stdout.strip()
    print(f'{repo}: {sha}')
"

# Test restore (simulate fresh-machine)
mkdir /tmp/test-clone
cd /tmp/test-clone
git clone https://github.com/xprimordius/aurelius-vault
ls aurelius-vault/  # Should see all 18 folders + LIBRARY.md + README.md

# Test session capture
cd "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack"
python session_capture.py --list   # Show available sessions
python session_capture.py           # Capture latest

# Test apply-loop in dry-run
python apply_loop.py                # Should show eligible proposals (or "nothing to apply")

# Test daily routine
python -m agents.run_agents          # Full daily routine
```

#failure-modes #risks #resolutions #audit
