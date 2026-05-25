# Snippet template — paste into scripts/validator.sh near the other VL.X functions
# Substitutions (handled by add_protocol.sh): {{SP_ID}} {{ACRONYM}} {{FULL_NAME}} {{PURPOSE}}
# Manual review checklist after pasting:
#   - Adjust the grep pattern to match the actual marker {{ACRONYM}} will produce in outputs
#   - Decide if this VL is a FAIL (blocks ship) or WARN (informational only)
#   - Add corresponding row in agents/validator.md table

validate_{{ACRONYM_LOWER}}() {
  # VL.X — {{SP_ID}} {{ACRONYM}} ({{FULL_NAME}}) presence check
  # Purpose: {{PURPOSE}}
  local output_file="$1"
  local marker="{{ACRONYM}}"  # adjust if the protocol uses a different marker string

  if grep -q "$marker" "$output_file" 2>/dev/null; then
    echo "  [PASS] VL.X — {{ACRONYM}} marker present in output"
    return 0
  else
    echo "  [FAIL] VL.X — {{ACRONYM}} marker MISSING (expected per {{SP_ID}} {{FULL_NAME}})"
    return 1
  fi
}
