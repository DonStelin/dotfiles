#!/usr/bin/env bash

dest="$HOME/.local/share/fonts"
tmp="/tmp/paper-mono"

echo "Installing fonts..."

echo "Installing Geist Mono..."
sudo dnf install -y vercel-geist-mono-fonts

echo "Installing Geist Mono Variable..."
sudo dnf install -y vercel-geist-mono-vf-fonts

echo "Installing GeistMono Nerd Font..."
sudo dnf install -y geistmono-nerd-fonts

echo "Installing IBM Plex Mono..."
sudo dnf install -y ibm-plex-mono-fonts

echo "Installing Paper Mono..."
mkdir -p "$dest"
rm -rf "$tmp"
mkdir -p "$tmp"

tag="$(curl -fsSL -o /dev/null -w '%{url_effective}' "https://github.com/paper-design/paper-mono/releases/latest" | grep -o '[^/]*$')"

curl -fL -o "$tmp/paper-mono.zip" "https://github.com/paper-design/paper-mono/releases/download/$tag/paper-mono-$tag.zip"
unzip -o -q "$tmp/paper-mono.zip" -d "$tmp"

find "$tmp" -name "*.ttf" -exec cp -f {} "$dest/" \;

rm -rf "$tmp"
fc-cache -f "$dest"

echo "Fonts installed successfully"
