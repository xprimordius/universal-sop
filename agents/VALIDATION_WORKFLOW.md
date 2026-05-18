# APW VALIDATION WORKFLOW v2.0
## Consolidated: Inline Checklists + Karen Spot-Check + Resolver On-Demand
**Last Updated:** March 13, 2026

---

## ARCHITECTURE (Simplified)

```
Builder creates output
        ↓
   INLINE CHECKS (Every Output)
   │  POVP (D19): word-by-word spec check
   │  PFV (D21): process flow check
   │  D20: real-time checklist display
   │  D7: 5th grader simplicity filter
   │  D27: token status line
        ↓
   Output passes inline checks?
        │
   ┌────┴────┐
   │ NO      │ YES
   │         │
   Fix &     Is this a MAJOR
   re-check  framework deliverable?
             │
        ┌────┴────┐
        │ NO      │ YES
        │         │
     DELIVER   KAREN (Layer 2)
     TO ALAN   │  Did inline checks actually verify?
               │  Does output match Alan's decisions?
               │  Is this actually complete?
               │  Would Alan be frustrated?
               │
          Karen APPROVED?
               │
          ┌────┴────┐
          │ NO      │ YES
          │         │
     Fix & re-run   DELIVER
     from inline    TO ALAN
```

---

## WHEN TO RUN WHAT

### Full Workflow (Inline + Karen)
- Module lists
- Lesson lists
- Classroom maps
- SOP updates
- Roadmaps/timelines
- Templates/checklists
- Any framework deliverable per D22

### Inline Only (No Karen)
- Optimization cycle suggestions
- Paradox analysis
- SCIO knowledge integration summaries
- Cache file updates
- Minor adjustments to existing deliverables

### Skip (No validation needed)
- Conversational responses
- Clarifying questions
- Status updates
- Reading/summarizing uploaded files

### Resolver (On-Demand — Only When SCIO/APW Tension Detected)
- New SCIO content conflicts with APW framework
- Locked decision contradicted by new information
- Alan's instruction conflicts with prior locked decision

---

## TOKEN BUDGET IMPACT

| Operation | Estimated Tokens | When |
|-----------|-----------------|------|
| Inline checks (POVP+PFV+D20+D27) | ~200 | Every output |
| Karen spot-check | ~7,500 | Major deliverables only |
| Resolver | ~5,000 | On-demand (rare) |
| Full validation (inline + Karen) | ~7,700 | Major deliverables |

### Budget-Adjusted Validation (v3.9.3 Conservative Thresholds)
- **GREEN (<100K used):** Full validation on major deliverables. Auto-continue.
- **YELLOW (100-120K):** Inline only. Skip Karen unless critical. Reserve budget for caching.
- **RED (120-140K):** Inline only. Cache all state. Checkpoint NOW.
- **CRITICAL (>140K):** Stop. Update all caches. Emergency cache dump.

---

## AGENT FILES

| Agent | File | Role | When |
|-------|------|------|------|
| Validator (merged) | validator-merged.md | Single-pass Layer 1 (if Karen requested it) | On Karen rejection |
| Karen | karen-reality-check.md | Auditor of auditors | Major deliverables |
| Paradox Resolver | paradox-resolver.md | SCIO/APW tension analysis | On-demand |
| Cache Manager | cache-manager.md | Data integrity | Session start + after decisions |
| Oversight Executive | oversight-executive.md | Top-level controller | Coordinates all |

---

## PRACTICAL OPERATION

The builder (primary Claude instance) operates as:

### Every Output:
1. Create output draft
2. Run inline POVP checklist against relevant D-rules
3. Run inline PFV process check
4. Display checklist in output (D20)
5. Include token status line (D27)
6. Deliver

### Major Deliverables (Module lists, lesson lists, etc.):
1. All inline steps above
2. Launch Karen as sub-agent with: output + relevant cache files + Layer 1 checklist results
3. If Karen approves → deliver to Alan
4. If Karen rejects → fix per Karen's notes → re-run inline checks → re-submit to Karen
5. If Karen rejects after 2 passes → escalate to Alan with both reports

### After Any Decision or Deliverable:
1. Update relevant cache files (D28)
2. Update BUILD_STATE_CACHE.md
3. Log token usage if tracking

---

## SESSION START PROTOCOL (D25)

Every new session:
1. Read all 6 core cache files
2. Read SUBCACHE_INDEX.md
3. Verify cache integrity (timestamps, consistency)
4. Confirm agent files accessible (if validation needed this session)
5. ONLY THEN begin work

---

## ERROR HANDLING

If a sub-agent is unavailable or times out:
- The builder must manually execute that agent's checklist
- Document that the check was done manually (not by sub-agent)
- Karen must specifically verify the manually-checked items (if Karen is the one that timed out, escalate to Alan)
