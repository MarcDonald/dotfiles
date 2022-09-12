eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.jetbrainsscripts"
export PATH="/usr/local/bin:${PATH}"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export GOPATH="$HOME/go"
export GPG_TTY=$(tty)

export EDITOR="nvim"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

