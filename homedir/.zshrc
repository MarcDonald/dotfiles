# OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"

# Set the cache to a more permanent directory
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [ ! -d $ZSH_CACHE_DIR ]; then
  mkdir $ZSH_CACHE_DIR
fi

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit

# Lazy load nvm because the startup time is absurd otherwise
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

source ~/.oh-my-zsh/custom/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(colored-man-pages git zsh-autosuggestions zsh-syntax-highlighting golang z zsh-nvm)

# init oh-my-zsh
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Starship
eval "$(starship init zsh)"

# ALIASES
#Use neovim instead of vim
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

#Use bat instead of cat
alias cat='bat'

#Opening Config
alias opprofile='vim ~/.zprofile'
alias spprofile='exec zsh'

alias op='vim ~/.zshrc'
alias sp='exec zsh'

alias opvr='vim ~/.config/nvim'

#Terminal
alias cl='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#Git
alias g='git'
alias gaa='git add .'
alias gcmm='git commit -m'
alias gacane='git commit -a --amend --no-edit'
alias gcane='git commit --amend --no-edit'
alias gca='git commit --amend'
alias gacaneud='git commit -a --amend --no-edit --date=now'
alias gin='git pull'
alias gst='git status'
alias gout='git push'

alias cmt='cmmiter commit'
alias cm='cmmiter commit'

#Misc
alias j='z'
alias tn="tmux new -s $(basename $(pwd))"
alias tls="tmux ls"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd .'
function vf() {
  vim $(fzf --query "$1")
}
