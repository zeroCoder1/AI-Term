#!/bin/bash

format_output() {
  local suggestion="$1"
  echo -e "\033[1;32m💡 AI Suggestion:\033[0m"

  echo "$suggestion" | while IFS= read -r line; do
    if [[ $line == \#* ]]; then
      echo -e "\033[1;34m$(echo "$line" | sed 's/^#* //')\033[0m"
    elif [[ $line =~ ^[0-9]+\..* ]]; then
      echo -e "\033[1;33m$line\033[0m"
    elif [[ $line =~ ^- ]]; then
      echo -e "  \033[0;36m$line\033[0m"
    elif [[ $line =~ ^##\ RUN:.* ]]; then
      cmd=$(echo "$line" | sed 's/^## RUN: //')
      echo -e "\033[1;35m⚙️ Command:\033[0m \033[1;37m$cmd\033[0m"
    else
      echo "  $line"
    fi
  done
}
