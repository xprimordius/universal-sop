# 🔄 HARNESS REFRESH GUIDE — How To Clear Stale claudeMd Cache
# VERSION: 1.0 | 2026-05-21 | B-option execution
# Addresses: Harness-injected `<system-reminder># claudeMd` drift (the -0.5 to -1.0 friction blocker)

---

## 🎯 THE PROBLEM

When Claude Code starts a session, it injects the project's `CLAUDE.md` as a `<system-reminder># claudeMd` block at the top of the AI's context. **This block is cached at session start and never refreshes mid-session.**

If you edit `CLAUDE.md` during a session:
- The on-disk file updates immediately ✅
- The harness-injected `claudeMd` block stays stale ❌
- Sub-agent tests, fresh AIs reading the system reminder, etc. see the OLD content
- Friction tests show -0.5 to -1.0 point cost from this drift

**This guide:** How to refresh the cache (the only way: new session) + how to verify on-disk state is bulletproof against drift.

---

## ✅ CURRENT ON-DISK STATE (Verified 2026-05-21)

The on-disk `CLAUDE.md` is bulletproof. It contains:

| 🛡️ Element | 📍 Location | 🎯 Purpose |
|------------|-------------|-----------|
| 🚨🚨🚨 STOP Banner | Top (lines 1-30) | Warns about stale harness claudeMd, redirects to SESSION_START.md |
| ✅ Expected Current State | Lines 18-26 | Positive counter-example (5 cache files, 4 agents, v1.3 SOP, 16 SubSOPs) |
| ⛔ Legacy Zone Warning | Throughout | Marks APW-era D-rules as historical reference only |
| Precedence Rule | Multiple places | Universal SOP v1.3 wins over anything else |
| Defer To SESSION_START | "MANDATORY SESSION START" section | No duplicate procedure |

**Conclusion:** Even if the harness injects the OLDEST CLAUDE.md (from project start in March), a careful AI reading the on-disk file will be correctly oriented.

---

## 🔄 HOW TO REFRESH THE HARNESS CACHE

### Option A — Start a New Claude Code Session (RECOMMENDED)

The harness reloads CLAUDE.md fresh on every NEW session start.

**Procedure:**
1. End current Claude Code session (close terminal, `/exit`, or `Ctrl+D`)
2. Start fresh: `cd path/to/project && claude` (or however you launch Claude Code)
3. The harness will now inject the CURRENT on-disk `CLAUDE.md` content
4. Fresh AI sees correct state from the start

**When to use:** Major CLAUDE.md changes mid-session that you want propagated.

**Token cost:** Full re-bootstrap (~25-30K cold start)

### Option B — Don't Refresh, Trust The On-Disk Safety Net

Since the on-disk CLAUDE.md has STOP banner + Precedence Rule + Expected State + STEP 0.1 Harness Drift Detector in SESSION_START, the system is designed to function WITH stale cache.

**When to use:** Don't want to lose session context. The drift detector + Precedence Rule handle it.

**Token cost:** None. Just discipline.

### Option C — Restart Mid-Session (Hybrid)

End session, restart, but use FAST-PATH bootstrap (3 files, ~10K) to preserve token budget.

**When to use:** Long-running session where you've edited CLAUDE.md and want both fresh cache AND budget preservation.

**Token cost:** ~10K (Fast-Path).

---

## 🛡️ HARNESS DRIFT DRESS REHEARSAL (Verify Safety Net Works)

To confirm the system handles stale cache correctly without needing refresh:

| 🧪 Test | 🎯 Expected Outcome |
|---------|---------------------|
| 1. Edit CLAUDE.md mid-session | On-disk updated immediately |
| 2. Spawn sub-agent (which sees same harness as you) | Sub-agent sees stale claudeMd injection |
| 3. Sub-agent reads on-disk CLAUDE.md | STOP banner catches the drift |
| 4. Sub-agent honors Precedence Rule | Defers to SESSION_START.md as canonical |
| 5. Sub-agent runs STEP 0.1 Harness Drift Detector | Recognizes stale block, ignores it |
| 6. Sub-agent produces compliant output | Drift handled without refresh |

**Validated 12 times** in sub-agent tests during Session 5 — the safety net works.

---

## 📋 REFRESH CHECKLIST (For Major Changes)

When making a structural CLAUDE.md change (e.g., fusion that moves files):

- [ ] 1. Edit CLAUDE.md on-disk
- [ ] 2. Commit and push (git)
- [ ] 3. Update CLAUDE.md's Expected Current State block (lines 18-26)
- [ ] 4. Update SESSION_START.md STEP 0.1 Harness Drift Detector if symptoms change
- [ ] 5. Update cache/BOOTSTRAP_CHECK.md expected answers
- [ ] 6. Test in CURRENT session (run sub-agent test)
- [ ] 7. **OPTIONAL: Start fresh session to populate new harness cache**
- [ ] 8. Document refresh decision in cache/SESSION_STATE.md

---

## 🔍 HOW TO DETECT IF YOU'RE SEEING STALE CACHE

Look at the harness-injected `<system-reminder># claudeMd` block content. If you see any of these = STALE:

| 🚨 Stale Indicator | ✅ Should Be |
|-------------------|-------------|
| "APW Course Framework builder" | "APW (Ascend Prime Wealth) course framework builder **AND** the Universal Output SOP system maintainer" |
| "SOP v3.9.2 (32 D-rules, 126 prompt items)" | "Universal SOP v1.3 (16 SubSOPs, 6 Stages, Ensurance System EN.1-EN.4)" |
| "Read ALL 8 core cache files" | "Active cache files: 5" + "Defer To SESSION_START.md STEP 1" |
| "Active Step: Step 4 — 7DFS Lessons Per Module" | APW course PAUSED |
| References to PRIME_SOP.md as Layer 0 | Legacy — moved to `cache/legacy/` via F1 fusion |
| References to cache/RPT_LOG.md as active | Deprecated — use `cache/FAILURE_LEDGER.md` per F8 fusion |

**If you see stale content:** Trust the on-disk files. Honor the Precedence Rule. Don't act on stale cache.

---

## 🎯 RECOMMENDED FUTURE STATE (Path To 100%)

**Best case:** Claude Code adds a `/refresh` command to update cached files mid-session.

**Workaround until then:**
1. Make CLAUDE.md edits in batched mid-session sweeps (not piecemeal)
2. At end of major changes, document need for next session to refresh
3. Trust the on-disk safety net (STOP banner + Precedence Rule + Drift Detector)
4. Run sub-agent test after major changes to verify safety net works

---

## 📊 EFFICIENCY IMPACT

Per EFFICIENCY_GUIDE.md:
- **Without harness drift:** Friction ceiling ~9.0-9.5/10 (other blockers remain)
- **With harness drift:** Friction ceiling ~8.5/10 (current state)
- **Net gain from refresh:** +0.5 to +1.0 friction point

**Recommendation:** Always start fresh session after major CLAUDE.md structural changes. Otherwise trust the safety net.

---

*SOP v1.3 | This file: HARNESS_REFRESH_GUIDE.md v1.0 | B option execution | 2026-05-21*
