#!/usr/bin/env bash
REPO_DIR="$HOME/Dotfiles/"
yazi_path="$HOME/.config/yazi"

source "$REPO_DIR/scripts/lib/pkg.sh"

echo "...::Directories::..."
mkdir -p "$HOME/College" "$HOME/Dev" "$HOME/Notes" "$HOME/Environment"

echo "...::Installing yazi::..."
pkg_install yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick

ln -s "$REPO_DIR/env/.config/yazi" "$yazi_path"

ya pkg add dedukun/bookmarks

echo "...::Installing dev utilities::..."
pkg_install fzf go typst nvm yq
