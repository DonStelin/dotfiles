#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source_dir="$REPO_DIR/scripts/global"
target_dir="$HOME/.local/bin"

echo -e "\n...Installing global scripts..."

mkdir -p "$target_dir"

echo "Copying global scripts to $target_dir..."
for f in "$source_dir"/*; do
  name="$(basename "$f" .sh)"
  cp "$f" "$target_dir/$name"
  chmod +x "$target_dir/$name"
  echo "Copied: $name"
done

echo "Global scripts installed successfully"
echo "Make sure you have '$target_dir' in your PATH"
