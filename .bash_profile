if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/AppData/Local/JetBrains/scripts"
export PATH="$PATH:$HOME/Documents/code/oss/diff-so-fancy"
export PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR="vim"
