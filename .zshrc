# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/marc/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.colors.sh
plugins=(colored-man-pages autojump git adb zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
autoload -Uz zcalc
alias calc="zcalc"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

autoload -Uz compinit && compinit

#Use neovim instead of vim
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

#Opening Config
alias opprofilea='atom ~/.zprofile'
alias opprofile='vim ~/.zprofile'
alias spprofile='. ~/.zprofile'

alias opa='atom ~/.bashrc'
alias op='vim ~/.zshrc'
alias sp='source ~/.zshrc'

alias opvr='vim ~/.vimrc'
alias optmux='vim ~/.tmux.conf'

alias opwm='vim ~/.config/bspwm/bspwmrc'
alias opkb='vim ~/.config/sxhkd/sxhkdrc'
alias opbar='vim ~/.config/polybar/config'
alias opnot='vim ~/.config/dunst/dunstrc'

#Reload bspwm
alias rlwm='~/.config/bspwm/bspwmrc'

#Do Not Disturb
alias dndon='killall -SIGUSR1 dunst && echo "Notifications Paused"'
alias dndoff='killall -SIGUSR2 dunst && echo "Notifications Resumed"'

#Terminal
alias cl='clear'
alias cdl='cl && dl'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#Docker
alias d='docker'
alias dco='docker-compose'
alias removecontainers='d rm $(d ps -aq)'
alias removeservices='d service rm $(d service ls -q)'
alias inspect='d service inspect'
alias lsdocs='d service ls'
alias cllsdocs='cl && lsdocs'
alias cleanExitDoc='d ps -a | grep Exit | cut -d " " -f 1 | xargs d rm && lsdocs'
alias lsdocc='d container ls'
alias cllsdocc='cl && lsdocc'

#Rust/Cargo
alias c='cargo'

#Navigation
#shellcheck disable=SC2034
DOC_DIR='~/Documents'
alias doc='cd $DOC_DIR'
alias cddr='cd $DOC_DIR/code'
alias cddot='cd $DOC_DIR/code/dotfiles'

#Managing dotfiles repo
alias ud='cddot && ./dotfile-scripts/updateDotfiles.sh'

#Git
alias g='git'
alias gaa='git add .'
alias gacane='git add . && git commit --amend --no-edit'
alias gpm='git checkout master && git pull && grmbm'
alias gin='git pull'
alias gst='git status'
alias gcm='git commit -m'
alias gdf='git df'
alias gdfc='git dfc'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
