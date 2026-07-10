#!/usr/bin/env bash

books_dir="$HOME/Documents/Books"

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    find "$books_dir" \
      -mindepth 1 \
      -maxdepth 1 \
      -type f \
      -printf "%f\n" | fzf --height=90% --border=rounded --margin=15%,20%
  )

fi

if [[ -n "$selected" ]]; then
  setsid -f okular "$books_dir/$selected" &>/dev/null
fi
