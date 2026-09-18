#!/usr/bin/env bash

if [ $# -ne 0 ]; then
  target=$1
else
  target=$( { printf '.\n'; fd . --type d --hidden --exclude node_modules --exclude .git --exclude .obsidian 2>/dev/null; } | fzf)
fi

latest_item=$(fd . "$HOME/Downloads" --min-depth 1 --max-depth 1 --absolute-path --hidden -0 2>/dev/null | xargs -0 -r ls -td 2>/dev/null | head -n 1)

if [[ -n "$latest_item" && -n "$target" ]]; then
  mv "$latest_item" "$target/"
fi
