#!/usr/bin/env bash
source="https://github.com/paper-design/paper-mono/releases/latest/download"
dest="$HOME/.local/share/fonts"

mkdir -p "$dest"

curl -L -o "$dest/Papermono-regular.otf" "$source/PaperMono-Regular.otf"
curl -L -o "$dest/Papermono-regular.ttf" "$source/PaperMono-Regular.ttf"
curl -L -o "$dest/PaperMono-Regular.woff2" "$source/PaperMono-Regular.woff2"

fc-cache -f "$dest"
