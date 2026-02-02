#!/usr/bin/env bash
REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
yazi_path="$HOME/.config/yazi"

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

install_ffmpeg() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed ffmpeg
  fi
}

install_7zip() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed 7zip
  fi
}

install_jq() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed jq
  fi
}

install_poppler() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed poppler
  fi
}

install_fd() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed fd
  fi
}

install_ripgrep() {
  if is_fedora; then
    # TODO: Logica fedora
    :
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

install_zoxide() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed zoxide
  fi
}

install_resvg() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed resvg
  fi
}

install_imagemagick() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed imagemagick
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
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed typst
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

install_yq() {
  if is_fedora; then
    # TODO: Logica fedora
    :
  elif is_arch; then
    sudo pacman -S --noconfirm --needed yq
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
install_zoxide
install_fd
install_ripgrep

echo "Linking yazi configuration..."
ln -s "$REPO_DIR/env/.config/yazi" "$yazi_path"
echo "Yazi configuration linked successfully"

echo -e "\n...Installing yazi and dependencies..."
install_yazi
install_ffmpeg
install_7zip
install_jq
install_poppler
install_resvg
install_imagemagick

echo "Installing yazi plugins..."
ya pkg add dedukun/bookmarks

echo -e "\n...Installing dev utilities..."
install_lazygit
install_go
install_typst
install_nvm
install_yq
install_rustup

echo "Development tools installed successfully"
install_opencode
