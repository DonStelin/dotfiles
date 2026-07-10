#!/usr/bin/env bash

if [ $# -ne 0 ]; then
  target=$1
else
  target=$(find . \( -path "./node_modules" -o -path "./.git" -o -path "./.obsidian" \) -prune -o -type d -print | fzf)
fi

latest_item=$(find "$HOME/Downloads" -mindepth 1 -maxdepth 1 -printf '%T@ %p\n' | sort -n -r | head -n 1 | cut -d' ' -f2-)

if [[ -n "$latest_item" && -n "$target" ]]; then
  mv "$latest_item" "$target/"
fi
