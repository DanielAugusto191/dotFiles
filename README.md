# Dotfiles

Personal configuration files for my Linux desktop and development environment.

## What is included

### Sway

Wayland window manager. The configuration contains keyboard shortcuts, workspaces, window movement, resizing, screenshots, startup programs, monitor settings, and wallpaper setup.

### Waybar

The status bar used by Sway. It shows workspaces and system information such as CPU, memory, disk, network, battery, and weather.

### Mako

Wayland notification daemon. It is configured with different colors for low, normal, and critical notifications. Notifications also play a sound from `config/notify/1.wav`.

### Kitty

Terminal emulator configuration with custom colors, transparency, font settings, scrollback, tabs, and keyboard shortcuts.

### Neovim

Main editor configuration. It includes:

- LSP support
- Autocompletion
- Treesitter
- Telescope
- Git integration
- Debugging with DAP
- Formatting
- Terminal integration
- Markdown and mathematical symbol support

Plugins are managed with lazy.nvim. The plugin versions are recorded in `config/nvim/lazy-lock.json`.

### Picom

X11 compositor configuration. It is kept for compatibility with X11 sessions.

### Fastfetch

Displays system information in the terminal, including the operating system, kernel, desktop, hardware, memory, disks, network, and battery.

### Zsh

The shell configuration is split into smaller files:

- `home/.zshrc` loads the shell configuration.
- `home/source/env.zsh` contains environment variables and PATH entries.
- `home/source/aliases.zsh` contains aliases and shell functions.

### Clang tools

The repository includes user-level `.clangd` and `.clang-format` files for C and C++ development.

### Personal scripts

Scripts in `bin/` include:

- `usdbrl-status.sh`: updates the USD/BRL exchange rate cache.
- `memoryAlert.sh`: sends a notification when memory usage is high.
- `bluetoothBattery.sh`: reports Bluetooth battery information.

## Repository layout

```text
bin/       Personal executable scripts
config/    Application configurations
home/      Files installed into the home directory
install.sh Installation script
```

## Installation

Clone the repository and run:

```bash
cd ~/dotFiles
./install.sh
```

The installer creates symbolic links to the configuration files. Existing files are moved to a timestamped backup directory under:

```text
~/.dotfiles-backup/
```

The installer does not install system packages. Programs such as Sway, Waybar, Mako, Kitty, Neovim, and their dependencies must be installed separately.

## Notes

Some aliases and development paths are specific to my system. They may need to be adjusted when using these files on another computer.
