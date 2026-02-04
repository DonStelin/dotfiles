#!/usr/bin/env bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
source "$REPO_DIR/scripts/lib/pkg.sh"

tmux_path="$XDG_CONFIG_HOME/tmux"
tmux_config="$REPO_DIR/env/.config/tmux"
tpm_path="$XDG_DATA_HOME/tmux/plugins/tpm"

install_tmux() {
  if is_fedora; then
    sudo dnf install -y tmux yq
  elif is_arch; then
    sudo pacman -S --noconfirm --needed tmux yq
  fi
}

echo -e "\n...Installing tmux..."
install_tmux

echo "Setting up tmux configuration..."
rm -rf "$tmux_path"
mkdir "$tmux_path"
rm -rf $HOME/.config/tmux/tmux.conf
rm -rf $HOME/.config/tmux/tmux-nerd-font-window-name.yml

echo "Linking tmux configuration files..."
ln -s "$tmux_config/tmux-nerd-font-window-name.yml" "$tmux_path/tmux-nerd-font-window-name.yml"
ln -s "$tmux_config/tmux.conf" "$tmux_path/tmux.conf"

echo "Installing tmux plugin manager (tpm)..."
rm -rf "$tpm_path"
git clone https://github.com/tmux-plugins/tpm "$tpm_path"

echo "Installing tmux plugins..."
"$tpm_path/bin/install_plugins"

echo "Tmux installed successfully"
