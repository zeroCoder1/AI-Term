#!/bin/bash

SCRIPT_PATH=$(realpath "${BASH_SOURCE[0]:-${(%):-%N}}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ROOT_DIR=$(dirname "$SCRIPT_DIR")

source "$ROOT_DIR/ai/config.sh"

query_ai() {
  local command="$1"
  local status="$2"
  local output="$3"
  local api_key
  api_key=$(get_api_key)

  if [ -z "$api_key" ]; then
    if command -v ollama >/dev/null 2>&1; then
      echo "⚡ Using local LLM (Ollama)..."
      ollama run codellama "Debug this command: $command\nExit code: $status\nOutput:\n$output"
      return
    else
      echo "❌ No OpenAI API Key or Ollama found."
      return 1
    fi
  fi

  json_payload=$(cat <<EOF
{
  "model": "$(get_model)",
  "messages": [
    {"role": "system", "content": "You are a Linux expert helping debug terminal errors. Your responses must include a short explanation, the likely cause, and step-by-step fix suggestions. If a fix involves running a command, prefix it with '## RUN:' on a separate line. Do NOT suggest dangerous commands like rm -rf."},
    {"role": "user", "content": "I ran this command: $command. It gave exit code: $status. Here is the output:\n$output\nWhat's wrong and how do I fix it?"}
  ]
}
EOF
  )

  curl -s -X POST https://api.openai.com/v1/chat/completions \
    -H "Authorization: Bearer $api_key" \
    -H "Content-Type: application/json" \
    -d "$json_payload"
}
