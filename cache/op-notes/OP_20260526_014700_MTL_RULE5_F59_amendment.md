# OP NOTE — MTL RULE 5 v1.0.1 — F.59 Amendment (Companion-File Convention)

**Device:** aurelion
**Timestamp:** 2026-05-26 01:47 CDT
**Driver:** Autonomous /loop tick (no user prompt this iteration)
**Predecessor:** F.59 ledger entry (commit `09d3e94`) — said "MTL RULE 5 needs the 'save to file, not commit body' guidance added" as part of its permanent fix; never shipped that follow-on until this OP.

## What changed

`MANDATORY_TIGHT_LOOP.md` RULE 5 (PROVE-IT 9-point) gained two subsections:

1. **"Where the block lives"** — explicit table of 4 surfaces (commit subject / `cache/op-notes/` / `cache/chiron/PRISTINE_REPORT_*` / FAILURE_LEDGER F-class). New convention: the full 9-point block goes in a companion file, NOT pasted inline into `git commit -m`.
2. **"Minimal commit-body template"** — safe pattern: subject + one-line ref to the op-note file. Under 4KB, no embedded backticks-tables-emoji combo.
3. **Updated "Validator detection (future)"** — VL.12 now checks `cache/op-notes/OP_*.md` companion existence (was: grep body). New VL.13 candidate: pre-commit warn if commit body > 4KB or > 3 backtick fences.

Also created `cache/op-notes/` directory.

## ✅ PROVE-IT 9-POINT (dogfooding the new RULE 5 convention — this OP's block lives HERE, not in the commit)

| # | Item | Detail |
|:-:|------|--------|
| 1 | QA | Self-audit; pre-push E2E hook will verify. Future iteration could `invoke_sub_agent.sh` on this file vs F.59's entry for fresh-context audit (Q.3 cultural adoption — deferred). |
| 2 | Test | E2E 9/9 PASS (run pre-edit, will re-verify pre-push). PRISTINE last known 0/9 (last verified `24f6ea6`). |
| 3 | Quality | MANDATORY_TIGHT_LOOP.md RULE 5 grew ~45 lines; the F.59 trigger surface (heavy commit body) is now explicitly forbidden by convention; `cache/op-notes/` established as the canonical detail surface (Aurelius `Operations-Log.md` parallel). |
| 4 | Bottlenecks | None identified. |
| 5 | Constraints | VL.12 / VL.13 validator checks are NOT shipped — convention-enforced only until those scripts exist. |
| 6 | Errors | None this op; full E2E 9/9 sustained. |
| 7 | Break points | Could break if future commits keep pasting the 9-point inline anyway (cultural inertia) — VL.13's pre-commit warning is the structural answer; ship it next tick. Could break if `cache/op-notes/` is gitignored by accident — currently not in `.gitignore`. |
| 8 | Improve/Resolve | `MANDATORY_TIGHT_LOOP.md:272-310` — RULE 5 "Where the block lives" subsection added; `cache/op-notes/` directory created with this file as first inhabitant. |
| 9 | Foresight | Next-tick candidates (autonomous): (a) ship VL.13 pre-commit body-size warning (closes the F.59 surface mechanically); (b) audit one Sprint-shipped script via `invoke_sub_agent.sh` for Q.3 cultural-adoption growth; (c) check `.gitignore` for `op-notes` accidental exclusion. Risk: autonomous polish accumulates while APW (macro goal) remains paused. |

## Why this lives in a companion file, not the commit body

This OP-note is BOTH the change documentation AND the dogfood of the new convention it introduces. If the commit body referenced *this file* (which it does) and the 9-point block lived here (which it does), then the convention is self-proving on its first use. Future ops that close F-classes or ship doctrine should do the same: subject is the pointer; this directory is where the substance lives.

## Companion files

- `MANDATORY_TIGHT_LOOP.md` — the file that changed (RULE 5 v1.0.1)
- `cache/FAILURE_LEDGER.md` — F.59 entry (predecessor; named this work as TODO)
- `backups/MANDATORY_TIGHT_LOOP_md_1.7.1_20260526_014606_aurelion_pre_F59_RULE5_companion_file_guidance_backup.md` — atomic pre-edit snapshot
