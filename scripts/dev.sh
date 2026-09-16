#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
yazi_path="$XDG_CONFIG_HOME/yazi"

install_yazi() {
  sudo dnf copr enable --assumeyes lihaohong/yazi
  sudo dnf install -y yazi
}

install_lazygit() {
  sudo dnf copr enable --assumeyes dejan/lazygit
  sudo dnf install -y lazygit
}

install_ripgrep() {
  sudo dnf install -y ripgrep
}

install_fzf() {
  sudo dnf install -y fzf
}

install_bat() {
  sudo dnf install -y bat
}

install_go() {
  sudo dnf install -y golang
}

install_typst() {
  sudo dnf install -y typst
}

install_rustup() {
  sudo dnf install -y rustup
}

install_fd() {
  sudo dnf install -y fd-find
}

echo -e "\n...Setting up directories..."
mkdir -p "$HOME"/{College,Dev,Environment,Cloud}
echo "Directories created successfully"

echo "...::Installing terminal and dev tools::..."
install_fzf
install_ripgrep

echo "Linking yazi configuration..."
ln -s "$REPO_DIR/env/.config/yazi" "$yazi_path"
echo "Yazi configuration linked"

echo -e "\n...Installing yazi..."
install_yazi

echo "Installing yazi plugins..."
ya pkg add dedukun/bookmarks

echo -e "\n...Installing dev utilities..."
install_lazygit
install_rustup
install_go
install_typst
install_fd
