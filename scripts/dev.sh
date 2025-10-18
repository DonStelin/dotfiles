#!/usr/bin/env bash
source "$REPO_DIR/scripts/lib/pkg.sh"


echo "...::Directories::..."
mkdir -p "$HOME/College" "$HOME/Dev" "$HOME/Notes" "$HOME/Environment"

echo "...::Installing dev utilities::..."
pkg_install fzf go typst nvm ghostty yq

