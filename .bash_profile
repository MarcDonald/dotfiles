#bashrc loading
if [ -r ~/.bashrc ]; then
  # shellcheck disable=SC1090
  . ~/.bashrc
fi

# Set terminal tab width to 2
tabs 2

export VISUAL=nvim
export EDITOR="$VISUAL"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.jetbrainsscripts:$PATH"
export PATH="/usr/local/bin:${PATH}"
complete -C '/usr/local/bin/aws_completer' aws

# Autojump
source /usr/share/autojump/autojump.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
