#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
keepass_path="$XDG_CONFIG_HOME/keepassxc"

rm -rf "$keepass_path"
echo "Installing Keepass configuration..."
ln -sfn "$REPO_DIR/env/.config/keepassxc" "$keepass_path"
echo "Keepass installed successfully"
