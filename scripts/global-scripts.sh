#!/usr/bin/env bash

source_dir="$REPO_DIR/scripts/global"
target_dir="/usr/local/bin"

for f in "$source_dir"/*;
do
    name="$(basename "$f" .sh)"
    ln -sf "$f" "$target_dir/$name"
done
