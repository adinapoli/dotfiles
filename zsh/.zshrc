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

# Needed for emacs-tramp to work
if [ "$TERM" = "dumb" ]
then
unsetopt zle
unsetopt prompt_cr
unsetopt prompt_subst
# unfunction precmd # these two are not
# unfunction preexec # working for me
PS1='$ '
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/adinapoli/.sdkman"
[[ -s "/Users/adinapoli/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adinapoli/.sdkman/bin/sdkman-init.sh"
