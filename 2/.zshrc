# If you come from bash you might have to change your $PATH.
export PATH=

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/usr/bin/nvim"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kafeitu"

trash(){
  mv "$@" /var/tmp
}

alias del="trash"
alias lock="i3lock -c 000000"
alias open="xdg-open"
alias nav="google-chrome-stable"
alias csetup="cp ~/setup/cpp/* -r . && cp -r ~/setup/cpp/.* ."
alias comp="make -C ~/workspace/Daedalus/build && /home/pc2/workspace/Daedalus/tests/generate_tests.sh"
alias lk="ls -d */"
alias cls="printf '\033c'"
alias poe="cd .steam/steam/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/My\ Documents/My\ Games/Path\ of\ Exile"
alias cnvim="cd /home/pc2/.config/nvim/lua && nvim"
alias cmlir="cd /home/pc2/workspace/cppSandbox/mlir"
alias fzf="fzf --style full --preview 'cat {}' --preview 'bat --style=numbers --color=always --line-range :500 {}'"


export PATH=$PATH/usr/bin:
export PATH=$PATH/opt/cuda/bin:
export PATH=$PATH$HOME/workspace/hexagon-mlir/triton/build/cmake.linux-x86_64-cpython-3.11/third_party/qcom_hexagon_backend/bin:
export PATH=$PATH$HOME/llvm17/llvm-project/build/bin:
export PATH=$PATH$HOME/llvm-Daedalus/build/bin:
export PATH=$PATH$HOME/.local/bin:
export PATH=$PATH$HOME/.cargo/bin:
export PATH=$PATH$HOME/llvm-project/build/bin:
export PATH=$PATH$HOME/.local/share/nvim/mason/bin: # nvim MASON
export PATH=$PATH/home/pc2/.local/share/gem/ruby/3.4.0/bin:

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pc2/workspace/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pc2/workspace/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pc2/workspace/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pc2/workspace/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#
# echo "webcam kernel module: modprobe uvcvideo"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



autoload -Uz compinit promptinit
compinit
promptinit

plugins=(git)


# Check nix shell

# opam configuration
# [[ ! -r /home/pc2/.opam/opam-init/init.zsh ]] || source /home/pc2/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -n "$IN_NIX_SHELL" ]]; then
  PROMPT="%F{green}[nix]%f $PROMPT"
fi

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/pc2/.opam/opam-init/init.zsh' ]] || source '/home/pc2/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
