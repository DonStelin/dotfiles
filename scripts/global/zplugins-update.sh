#!/usr/bin/env bash
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
plugin_dir="$XDG_DATA_HOME/zsh/plugins"

if [ ! -d "$plugin_dir" ]; then
  echo "Plugins directory not found: $plugin_dir" >&2
  exit 1
fi

for p in "$plugin_dir"/*/; do
  name="$(basename "$p")"
  if [ -d "$p/.git" ]; then
    echo "Updating $name..."
    git -C "$p" pull --ff-only || echo "$name update failed..." >&2
  fi
done

echo "Plugins updated successfully"
