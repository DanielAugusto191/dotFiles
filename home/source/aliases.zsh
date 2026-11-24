# Personal shell functions and aliases.
trash() { mv -- "$@" /tmp; }

alias img='kitty +kitten icat'
alias arm='trash'
alias sway='sway --unsupported-gpu'
alias startx='sway --unsupported-gpu'
alias lock='i3lock -c 000000'
alias open='xdg-open'
alias nav='google-chrome-stable'
alias csetup='cp -r ~/setup/cpp/* . && cp -r ~/setup/cpp/.[!.]* . 2>/dev/null || true'
alias comp='make -C ~/workspace/Daedalus/build && ~/workspace/Daedalus/tests/generate_tests.sh'
alias lk='ls -d */'
alias cls="printf '\033c'"
alias poe='cd "$HOME/.steam/steam/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/My Documents/My Games/Path of Exile"'
alias cnvim='cd "$HOME/.config/nvim/lua" && nvim'
alias cmlir='cd "$HOME/workspace/cppSandbox/mlir"'
alias fzf="fzf --height=80% --layout=reverse --border --multi --preview 'bat --style=numbers --color=always --line-range :500 {}' --bind 'ctrl-/:toggle-preview'"

# Fuzzy-find files while respecting .gitignore and previewing the selection.
ff() {
  fd --type f --hidden --exclude .git | fzf --height=80% --layout=reverse --border \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    --bind 'ctrl-/:toggle-preview'
}

# Fuzzy-find a file and open it in Neovim.
fedit() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --height=80% --layout=reverse --border \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    --bind 'ctrl-/:toggle-preview')
  [ -n "$file" ] && nvim "$file"
}

alias lyrics='lyrics --player "$(playerctl -l | fzf)"'
alias headset-connect='bluetoothctl power on && bluetoothctl connect 41:42:F0:E3:A8:26'
