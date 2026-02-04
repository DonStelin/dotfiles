#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
yazi_path="$XDG_CONFIG_HOME/yazi"

source "$REPO_DIR/scripts/lib/pkg.sh"

install_yazi() {
  if is_fedora; then
    sudo dnf copr enable --assumeyes lihaohong/yazi
    sudo dnf install -y yazi
  elif is_arch; then
    sudo pacman -S --noconfirm --needed yazi
  fi
}

install_opencode() {
  if is_fedora; then
    curl -fsSL https://opencode.ai/install | bash
  elif is_arch; then
    paru -S opencode
  fi
}

install_lazygit() {
  if is_fedora; then
    sudo dnf copr enable --assumeyes dejan/lazygit
    sudo dnf install -y lazygit
  elif is_arch; then
    sudo pacman -S lazygit
  fi
}

install_ripgrep() {
  if is_fedora; then
    sudo dnf install -y ripgrep
  elif is_arch; then
    sudo pacman -S --noconfirm --needed ripgrep
  fi
}

install_fzf() {
  if is_fedora; then
    sudo dnf install -y fzf
  elif is_arch; then
    sudo pacman -S --noconfirm --needed fzf
  fi
}

install_bat() {
  if is_fedora; then
    sudo dnf install -y bat
  elif is_arch; then
    sudo pacman -S --noconfirm --needed bat
  fi
}

install_go() {
  if is_fedora; then
    sudo dnf install -y golang
  elif is_arch; then
    sudo pacman -S --noconfirm --needed go
  fi
}

install_typst() {
  if command -v cargo &>/dev/null; then
    cargo install --locked typst-cli
  else
    echo "Error: cargo is not installed. Please install rustup first."
    return 1
  fi
}

install_nvm() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed nvm
  fi
}

install_rustup() {
  if is_fedora; then
    sudo dnf install -y rustup
  elif is_arch; then
    sudo pacman -S --noconfirm --needed rustup
  fi
}

echo -e "\n...Setting up directories..."
mkdir -p "$HOME/College" "$HOME/Dev" "$HOME/Notes" "$HOME/Environment"
echo "Directories created successfully"

echo "...::Installing terminal and dev tools::..."
install_fzf
install_ripgrep
install_bat

echo "Linking yazi configuration..."
ln -s "$REPO_DIR/env/.config/yazi" "$yazi_path"
echo "Yazi configuration linked successfully"

echo -e "\n...Installing yazi..."
install_yazi

echo "Installing yazi plugins..."
ya pkg add dedukun/bookmarks

echo -e "\n...Installing dev utilities..."
install_lazygit
install_rustup
install_go
install_typst
install_nvm

echo "Development tools installed successfully"
install_opencode
