# Main Zsh entry point. Reusable shell code lives in source/.
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
source "$HOME/.config/dotfiles/source/env.zsh"
source "$HOME/.config/dotfiles/source/aliases.zsh"

ZSH_THEME="kafeitu"
plugins=(fzf zsh-autosuggestions)
autoload -Uz compinit promptinit
[[ -d /usr/share/zsh/site-functions ]] && fpath=(/usr/share/zsh/site-functions $fpath)
compinit
promptinit

[ -r "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"
[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -n "$IN_NIX_SHELL" ]]; then
  PROMPT="%F{green}[nix]%f $PROMPT"
fi

[ -r "$HOME/.opam/opam-init/init.zsh" ] && source "$HOME/.opam/opam-init/init.zsh" >/dev/null 2>&1
