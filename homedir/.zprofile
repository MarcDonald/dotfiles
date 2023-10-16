eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.jetbrainsscripts"
export PATH="/usr/local/bin:${PATH}"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export GOPATH="$HOME/go"
export GPG_TTY=$(tty)
source $HOME/.env

export EDITOR="nvim"

# Enable colours
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

fpath=(~/.zsh $fpath)

export BAT_THEME=ansi

# Homebrew autocomplete must be called before compinit and oh my zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export HOMEBREW_NO_ENV_HINTS=true
export JSSI_SILENCE_WARNING_DEPRECATED_NODE_VERSION=true
export BAT_THEME=ansi
