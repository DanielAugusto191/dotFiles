# Environment variables and portable PATH entries.
export EDITOR="${EDITOR:-nvim}"
export GIT_EDITOR="${GIT_EDITOR:-nvim}"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export QT_QPA_PLATFORM="xcb"

path_add() {
  [ -d "$1" ] && path=($1 $path)
}

path_add "$HOME/.local/bin"
path_add "$HOME/.cargo/bin"
path_add "$HOME/.local/share/nvim/mason/bin"
path_add "/opt/cuda/bin"
path_add "$HOME/llvm17/llvm-project/build/bin"
path_add "$HOME/llvm-Daedalus/build/bin"
path_add "$HOME/llvm-project/build/bin"

if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.zsh hook)"
fi
