# Neovim config for WSL

Requires Neovim 0.12+ and glibc 2.39+ (Ubuntu 24.04 or Debian 13) inside WSL. Plugins are pinned and cloned on first start; language servers and formatters come from mason.

## Install (Ubuntu or Debian)

    sudo apt install git curl unzip build-essential ripgrep fd-find nodejs npm python3 openjdk-21-jdk
    mkdir -p ~/.local/bin && ln -s "$(command -v fdfind)" ~/.local/bin/fd

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

    bash install.sh

- `~/.local/bin` must be on `PATH`.
- Use a Nerd Font in Windows Terminal, otherwise icons show as boxes.
- Start nvim once and leave it open until mason and the treesitter parsers finish, then restart. Progress: `:Mason`, `:checkhealth`.
- An existing `~/.config/nvim` is moved to a timestamped backup.

## opencode

opencode must be installed inside WSL. The pinned plugin revision supports opencode v2. For v1, change the version of `opencode.nvim` in `lua/pack.lua` to `v1.0.2` before the first start.

| Key | Action |
|---|---|
| `<leader>as` | Ask about the cursor or selection |
| `<leader>ab` | Ask about the buffer |
| `<leader>ad` | Explain diagnostics |
| `<leader>ap` | Pick an action |
| `<leader>ai` | Connection status |

Edits opencode asks permission for open as a diff: `da` accepts, `dr` rejects.

## Differences from the NixOS config

- Local model completion and Claude Code integration removed.
- Theme fixed to Gruvbox Material, without live switching.
- Nix: nixd and alejandra are used only if installed.
- nvimpager is not included.
