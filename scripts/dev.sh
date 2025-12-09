#!/usr/bin/env bash
source "$REPO_DIR/scripts/lib/pkg.sh"

echo "...::Directories::..."
mkdir -p "$HOME/College" "$HOME/Dev" "$HOME/Notes" "$HOME/Environment"

echo "...::Installing yazi::..."
pkg_install yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick

echo "...::Installing dev utilities::..."
pkg_install fzf go typst nvm yq
