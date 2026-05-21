#!/usr/bin/env bash
# 🏷️ DEVICE SETUP — One-command registration for new device
# Per DEVICE_REGISTRY.md | F.15 fix 2026-05-21
# Usage: bash scripts/setup_device.sh DEVICE_NAME
# Example: bash scripts/setup_device.sh laptop-2

set -e

DEVICE_NAME="${1:-}"

if [ -z "$DEVICE_NAME" ]; then
  echo "❌ Usage: bash scripts/setup_device.sh DEVICE_NAME"
  echo ""
  echo "Examples: mac-main, laptop-2, codespaces, work-mac, phone-clone"
  echo ""
  echo "Remember to ALSO add the device to DEVICE_REGISTRY.md table"
  exit 1
fi

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# Configure git locally (per-repo)
git config user.name "Alan ($DEVICE_NAME)"
git config user.email "alan+$DEVICE_NAME@local"

echo "✅ Device registered: $DEVICE_NAME"
echo ""
echo "Git identity (local to this repo):"
echo "  Name:  $(git config user.name)"
echo "  Email: $(git config user.email)"
echo ""
echo "📋 NEXT STEPS:"
echo "  1. Add '$DEVICE_NAME' to DEVICE_REGISTRY.md table"
echo "  2. Make first commit:"
echo "     git commit --allow-empty -m \"[$DEVICE_NAME | \$(date '+%Y-%m-%d %H:%M %Z')] register device\""
echo "  3. Push: git push"
echo ""
echo "From now on, commits from this device will be identifiable as: Alan ($DEVICE_NAME)"
