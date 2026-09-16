#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source_dir="$REPO_DIR/scripts/global"
target_dir="$HOME/.local/bin"

echo "Installing global scripts..."

mkdir -p "$target_dir"

echo "Installing scripts to $target_dir..."
for f in "$source_dir"/*; do
  # Solo archivos regulares (evita linkear el propio dir si está vacío, etc.)
  [ -f "$f" ] || continue
  name="$(basename "$f" .sh)"
  chmod +x "$f"
  ln -sfn "$f" "$target_dir/$name"
  echo "Installing $name..."
done

echo "Global scripts installed successfully"
