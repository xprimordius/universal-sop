# Snippet template — paste into scripts/bootstrap_verify.sh near the other check_grep lines
# Substitutions (handled by add_protocol.sh): {{SP_ID}} {{ACRONYM}} {{FULL_NAME}}
# Manual review checklist after pasting:
#   - Choose a UNIQUE grep marker (full name? acronym? canonical phrase?)
#   - If there's a hardcoded SubSOP count anywhere in bootstrap_verify.sh, BUMP it by +1
#   - Decide if this check should be in Section 4 (SubSOPs) or its own category

# Check N — {{SP_ID}} {{ACRONYM}} reference exists in canonical docs
check_grep "{{SP_ID}} {{ACRONYM}}" "MANDATORY_TIGHT_LOOP.md" \
  "{{SP_ID}} {{ACRONYM}} entry present in MTL Rule 2 table"

check_grep "{{SP_ID}} — {{ACRONYM}}" "PROTOCOLS_REFERENCE.md" \
  "{{SP_ID}} {{ACRONYM}} <details> block present in PROTOCOLS_REFERENCE"

check_grep "{{SP_ID}}" "cache/BOOTSTRAP_CHECK.md" \
  "{{SP_ID}} row present in BOOTSTRAP_CHECK SubSOP table"
