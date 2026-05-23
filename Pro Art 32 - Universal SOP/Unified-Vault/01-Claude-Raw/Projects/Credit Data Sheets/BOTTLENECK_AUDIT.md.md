---
title: BOTTLENECK_AUDIT.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:52:10.215195+00:00"
uuid: c021be29-e252-46f9-97ac-c13fdc977beb
tags:
  - claude
  - alan
  - credit
---
# BOTTLENECK_AUDIT.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Bottleneck Audit · Proactive Issue Resolution
tags: [APW, audit, bottlenecks]
verification: VERIFIED
purpose: Identify and pre-emptively solve all migration bottlenecks
---

# Bottleneck Audit · Proactive Issue Resolution

> All identified risks · their resolution status · ongoing monitoring.

---

## Identified Bottlenecks · Pre-Emptive Patches

| # | Bottleneck | Severity | Resolution Applied | Status |
|:---:|---|:---:|---|:---:|
| 1 | Project context can't hold 12,773 rows of raw data | HIGH | Pre-summarized files into `FILE_X_summary.md` cards; raw .xlsx attached for surgical queries | ✅ Resolved |
| 2 | AI loses precision from compressed summaries | HIGH | Canonical JSON files (`CANONICAL_FACTS`, `STATE_INDEX`, `UNDERWRITER_MAP`) — single source of truth | ✅ Resolved |
| 3 | Stack ranges drift across conversations | HIGH | Versioned `STACK_LOCKED_RANGES.md` + ALAN_LOCKED tag system | ✅ Resolved |
| 4 | Velocity rules forgotten between sessions | HIGH | Dedicated `VELOCITY_RULES.md` referenced in SOP | ✅ Resolved |
| 5 | Underwriter clustering miscounted | MED | Pre-built `UNDERWRITER_MAP.json` for instant lookup | ✅ Resolved |
| 6 | State eligibility queries slow | MED | `STATE_INDEX.json` keyed by state name | ✅ Resolved |
| 7 | Cross-conversation context lost | HIGH | `CONVERSATION_TRANSCRIPT.md` + `USER_PROMPTS_CHECKLIST.md` | ✅ Resolved |
| 8 | HTML Gate violations | HIGH | Per-turn check rule in `HTML_GATE_PROTOCOL.md` v2 | ✅ Resolved |
| 9 | Hallucination on unverified facts | HIGH | `HALLUCINATION_PREVENTION.md` + 4-step pre-claim check | ✅ Resolved |
| 10 | Double-dip/blocked lists scattered | MED | Consolidated `FLAGS.md` | ✅ Resolved |
| 11 | Bureau name typos in source data | LOW | Cleaning notes in `FILE_4_summary.md` | ✅ Documented |
| 12 | File 5 has 51 empty placeholders | LOW | Documented in `FILE_5_summary.md` | ✅ Documented |
| 13 | "Records" vs "unique institutions" confusion | MED | Both counts in CANONICAL_FACTS · clear labeling | ✅ Resolved |
| 14 | Format momentum from prior turns | HIGH | HTML Gate v2 protocol · per-turn check | ✅ Resolved |
| 15 | No version control on canonical docs | MED | Version + last_updated fields in `_meta` of every JSON | ✅ Resolved |

---

## Ongoing Monitoring · What Could Still Break

### Risk · Numeric Drift in Long Conversations
**Mitigation:** Self-Check Protocol step 7 (cross-conversation coherence)
**Status:** Mitigation in place. Verify in practice.

### Risk · Alan Updates Numbers but Forgets to Update JSON
**Mitigation:** Update Protocol section in `USAGE_INSTRUCTIONS.md` explicitly lists "update CANONICAL_FACTS first"
**Status:** Mitigation in place. Depends on Alan's discipline.

### Risk · AI Pattern-Matches to Training Data Instead of Reading Canonical Doc
**Mitigation:** "Anti-hallucination phrases" list in `HALLUCINATION_PREVENTION.md`
**Status:** Mitigation in place. Depends on SOP adherence.

### Risk · Format Drift After Several Outputs
**Mitigation:** Format templates in `SELF_CHECK_PROTOCOL.md`
**Status:** Mitigation in place. Verify in long conversations.

### Risk · New Files Added to Dataset Without Migration Update
**Mitigation:** Update Protocol requires re-running this audit
**Status:** Process documented · depends on Alan triggering re-audit

---

## Future Bottlenecks to Watch

### When dataset grows beyond ~50,000 rows
**Issue:** Even .xlsx upload may strain Project context
**Resolution path:** Split into per-state CSV files · upload individually

### When SOP needs major changes
**Issue:** Re-pasting full SOP into Project Instructions tedious
**Resolution path:** Version SOP · only re-paste delta

### When Alan adds new states/regions
**Issue:** STATE_INDEX needs expansion · stack docs need new playbooks
**Resolution path:** Use STACK_MN.md as template · clone for new state

### When real-world data conflicts with canonical
**Issue:** Approval data shows ranges different from ALAN_LOCKED
**Resolution path:** Update CANONICAL_FACTS based on real evidence · note in audit log

---

## Audit Log (Update This Section Over Time)

| Date | Issue | Resolution |
|---|---|---|
| 2026-05-15 | Initial migration build | Package v1.0 complete |
| | | |

When a new bottleneck is found in practice, add a row here.

---

## Stress Test Recommendations

Run these tests in a new Claude Project chat after setup:

### Test 1 · Numerical Precision
**Prompt:** "How many banks total in this database?"
**Expected:** Answer with explicit source. "12,773 data rows OR ~3,000-3,500 unique institutions (per CANONICAL_FACTS · VERIFIED). The distinction matters because of cross-file overlap."

### Test 2 · Range Discipline
**Prompt:** "What's the Chase per-card range?"
**Expected:** "$25K – $62K · ALAN_LOCKED (STACK_LOCKED_RANGES.md)"

### Test 3 · Velocity Rule Recall
**Prompt:** "Can I apply for 3 Amex cards in 60 days?"
**Expected:** "No · Amex 2/90 rule (max 2 approvals per 90 days · INDUSTRY_TYPICAL · cross-confirmed with Alan). See VELOCITY_RULES.md."

### Test 4 · Flag Cross-Check
**Prompt:** "Should I apply to Bank of the West in OK?"
**Expected:** "Verify geo-lock first — Bank of the West is geo-locked per FLAGS.md · OK eligibility requires residency check."

### Test 5 · HTML Gate
**Prompt:** "Show me the MN stack."
**Expected:** Claude calls ask_user_input_v0 with HTML/Text options. Does NOT immediately build HTML.

If all 5 tests pass → migration is fully functional.
If any test fails → identify which canonical doc isn't being referenced · re-upload.
