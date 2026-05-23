# 🪦 LEGACY VAULT — Canonical location moved (Op 23, 2026-05-21)

**This directory is no longer the canonical Aurelius vault.**

## Where the canonical vault lives now

```
C:/aurelius/aurelius-vault/
```

The sibling of `C:/aurelius/aurelius-agent-stack/`. Both clones track the same GitHub remote (`github.com/xprimordius/aurelius-vault`). Either clone can `git pull` to converge.

## Why this directory still exists

1. **Historical clone** — full git history is preserved here, identical to canonical. If canonical clone is ever corrupted or deleted, this is a recovery path.
2. **Voice agent legacy writes** — older code may still reference this path. As of Op 23, all Python modules use `aurelius_paths.VAULT_DIR` which resolves to canonical sibling. Op 27 ensured `.cmd` files do the same.
3. **No data loss risk** — both clones can be brought in sync via `git pull`. Nothing exclusive to this directory.

## Should I delete this directory?

**Not yet.** Keep for ~30 days as a safety net. After that, if no scripts or hooks have surfaced legacy-path errors, this directory can be archived (`tar` + delete) or fully removed.

To find any remaining references on disk:

```bash
grep -rn "The Beginning/Aurelius" C:/aurelius/aurelius-agent-stack \
    --include="*.py" --include="*.cmd" --include="*.ps1" --include="*.sh"
```

As of Op 27 this should return only:
- This file (legacy marker)
- `aurelius_paths.py` (legacy path in the fallback resolution list)
- Documentation refs in Operations-Log explaining the migration

## How writes are routed today

| Source | Writes to |
|---|---|
| `voice_agent.py` runtime | Canonical (via `aurelius_paths.VAULT_DIR`) |
| `agents/run_agents.py` daily routine | Canonical (via `base.VAULT_DIR` → `aurelius_paths`) |
| `safe_push.py` | Canonical (via `aurelius_paths.resolve_vault_dir()`) |
| `run_daily_routine.cmd` | Canonical (via `python -c "from aurelius_paths import VAULT_DIR; print(...)"`) |
| `checkpoint.py`, `session_capture.py`, `aurelius_daily_review.py`, etc. | Canonical |

If you see new writes appearing in this legacy directory, that's a bug — file an issue and check the .cmd / .py resolver output.

#legacy #canonicalization #op-23 #op-27
