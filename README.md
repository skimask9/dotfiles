# My Dotfiles

These are my personal dotfiles for macOS. They are highly customized to my workflow and preferences.

## Overview

This repository contains configurations for the following applications:

- **AeroSpace**: A tiling window manager for macOS.
- **bat**: A cat(1) clone with syntax highlighting and Git integration.
- **fd**: A simple, fast and user-friendly alternative to `find`.
- **Ghostty**: A modern, GPU-accelerated terminal emulator.
- **Neovim**: A highly extensible, terminal-based text editor.
- **WezTerm**: A GPU-accelerated cross-platform terminal emulator and multiplexer.
- **Zsh**: A powerful shell that operates as both an interactive shell and as a scripting language interpreter.

It also includes a collection of useful scripts.

## Prerequisites

To use these dotfiles, you will need to have the following software installed:

- [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- [bat](https://github.com/sharkdp/bat)
- [fd](https://github.com/sharkdp/fd)
- [Ghostty](https://github.com/mitchellh/ghostty)
- [Neovim](https://neovim.io/)
- [WezTerm](https://wezfurlong.org/wezterm/)
- [fzf](https://github.com/junegunn/fzf)
- [tmux](https://github.com/tmux/tmux)
- [Nerd Fonts](https://www.nerdfonts.com/)

## Installation

These dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/).

1.  Clone this repository to your home directory:

    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/dotfiles
    ```

2.  Navigate to the cloned directory:

    ```bash
    cd ~/dotfiles
    ```

3.  Use `stow` to symlink the configurations. For example, to install the `nvim` and `zsh` configurations, run:

    ```bash
    stow nvim zsh
    ```

    ```bash
    # Or link everything in the repo
    stow *
    ```

    To install all configurations, you can `stow` all the packages in this repository.

**Note**: It is recommended to back up your existing dotfiles before creating symbolic links.

### Handling Overwrites

If you have existing configs, Stow might complain.
You can back them up first:
```bash
mv ~/.zshrc ~/.zshrc.bak
mv ~/.config/nvim ~/.config/nvim.bak
```
Then run Stow again.

## Configuration Details

### AeroSpace

The AeroSpace configuration is located in `.config/aerospace/aerospace.toml`. It provides a comprehensive set of keybindings for managing windows and workspaces.

**Key Features:**

- Custom keybindings for focusing, moving, and resizing windows.
- Workspace management with dedicated workspaces for specific applications.
- Automatic window placement for certain applications.
- Custom scripts for moving Brave Browser and Picture-in-Picture windows.

### bat

The bat configuration is located in `.config/bat/config`.

**Key Features:**

- `gruvbox-dark` theme.
- Italic text enabled.
- Custom syntax mappings for `.ino` and `.ignore` files.
- A custom `tokyonight_night` theme.

### fd

The fd configuration is located in `.config/fd/ignore`. It excludes common development directories and files from searches.

### Ghostty

The Ghostty configuration is located in `.config/ghostty/config`.

**Key Features:**

- Jellybeans dark and light themes.
- JetBrainsMono Nerd Font.
- Custom keybindings.
- Starts a tmux session named "config" on startup.

### Neovim

The Neovim configuration is located in `.config/nvim`. It uses [AstroNvim](https://astronvim.com/) as a base and is heavily customized with a wide range of plugins.

**Key Features:**

- **AI-powered code completion**: GitHub Copilot, Claude, and Opencode.
- **Advanced syntax highlighting**: `nvim-treesitter`.
- **File explorer**: `neo-tree.lua`.
- **Statusline**: `lualine.nvim`.
- **Plugin management**: `lazy.nvim`.
- **LSP support**: `mason.nvim` and `nvim-lspconfig`.
- **Custom themes**: Jellybeans and more.

### WezTerm

The WezTerm configuration is located in `.config/wezterm`. It is a highly modular configuration with separate files for appearance, behavior, colors, and keybindings.

**Key Features:**

- **Dynamic color scheme**: Automatically switches between dark and light themes based on the system's appearance.
- **Custom fonts**: A wide range of pre-configured fonts with support for ligatures and Nerd Fonts.
- **Custom keybindings**: Comprehensive keybindings for pane and tab management, scrolling, and more.
- **Modular configuration**: Easy to customize and extend.
- **Custom icons**: Nerd Font icons for different processes.

### Zsh

The Zsh configuration is located in `.zshrc`. It is a simple configuration with a few aliases and settings.

### Scripts

The `.config/scripts` directory contains a collection of useful scripts:

- `ghossty-tmux.sh`: Attaches to a tmux session named "config" or creates it if it doesn't exist.
- `brave-move.sh`: Moves the second Brave Browser window to workspace 4.
- `brave-move2.sh`: Moves the second Brave Browser window to workspace 10 if a Sidecar display is detected, otherwise to workspace 4.
- `pip-move.sh`: Moves Picture-in-Picture windows to the current workspace.
- `tmux-cht.sh`: A script that uses `fzf` to select a language or command and then uses `curl` to get a cheatsheet from `cht.sh` and displays it in a new tmux window.
