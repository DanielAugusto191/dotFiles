# Personal shell functions and aliases.
trash() { mv -- "$@" /tmp; }

alias img='kitty +kitten icat'
alias arm='trash'
alias sway='sway --unsupported-gpu'
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
alias fzf="fzf --style full --preview 'cat {}' --preview 'bat --style=numbers --color=always --line-range :500 {}'"
