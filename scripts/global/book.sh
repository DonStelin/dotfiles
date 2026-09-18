#!/usr/bin/env bash

books_dir="$HOME/Cloud/ebooks/"

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    fd . "$books_dir" --min-depth 1 --max-depth 1 --type f --hidden --format '{/}' 2>/dev/null | fzf --height=90% --border=rounded --margin=15%,20%
  )

fi

if [[ -n "$selected" ]]; then
  setsid -f okular "$books_dir/$selected" &>/dev/null
fi
