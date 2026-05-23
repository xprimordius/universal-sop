---
name: reference-claude-code-web-github-link
description: "When Claude Code on the web's repo picker shows \"No repos match\" despite the GitHub App being installed with All repositories, the install is orphaned from the Claude account. Fix is uninstall + reinstall *via the picker's own \"Install the Claude GitHub app\" link* (not via GitHub directly), because only that flow routes through claude.ai/connect/github/callback which creates the user↔install mapping."
metadata: 
  node_type: memory
  type: reference
  originSessionId: fda0cdb5-7e69-4a15-ad00-700a9e4b2153
---

Claude Code on the web (claude.ai/code) — repo picker empty even with Claude GitHub App installed on the right account.

**Why:** Anthropic's backend stores a per-user mapping from claude.ai account → GitHub install_id. That mapping is created only by the OAuth callback at `https://claude.ai/connect/github/callback`. If the GitHub App was installed via github.com directly (not via the claude.ai picker's link), the install exists on GitHub but is orphaned on Anthropic's side. The picker's `LSS-code-github-repos-{orgId}-no-status` localStorage key will hold `{"value":[]}` no matter how many times you clear it or fire `installation_repositories` webhooks.

**How to apply:**
1. Verify symptom: open repo picker in claude.ai/code → "No repos match" + zero results even on typed searches. Clear localStorage keys matching `LSS-code-(github|ghe|repos)` and reload — still `value: []` means orphaned install, not stale cache.
2. Toggling repo access (All ↔ Only select) on the existing GitHub install will NOT fix it.
3. **Fix:** uninstall Claude from github.com/settings/installations (Danger zone → Uninstall — requires GitHub sudo mode email verification), then back in the claude.ai picker click the "Install the Claude GitHub app" link in the "No repos match" hint. That opens the install flow with `state=%2Fcode`, and the post-install redirect to `claude.ai/connect/github/callback` writes the mapping.
4. After install completes, clear localStorage repo keys and reload claude.ai/code — picker populates.

Alan's case: Awake999/awake on personal GitHub account, fixed 2026-05-19 after ~90 min of dead-end diagnostics (toggle dance, support widget detour). Org ID at time of fix: `587e6d48-277c-4c67-810a-4796c81167ce`.
