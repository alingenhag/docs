#!/usr/bin/env bash
set -euo pipefail

here=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
target="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

missing=()
for tool in nvim git curl make cc unzip tar gzip node npm java python3 rg fd opencode; do
    command -v "$tool" >/dev/null || missing+=("$tool")
done
if ((${#missing[@]})); then
    echo "Missing: ${missing[*]} (see README.md)"
fi

if ! command -v nvim >/dev/null || ! nvim --clean --headless -c 'if !has("nvim-0.12") | cquit | endif' -c 'qa!'; then
    echo "Neovim 0.12 or newer is required, nothing installed."
    exit 1
fi

if [[ -e $target || -L $target ]]; then
    backup="$target.bak.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    echo "Existing config moved to $backup"
fi
mkdir -p "$(dirname "$target")"
cp -r "$here/nvim" "$target"
echo "Installed to $target. Start nvim once and leave it open until the tool installs finish."
