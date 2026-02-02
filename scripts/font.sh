#!/usr/bin/env bash

source="https://github.com/paper-design/paper-mono/releases/latest/download"
dest="$HOME/.local/share/fonts"

echo -e "\n...Installing fonts..."

mkdir -p "$dest"

echo "Downloading PaperMono font..."
curl -L -o "$dest/Papermono-regular.otf" "$source/PaperMono-Regular.otf"
curl -L -o "$dest/Papermono-regular.ttf" "$source/PaperMono-Regular.ttf"
curl -L -o "$dest/PaperMono-Regular.woff2" "$source/PaperMono-Regular.woff2"

echo "Updating font cache..."
fc-cache -f "$dest"

echo "Fonts installed successfully"
