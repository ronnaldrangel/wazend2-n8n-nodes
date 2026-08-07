#!/usr/bin/env bash
# apply-branding.sh — Overlay Wazend branding onto n8n-nodes-waha before build.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BRANDING="$ROOT/branding"

if [ ! -d "$BRANDING" ]; then
  echo "error: branding/ directory not found at $BRANDING"
  exit 1
fi

echo "==> Applying Wazend branding..."

# package.json
if [ -f "$BRANDING/package.json" ]; then
  echo "    package.json"
  cp "$BRANDING/package.json" "$ROOT/package.json"
fi

# README.md
if [ -f "$BRANDING/README.md" ]; then
  echo "    README.md"
  cp "$BRANDING/README.md" "$ROOT/README.md"
fi

# node.json files
if [ -f "$BRANDING/nodes/WAHA/WAHA.node.json" ]; then
  echo "    nodes/WAHA/WAHA.node.json"
  cp "$BRANDING/nodes/WAHA/WAHA.node.json" "$ROOT/nodes/WAHA/WAHA.node.json"
fi

if [ -f "$BRANDING/nodes/WAHA/WAHATrigger.node.json" ]; then
  echo "    nodes/WAHA/WAHATrigger.node.json"
  cp "$BRANDING/nodes/WAHA/WAHATrigger.node.json" "$ROOT/nodes/WAHA/WAHATrigger.node.json"
fi

# logo
if [ -f "$BRANDING/nodes/WAHA/waha.svg" ]; then
  echo "    nodes/WAHA/waha.svg"
  cp "$BRANDING/nodes/WAHA/waha.svg" "$ROOT/nodes/WAHA/waha.svg"
fi

# images (optional — skip if not provided)
for img in "WAHA+n8n.png" "waha-n8n-workflow-example.png"; do
  if [ -f "$BRANDING/$img" ]; then
    echo "    $img"
    cp "$BRANDING/$img" "$ROOT/$img"
  fi
done

echo "==> Branding applied successfully."
