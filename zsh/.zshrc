source $HOME/.zsh-env

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cloud"
DISABLE_AUTO_TITLE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all
export EDITOR="vim"
bindkey -v
bindkey '^P' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^R' history-search-backward
bindkey '^N' history-search-forward
setopt AUTO_CD

source $HOME/.zsh-aliases
