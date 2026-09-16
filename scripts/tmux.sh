#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
tmux_path="$XDG_CONFIG_HOME/tmux"
tmux_config="$REPO_DIR/env/.config/tmux"
tpm_path="$XDG_DATA_HOME/tmux/plugins/tpm"

install_tmux() {
  sudo dnf install -y tmux yq
}

echo "Installing tmux..."
install_tmux

echo "Installing tmux configuration..."
rm -rf "$tmux_path"
mkdir -p "$tmux_path"
rm -f "$tmux_path/tmux.conf"
rm -f "$tmux_path/tmux-nerd-font-window-name.yml"

ln -sfn "$tmux_config/tmux-nerd-font-window-name.yml" "$tmux_path/tmux-nerd-font-window-name.yml"
ln -sfn "$tmux_config/tmux.conf" "$tmux_path/tmux.conf"

echo "Installing tmux plugin manager..."
if [ -d "$tpm_path/.git" ]; then
  git -C "$tpm_path" pull --ff-only
else
  rm -rf "$tpm_path"
  git clone https://github.com/tmux-plugins/tpm "$tpm_path"
fi

echo "Installing tmux plugins..."
"$tpm_path/bin/install_plugins"

echo "Tmux installed successfully"
