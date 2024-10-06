# OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"

# Set the cache to a more permanent directory
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache

if [ ! -d $ZSH_CACHE_DIR ];
 then mkdir $ZSH_CACHE_DIR
fi 

# `compinit` scans $fpath, so do this before calling it. 
fpath=(~/.zsh/functions $fpath) autoload -Uz compinit && compinit -u

# fnm
eval "$(fnm env --use-on-cd)"

source ~/.oh-my-zsh/custom/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
#ZSH_THEME="gruvbox"
#SOLARIZED_THEME="dark"

plugins=(colored-man-pages git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete golang z fnm)

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
alias ll="exa -l -g --icons --git"
alias llt="exa -1 --icons --tree --git-ignore"

#Git
alias g='git'
alias gaa='git add .'
alias gcmm='git commit -m'
alias gcmt='git commit -m'
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
alias p='pnpm'
alias nukenpm='rm -rfv node_modules && rm package-lock.json'

# tmux
alias t='tmux'
alias ta='tmux attach-session -t'
alias tn="tmux new -s $(basename $(pwd))"
alias tls="tmux ls"

alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias checksig="spctl -a -vvv -t install"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd .'
function vf() {
  vim $(fzf --query "$1")
}

function cdf() {
  cd $(fzf --query "$1")
}

# zsh-autocomplete
zstyle ':autocomplete:*' min-delay 0.3
zstyle ':autocomplete:*complete*:*' insert-unambiguous no
zstyle ':autocomplete:*history*:*' insert-unambiguous no
zstyle ':autocomplete:menu-search:*' insert-unambiguous no
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# turn off zsh-autocomplete history search
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# pnpm
export PNPM_HOME="/Users/marc/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/marc/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/marc/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zsh

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

