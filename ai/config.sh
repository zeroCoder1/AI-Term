#!/bin/bash

# Path resolver
SCRIPT_PATH=$(realpath "${BASH_SOURCE[0]:-${(%):-%N}}")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
ROOT_DIR=$(dirname "$SCRIPT_DIR")

get_api_key() {
  if [ -n "$OPENAI_API_KEY" ]; then
    echo "$OPENAI_API_KEY"
  else
    security find-generic-password -a "$USER" -s "OpenAI_API_Key" -w 2>/dev/null
  fi
}

get_model() {
  echo "gpt-4o"
}
