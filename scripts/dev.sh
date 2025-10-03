#!/usr/bin/env bash
source "$REPO_DIR/scripts/lib/pkg.sh"

echo "...::Installing dev utilities::..."
pkg_install fzf go typst nvm ghostty

