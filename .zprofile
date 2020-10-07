export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:/home/marc/.jetbrainsscripts"

export EDITOR="nvim"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# nvm bash_completion
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/marc/.sdkman"
[[ -s "/home/marc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/marc/.sdkman/bin/sdkman-init.sh"
