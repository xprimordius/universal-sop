# Obsidian Config Mirror

Auto-mirrored from `C:/aurelius/.obsidian/` by `agent-stack/mirror_obsidian.py` (Op 47).

Aurelion-Primary points Obsidian at `C:/aurelius/` (parent of both repos). This folder is the vault-git-tracked snapshot so a new device can restore the same Obsidian experience.

## Restore on a new device

```
python agent-stack/mirror_obsidian.py --restore
```

Then open Obsidian, 'Open folder as vault' → `C:/aurelius/`.

## What's NOT mirrored (per-device noise)

- `workspace.json` — window layout, changes every few seconds
- `cache/` — filesystem cache
- `plugins/*/data.json` — per-plugin internal state
