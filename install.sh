#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
BACKUP_DIR="${HOME}/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

backup_and_link() {
  local source="$1" target="$2"
  mkdir -p "$(dirname -- "$target")"

  if [ -L "$target" ] && [ "$(readlink -f -- "$target")" = "$(readlink -f -- "$source")" ]; then
    printf 'already linked: %s\n' "$target"
    return
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname -- "${target#"$HOME/"}")"
    mv -- "$target" "$BACKUP_DIR/${target#"$HOME/"}"
    printf 'backed up: %s\n' "$target"
  fi

  ln -s -- "$source" "$target"
  printf 'linked: %s -> %s\n' "$target" "$source"
}

backup_and_link "$REPO_DIR/home/.zshrc" "$HOME/.zshrc"
backup_and_link "$REPO_DIR/home/.clangd" "$HOME/.clangd"
backup_and_link "$REPO_DIR/home/.clang-format" "$HOME/.clang-format"
backup_and_link "$REPO_DIR/home/source" "$HOME/.config/dotfiles/source"

for name in kitty sway nvim mako picom waybar fastfetch terminal-lyrics; do
  backup_and_link "$REPO_DIR/config/$name" "$HOME/.config/$name"
done
backup_and_link "$REPO_DIR/config/notify" "$HOME/.config/notify"

mkdir -p "$HOME/.local/bin"
backup_and_link "$REPO_DIR/bin/usdbrl-status.sh" "$HOME/.local/bin/usdbrl-status.sh"
backup_and_link "$REPO_DIR/bin/bluetoothBattery.sh" "$HOME/.local/bin/bluetoothBattery.sh"

printf '\nInstallation complete.\n'
if [ -d "$BACKUP_DIR" ]; then
  printf 'Previous files were backed up to: %s\n' "$BACKUP_DIR"
fi
