#!/usr/bin/env bash
# protected_paths.sh — shared definition of "protected working content"
# Discipline layer (2026-06-03, mac-main). Sourced by no_reduction_guard.sh + checklist_gate.sh.
#
# Protected = the SOPs / agents / key docs / caches the user cares about preserving.
# NOT protected = the enforcement machinery itself (scripts, hooks), backups, PER/gate state,
# chat archives, and the separate research/ workflow — so building/guarding never bricks itself.
#
# Usage: source this file, then:  is_protected "<path>"   # exit 0 = protected, 1 = not

is_protected() {
  local p="$1"

  # --- ALWAYS ALLOWED (never gated) — listed first so they short-circuit ---
  case "$p" in
    cache/prompt_records/*) return 1 ;;   # PER files (the gate machinery)
    cache/.gate/*)          return 1 ;;   # gate state
    backups/*)              return 1 ;;   # versioned backups
    cache/backups/*)        return 1 ;;   # cache backups
    chat_archive/*)         return 1 ;;   # transcripts
    research/*)             return 1 ;;   # separate workflow
    scripts/*)              return 1 ;;   # enforcement machinery
    .githooks/*)            return 1 ;;   # enforcement machinery
    cache/legacy/*)         return 1 ;;   # archived (already preserved; never the live working copy)
    *.png|*.jpg|*.jpeg|*.mp4|*.xlsx|*.csv|*.json) return 1 ;;  # binaries/data, not prose SOP content
  esac

  # --- PROTECTED WORKING CONTENT ---
  case "$p" in
    PRIME_SOP.md|UNIVERSAL_SOP_PROMPT.md|PROTOCOLS_REFERENCE.md|STANDALONE_SOP.md) return 0 ;;
    MANDATORY_TIGHT_LOOP.md|SESSION_START.md|CLAUDE.md|RESTORATION_LOG.md)        return 0 ;;
    SYSTEM_BRIEF.md|SOP_GUIDE.md|SOP_MAP.md|USER_PROFILE.md|DEVICE_REGISTRY.md)   return 0 ;;
    SOP_COMPLETE_REFERENCE.html)                                                  return 0 ;;
    AGENT_CHAIN.md|DOOR_SCAN.md)                                                  return 0 ;;
    agents/*.md)            return 0 ;;   # active agent definitions (archive/ is under agents/ but caught below)
    cache/*.md)             return 0 ;;   # active working caches (legacy/prompt_records/backups already excluded above)
  esac

  # agents/archive/ is historical — not gated
  case "$p" in
    agents/archive/*) return 1 ;;
  esac

  return 1
}

# Print all currently-staged protected files (for the guards' use)
staged_protected() {
  local f
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    if is_protected "$f"; then echo "$f"; fi
  done < <(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null)
}
