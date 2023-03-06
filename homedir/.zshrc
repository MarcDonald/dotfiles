# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew autocomplete must be called before compinit and oh my zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export ZSH="$HOME/.oh-my-zsh"
# Set the cache to a more permenant directory
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [ ! -d $ZSH_CACHE_DIR ]; then
  mkdir $ZSH_CACHE_DIR
fi
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit

plugins=(colored-man-pages git autojump adb zsh-autosuggestions zsh-syntax-highlighting docker docker-compose mvn yarn golang forgit fzf-zsh-plugin aws)
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
autoload -Uz zcalc
alias calc="zcalc"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export BAT_THEME=ansi

#Use neovim instead of vim
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

#Use bat instead of cat
alias cat='bat'

#Opening Config
alias opprofile='vim ~/.zprofile'
alias spprofile='. ~/.zprofile'

alias op='vim ~/.zshrc'
alias sp='source ~/.zshrc'

alias opvr='vim ~/.config/nvim'

#Terminal
alias cl='clear'
alias cdl='cl && dl'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#Git
alias g='git'
alias gaa='git add .'
alias gacm='git commit -a -m'
alias gacane='git commit -a --amend --no-edit'
alias gcane='git commit --amend --no-edit'
alias gca='git commit --amend'
alias gacaneud='git commit -a --amend --no-edit --date=now'
alias gpm='git checkout master && git pull && grmbm'
alias gin='git pull'
alias gst='git status'
alias gdf='git df'
alias gdfc='git dfc'
alias gout='git push'
alias gc='gcmm'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Enable colours
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HOMEBREW_NO_ENV_HINTS=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd .'
function vf() {
  vim $(fzf --query "$1")
}
