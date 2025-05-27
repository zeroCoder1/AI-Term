#!/bin/bash

# Dependency checks
if ! command -v jq >/dev/null 2>&1; then
  echo "❌ jq not found. Please install with: brew install jq"
  exit 1
fi

if ! command -v realpath >/dev/null 2>&1; then
  echo "❌ realpath not found. Please install with: brew install coreutils"
  exit 1
fi

# Symlink CLI
ln -sf "$PWD/bin/ai-terminal" /opt/homebrew/bin/ai-terminal
echo "✅ Installed AI Terminal CLI. Use it like: ai-terminal <command>"
