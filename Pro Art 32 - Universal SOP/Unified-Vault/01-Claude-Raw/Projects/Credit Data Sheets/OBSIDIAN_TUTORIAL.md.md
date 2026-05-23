---
title: OBSIDIAN_TUTORIAL.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:52:06.087733+00:00"
uuid: 25db6c57-47ca-491e-b632-8e3df317e1b8
tags:
  - claude
  - alan
  - ai-workflow
  - credit
---
# OBSIDIAN_TUTORIAL.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Obsidian Tutorial · APW Migration
tags: [APW, obsidian, tutorial, setup]
purpose: Quick-start for Obsidian vault setup
---

# Obsidian Tutorial · APW Vault Setup

> Mainly for Claude Projects work, but Obsidian is your local source of truth and offline reference.

---

## Step 1 · Install Obsidian

1. Go to https://obsidian.md
2. Download for Mac/Windows/Linux (or use mobile app)
3. Open Obsidian

## Step 2 · Create / Choose Vault

### Option A · New Vault
1. Open Obsidian → "Create new vault"
2. Name: `APW`
3. Choose location (e.g., `~/Documents/APW`)
4. Open

### Option B · Existing Vault
1. Use your current Obsidian vault
2. Create a new folder inside it: `APW_Migration`
3. Continue with Step 3

## Step 3 · Drop the Migration Package

1. Locate `APW_Migration` folder from this download
2. Copy ENTIRE folder into your vault root
3. Obsidian will auto-index in ~10-30 seconds
4. Navigate: vault root → `APW_Migration/00_START_HERE/README.md`

---

## Step 4 · Install Recommended Plugins

### Core Plugins (already in Obsidian · just enable)
Settings → Core Plugins:
- ✅ **Outgoing Links** · see connections between notes
- ✅ **Backlinks** · see which notes link to current
- ✅ **Graph View** · visual map of vault
- ✅ **Tag Pane** · navigate by tag
- ✅ **Quick Switcher** · cmd+O / ctrl+O fast file open
- ✅ **Templates** · for new note creation
- ✅ **Daily Notes** · for execution journaling

### Community Plugins (recommended)
Settings → Community Plugins → Browse:

| Plugin | Why |
|---|---|
| **Dataview** | Query notes like a database (e.g., "show all banks with bureau=EX") |
| **Templater** | Advanced templates with variables |
| **Tag Wrangler** | Manage and rename tags at scale |
| **Excalidraw** | Hand-drawn diagrams for execution planning |
| **Calendar** | Visual calendar for D-Day planning |
| **Kanban** | Application status tracking (Pending · Approved · Denied) |
| **Style Settings** | Customize appearance |
| **JSON to Markdown** | Convert canonical JSON files to readable views |
| **Advanced Tables** | Better table editing |

---

## Step 5 · Navigation Tips

### By Folder
- `00_START_HERE/` — read first
- `01_Canonical_Data/` — all reference data
- `02_Funding_Stack/` — execution playbooks
- `03_Conversation_History/` — context for new sessions
- `04_AI_SOP_System/` — AI behavioral rules
- `99_Audit/` — fidelity tracking

### By Tag
Click any tag in a note (e.g., `#APW`, `#funding`, `#stack`) to see all linked notes. Pre-applied tags:
- `#APW` · `#funding` · `#credit`
- `#stack` · `#velocity` · `#flags`
- `#file_summary` · `#canonical_data`
- `#SOP` · `#protocol`
- `#MN` · `#OK` · `#state_specific`

### By Graph View
- Cmd/Ctrl+G to open Graph View
- Visual map of how all docs interconnect
- Useful for seeing knowledge clusters

### By Search
- Cmd/Ctrl+Shift+F → full-text search
- Quick: "Elan" → all Elan-related references
- "$143K" → all places that range appears

---

## Step 6 · Daily Workflow

### Morning Setup
1. Open Obsidian
2. Open today's daily note (auto-created)
3. Set up template:
```
## Today's Focus
- [ ] [funding task]

## Notes
- 

## Open Questions
- 

## Bank Apps Today
- 
```

### During Work
- Reference canonical docs via wiki-links: `[[STACK_LOCKED_RANGES]]`
- Quick switcher (Cmd+O) for fast navigation
- Add new findings to relevant canonical doc, not loose notes

### End of Day
- Update FIDELITY_CHECKLIST.md if anything new was added
- Sync vault (if using Obsidian Sync or git)

---

## Step 7 · Sync Strategy (Optional)

### Free Options
- **iCloud Drive** (Mac/iOS) · auto-syncs vault folder
- **Dropbox/OneDrive** · point vault at synced folder
- **GitHub** · use git plugin for version control

### Paid Options
- **Obsidian Sync** ($5/mo) · end-to-end encrypted official sync
- **Obsidian Publish** ($8/mo) · publish select notes as website

For APW (sensitive financial data) → **iCloud or local-only** is safest. Avoid public sync.

---

## Step 8 · Workflow With Claude Projects

The two systems work together:

### Obsidian = Local Source of Truth
- Make edits to canonical docs here first
- Add new banks to STATE_INDEX.json here
- Update VELOCITY_RULES.md here

### Claude Projects = AI Workspace
- After Obsidian edit, re-upload changed file to Project
- Run analysis/queries in Claude
- Copy AI outputs back to Obsidian as needed

### Sync Routine
- Edit in Obsidian → re-upload to Claude → use in chat
- Or: AI generates output → save to Obsidian via copy-paste

---

## Step 9 · Common Gotchas

| Gotcha | Fix |
|---|---|
| Frontmatter not rendering | Make sure `---` lines at top/bottom |
| Tags not showing in pane | Settings → Files & Links → enable "Detect all file extensions" |
| Links broken after rename | Settings → Files → "Automatically update internal links" ON |
| Graph view cluttered | Filter by tag in graph settings |
| JSON files don't render | Install "JSON to Markdown" plugin OR open externally |

---

## Step 10 · What This Vault Becomes

After 30 days of use, this vault should have:
- Daily notes tracking all bank applications
- Updated CANONICAL_FACTS.json with real approval data
- Approval status kanban board (Pending · Approved · Denied)
- D-Day execution journal
- Recon call logs
- CLI request tracking
- AU tradeline status

The vault is a **living system** · not a one-time download.

---

## Final Note

This is OPTIONAL. The migration package works perfectly in Claude Projects alone. Obsidian adds:
- Offline access
- Graph view of relationships
- Version control via git
- Personal note-linking
- Better long-form thinking workspace

If you don't want all that → skip Obsidian and just use Claude Projects. The MD files work in either system.
