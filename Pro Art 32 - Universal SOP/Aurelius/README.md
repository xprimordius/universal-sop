# Aurelius Vault — Memory + Conversations

This is the Obsidian vault for **Aurelius**, a local AI voice assistant.
Contents are append-only and form the persistent memory + history.

## Structure

```
Aurelius.md                    — Human-readable memory note
index.md                       — Hub note (start here in Obsidian)

Memory/                        — Append-only golden record
  master.jsonl                 — JSON-lines, never modified
  active.json                  — Working cache (rebuildable from master)
  Aurelius.md                  — Human-readable facts

Conversations/                 — Per-session voice transcripts
Daily/                         — Daily notes (auto-aggregated)
Reflections/                   — Aurelius's self-critique notes
Daily-Reviews/                 — Morning summaries (autonomous)
Goals/                         — One file per active goal + Status.md (auto)
Safety/                        — Audit log of destructive code patterns

Intent/                        — User-Prompt Organizer agent output
Bottlenecks/                   — Bottleneck Agent scans (weekly)
Insights/                      — Insight Agent synthesis (daily)

Reference/                     — SOPs, architecture, ops log
  Aurelius-Master-SOP.md       — Operational protocol
  Agent-Roster.md              — Specialist agent specs
  Operations-Log.md            — What shipped per operation
  Bottlenecks-and-Solutions.md — Performance analysis
  Cloud-Access-Setup.md        — Tailscale + RDP setup
```

## Open in Obsidian

`File → Open Vault → Open folder as vault → select this directory`

Then **Ctrl+G** for the graph view — see how everything links.

## Restore on a new machine

```cmd
git clone <this-repo-url> "%USERPROFILE%\Documents\The Beginning\Aurelius"
```

Then point Aurelius's `voice_agent.py` `VAULT_DIR` at that path.
