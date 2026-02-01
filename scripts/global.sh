#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source_dir="$REPO_DIR/scripts/global"
target_dir="$HOME/.local/bin"

mkdir -p "$target_dir"

for f in "$source_dir"/*; do
  name="$(basename "$f" .sh)"
  cp "$f" "$target_dir/$name"
  chmod +x "$target_dir/$name"
  echo "Copiado: $name"
done

echo "Scripts instalados en $target_dir"
echo "Asegúrate de tener '$target_dir' en tu PATH"
