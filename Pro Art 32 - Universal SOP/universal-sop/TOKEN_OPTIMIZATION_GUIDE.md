# 💰 TOKEN OPTIMIZATION GUIDE — Multi-Device Workflow
# VERSION: 1.0 | 2026-05-21 | Per Alan's directive: "reduced token use while maintaining efficiency/proficiency/fidelity"

---

## 🎯 PURPOSE

Specific token-saving optimizations for the GitHub + Obsidian + multi-device migration workflow, WITHOUT sacrificing output quality.

---

## 📊 CURRENT TOKEN ECONOMICS

### Per-Activity Costs
| 🎯 Activity | 💰 Cost | 📊 % of 200K |
|------------|:------:|:------------:|
| Cold bootstrap (8 files) | ~28K | 14% |
| Fast-Path bootstrap (3 files) | ~10K | 5% |
| Each LTM line | ~200 | 0.1% |
| Step Tracking Table | ~500-1K | 0.5% |
| Wrap-Up Block | ~3-4K | 2% |
| SubSOP Execution Report | ~1.5K | 0.75% |
| Sub-agent test | ~16-18K | 8-9% |
| Cache file edit | ~0.5K | 0.25% |
| STANDALONE_SOP cold read | ~18K | 9% |
| UNIVERSAL_SOP cold read (full) | ~25K | 12.5% |

### Per-Tier Output Cost
| Tier | Avg Cost | Notes |
|------|:--------:|-------|
| 🟢 QUICK | 2-5K | Skip Understanding Check + step table |
| 🟡 STANDARD | 5-15K | Full SOP + wrap-up |
| 🔴 COMPLEX | 15-30K | Extensive analysis + multi-file changes |

---

## 🚨 KEY INSIGHT: OBSIDIAN DOESN'T REDUCE AI TOKENS

**Obsidian is for human reading.** It doesn't affect what Claude reads or how many tokens are consumed.

Token optimization = **which files AI reads + when + how thoroughly.**

---

## 🎯 THE 6 OPTIMIZATIONS

### Optimization 1 — Fast-Path As Default ⭐ HIGHEST ROI

**Before:** Cold Start (8 files, 28K) was default. Fast-Path was alternative.
**After:** Fast-Path (3 files, 10K) is now default. Cold Start is for genuinely new devices only.

**Savings:** ~18K per continuation session. Across 50 sessions = ~900K saved.

**Trade-off:** Negligible — BOOTSTRAP_CHECK validates state before proceeding.

**Status:** ✅ APPLIED (SESSION_START.md updated 2026-05-21)

---

### Optimization 2 — Exclude chat_archive From Bootstrap ⭐ NO TRADE-OFF

**Before:** AI might read chat_archive/ files during exploration (~5-10K).
**After:** Explicit DO-NOT in SESSION_START STEP 3.

**Savings:** ~5-10K per bootstrap.

**Trade-off:** None. Chat archive is human/audit-only.

**Status:** ✅ APPLIED (SESSION_START.md STEP 3 updated)

---

### Optimization 3 — Sub-Agent Test Skip Conditions ⭐ HIGH ROI

**Before:** Sub-agent tests run liberally. 14 done in this project (~224K total tokens).
**After:** Defined skip conditions (plateau, cosmetic-only, YELLOW budget).

**Savings:** ~16K per skipped test × maybe 5-10 unnecessary tests over time = 80-160K total.

**Trade-off:** Slightly higher regression risk. Mitigated by required-on-structural-change rule.

**Status:** ✅ APPLIED (SESSION_START.md new Skip Conditions section)

---

### Optimization 4 — Lazy Load Documentation ⚠️ TRADE-OFF

**Before:** PROTOCOLS_REFERENCE.md (mandatory) ~5K + FAILURE_LEDGER.md (mandatory) ~3K.
**After:** Read on-demand when specific protocol mentioned or failure pattern matched.

**Savings:** ~8K per session.

**Trade-off:** AI might miss context if it doesn't know to look up. Mitigated by Quick Start TL;DR in UNIVERSAL_SOP.

**Status:** ❌ NOT YET APPLIED (deferred — risk of compliance gap)

---

### Optimization 5 — Cache File Pruning Policy ⚠️ TRADE-OFF

**Before:** SESSION_STATE decisions grow forever.
**After:** Decisions older than 30-90 days moved to cache/legacy/archived_decisions_YYYY_MM.md.

**Savings:** ~3-5K over time (prevents bloat).

**Trade-off:** Old decisions less discoverable. Mitigation: INDEX.md.

**Status:** ❌ NOT YET APPLIED (no current bloat; revisit in 3 months)

---

### Optimization 6 — STANDALONE_SOP_LITE Variant ⚠️ HIGH TRADE-OFF

**Before:** STANDALONE_SOP.md ~18K for any paste-into-Claude.ai use.
**After:** STANDALONE_SOP_LITE.md ~3K (just 6 stages + Pulse Check + Step Header) for QUICK tier mobile/phone use.

**Savings:** ~15K when used (mobile contexts).

**Trade-off:** Reduced rigor. ONLY for QUICK tier. STANDARD/COMPLEX still need full version.

**Status:** ❌ NOT YET APPLIED (deferred — wait for actual mobile use need)

---

## 📊 PROJECTED TOKEN SAVINGS

### Per Session (After O1+O2+O3 Applied)

| Scenario | Before | After | Savings |
|----------|:------:|:-----:|:-------:|
| Continuation session (no test) | ~30K bootstrap + work | ~12K bootstrap + work | ~18K (60% reduction) |
| Fresh device (Cold Start needed) | ~30K bootstrap | ~30K bootstrap | 0 (unchanged) |
| Session with 1 sub-agent test | ~46K | ~28K | ~18K |
| Session with 2 sub-agent tests | ~62K | ~28K (1 skipped) | ~34K |

### Annual Impact (Estimated)

- 50 continuation sessions × 18K savings = **~900K tokens saved/year**
- 20 prevented sub-agent tests × 16K = **~320K tokens saved/year**
- **Total: ~1.2M tokens/year** = approximately 6 full 200K sessions worth

---

## 🛡️ HOW THESE PRESERVE FIDELITY/PROFICIENCY/EFFICIENCY

### Fidelity Preserved By:
- ✅ BOOTSTRAP_CHECK validation gate (catches Fast-Path comprehension gaps)
- ✅ Required sub-agent test after structural changes (no skipping critical validation)
- ✅ Cache files (SESSION_STATE, FAILURE_LEDGER) still mandatory read

### Proficiency Preserved By:
- ✅ Quick Start TL;DR in UNIVERSAL_SOP available for protocol lookups
- ✅ PROTOCOLS_REFERENCE still in optional reads (read when needed)
- ✅ Full Cold Start path still available when justified

### Efficiency IMPROVED By:
- ✅ Fast-Path: 60% bootstrap cost reduction
- ✅ Skip-test conditions: avoid redundant validation
- ✅ chat_archive exclusion: no accidental large reads

---

## 🪞 WHAT THIS DOESN'T HELP WITH

**Things that still cost tokens even with optimizations:**

| 🎯 Cost Center | 💰 Why It Stays | 🛡️ Mitigation |
|---------------|----------------|---------------|
| Output generation itself | Inherent to producing work | None — this IS the work |
| LTM after every section | Required for token visibility | Worth the ~200/section |
| Wrap-Up Block for STANDARD/COMPLEX | Required for traceability | PROPORTIONALITY tier-down where possible |
| Step Tracking Table | Required for accountability | Required by SOP |
| Multiple Edit/Read calls | Each costs tokens | Use replace_all when possible |

---

## 🎯 USAGE STRATEGY

### When To Use Each Path

| 🎯 Context | 🛤️ Path | 💰 Bootstrap Cost |
|-----------|---------|:-----------------:|
| Continuation in same conversation | FAST-PATH | ~10K |
| Compacted but recent context | FAST-PATH (BOOTSTRAP_CHECK verifies) | ~10K |
| New device, never seen project | COLD START | ~28K |
| Suspected drift / weird behavior | COLD START | ~28K |
| Phone via Claude.ai web | Paste STANDALONE_SOP | ~18K |
| Phone, quick task | Paste STANDALONE_SOP_LITE (if built) | ~3K |

---

## 🔄 MULTI-DEVICE WORKFLOW (TOKEN-OPTIMIZED)

```
Device A — End of session
├─ ✅ Archive chat: `bash chat_archive/archive_chat.sh session_N`
├─ ✅ Update CONTINUATION.md with handoff
├─ ✅ git commit + push
└─ ⏱️ Cost: ~2K (writing, not reading)

Device B — Start of session
├─ ✅ git pull
├─ ✅ Fast-Path bootstrap (3 files, NOT 8)
├─ ✅ BOOTSTRAP_CHECK verifies state
└─ ⏱️ Cost: ~10K (vs 28K Cold Start = 64% savings)

Device B — During work
├─ ✅ Use QUICK tier when proportional
├─ ✅ Skip sub-agent test if not needed
├─ ✅ Cache decisions briefly (don't re-explain context)
└─ ⏱️ Cost: variable, but reduced overhead

Device B — End of session
├─ ✅ Archive + update + push (same as Device A)
└─ Total session cost: roughly 50% of unoptimized
```

---

## 📈 MEASUREMENT

To verify optimizations are working, track:
- **Bootstrap cost** per session (note ~10K if Fast-Path, ~28K if Cold)
- **Sub-agent tests run** per session (target ≤3, ideally 0-2)
- **chat_archive reads during bootstrap** (target: 0)
- **Output tier distribution** (QUICK should be common for simple tasks)

LTM tracks this naturally. Look at session-end LTM total — should trend DOWN over sessions as habits form.

---

## 🚨 WHEN TO SACRIFICE OPTIMIZATION

**Don't optimize when:**
- 🔴 First session on truly new device (need Cold Start)
- 🔴 After major structural change (need full sub-agent validation)
- 🔴 Debugging unexpected behavior (need comprehensive context)
- 🔴 User explicitly wants thorough analysis
- 🔴 Compliance audit required

Token optimization is about EFFICIENCY in routine work. Critical situations override.

---

## 🎯 BOTTOM LINE

| ❓ | 🎯 Answer |
|:---:|----------|
| Will Obsidian reduce AI token usage? | ❌ No (Obsidian is for human reading) |
| Biggest token savings available? | ✅ Fast-Path as default (~18K/session) |
| What does this guide enable? | ✅ ~50-60% token reduction in multi-device continuation workflow |
| What's the trade-off? | ⚠️ Minimal — BOOTSTRAP_CHECK gates Fast-Path quality |
| What still costs tokens? | ⚠️ Output generation itself (unavoidable) |

---

*SOP v1.3 | This file: TOKEN_OPTIMIZATION_GUIDE.md v1.0 | Multi-device token strategy | 2026-05-21*
