#!/usr/bin/env bash
set -euo pipefail

repo="paper-design/paper-mono"
dest="$HOME/.local/share/fonts"

echo -e "\n...Installing fonts..."

mkdir -p "$dest"

for cmd in curl unzip fc-cache; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: required command '$cmd' not found" >&2
    exit 1
  fi
done

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "Resolving latest PaperMono release..."
tag="$(curl -fsSL -o /dev/null -w '%{url_effective}' "https://github.com/$repo/releases/latest" | grep -o '[^/]*$')"
if [ -z "$tag" ]; then
  echo "Error: could not resolve latest release tag" >&2
  exit 1
fi
echo "Latest release: $tag"

url="https://github.com/$repo/releases/download/$tag/paper-mono-$tag.zip"

echo "Downloading PaperMono ($tag)..."
curl -fL -o "$tmp/paper-mono.zip" "$url"

echo "Extracting fonts..."
unzip -o -q "$tmp/paper-mono.zip" -d "$tmp"

echo "Installing TTF + variable fonts to $dest..."
ttf_count=$(find "$tmp" -path "*/fonts/ttf/*.ttf" -exec cp -f {} "$dest/" \; -print | wc -l)
var_count=$(find "$tmp" -path "*/fonts/variable/*.ttf" -exec cp -f {} "$dest/" \; -print | wc -l)

if [ "$ttf_count" -eq 0 ]; then
  echo "Error: no TTF fonts found in archive" >&2
  unzip -l "$tmp/paper-mono.zip" >&2
  exit 1
fi
echo "Installed $ttf_count static TTF + $var_count variable font(s)"

echo "Updating font cache..."
fc-cache -f "$dest"

echo "Fonts installed successfully"
