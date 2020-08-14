# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/marc/.jetbrainsscripts

export ZSH="/home/marc/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.colors.sh
plugins=(colored-man-pages autojump git adb zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
autoload -Uz zcalc
alias calc="zcalc"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#Use neovim instead of vim
alias vi='nvim'
alias vim='nvim'

#Opening Config
alias opprofilea='atom ~/.bash_profile'
alias opprofile='vim ~/.bash_profile'
alias spprofile='. ~/.bash_profile'

alias opa='atom ~/.bashrc'
alias op='vim ~/.zshrc'
alias sp='source ~/.zshrc'

alias opvr='vim ~/.vimrc'
alias optmux='vim ~/.tmux.conf'

alias opwm='vim ~/.config/bspwm/bspwmrc'
alias opkb='vim ~/.config/sxhkd/sxhkdrc'
alias opbar='vim ~/.config/polybar/config'

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

#Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

#Dynamo
alias startdynamo='docker run --name dynamo -d -p 8000:8000 amazon/dynamodb-local'

#Rust/Cargo
alias c='cargo'

#tmux
alias t='tmux'
alias ta='tmux attach -t'

#Navigation
#shellcheck disable=SC2034
DOC_DIR=~/Documents
alias doc='cd $DOC_DIR'
alias cddr='cd $DOC_DIR/code'
alias cddot='cd $DOC_DIR/code/dotfiles'

#Managing dotfiles repo
alias ud='cddot && ./scripts/updateDotfiles.sh'
alias pd='cddot && ./scripts/propagateDotfiles.sh'

#Git
alias g='git'
git config --global core.pager 'diff-so-fancy | less --tabs=4 -RFX'
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.cl clone
git config --global alias.b branch
git config --global alias.lo 'log --oneline'
git config --global alias.lg 'log --oneline --graph --decorate'
git config --global alias.df 'diff --color'
git config --global alias.dfc 'diff --cached --color'
git config --global alias.yeehaw 'push --force'
git config --global alias.cane 'commit --amend --no-edit'
git config --global alias.pr 'pull --rebase'
git config --global alias.cmm 'commit -m'
git config --global alias.cob 'checkout -b'
alias gaa='git add .'
alias gacane='git add . && git commit --amend --no-edit'
alias grmb='git branch --merged develop | grep -v "^[ *]*develop$" | xargs git branch -d'
alias grmbm='git branch --merged master | grep -v "^[ *]*master$" | xargs git branch -d'
alias gpm='git checkout master && git pull && grmbm'
alias gin='git pull'
alias gst='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gdf='git df'
alias gdfc='git dfc'

#FUNCTIONS
#Shows the files changed in a specified Git commit. $1 is the commit hash you want to view
function gscs() {
  g diff-tree --no-commit-id --name-status -r "$1"
}

#Shows the changes in a specified Git commit. $1 is the commit hash you want to view
function gsc() {
  g lg -p -1 "$1"
}

#Rename a local branch $1 is the original branch name, $2 is the new branch name
function grbl() {
  g b -m "$1" "$2"
}

#Renames a remote branch $1 is the original branch name, $2 is the new branch name
function grbr() {
  grbl "$1" "$2"
  g push origin :"$1"
  g push --set-upstream origin "$2"
}

#Pushes a local branch to origin, creating it at the origin if necessary
function gout() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD)
  local existsOnRemote
  existsOnRemote=$(git ls-remote | grep -c "\b${branch}$")
  if [[ existsOnRemote -eq 0 ]];then
    git push --set-upstream origin "$branch"
  else
    if [[ "$1" == "-f" ]]; then
      echo "Force pushing"
      git push --force
    else
      git push
    fi
  fi
}

#Copies an item to your clipboard without a new line character
function ctc() {
  echo "$1" | tr -d '\n' | pbcopy
}

#Gets docker service name
function dsname() {
  lsdocs --format "{{.Name}}" | grep "$1"
}

#Gets docker service ID
function dsid() {
  lsdocs | grep "$1" | awk '{ print $1 }'
}

#Gets the first docker service ID in a list
function dsidf() {
  list=$(dsid "$1")
  set -- "$list"
  echo "$1"
}

#Gets docker container ID
function dcid() {
  lsdocc | grep "$1" | awk '{ print $1 }'
}

#Gets the first docker container ID in a list
function dcidf() {
  list=$(dcid "$1")
  set -- "$list"
  echo "$1"
}

#Tails logs for a docker container
function dl() {
  d service logs --follow "$(dsname "$1")"
}

#Opens a docker container. If multiple containers are returned from dcid then it opens the first one in the list
function ocon() {
  d exec -it "$(dcidf "$1")" /bin/bash
}

#Opens a docker container with regular shell rather than bash. If multiple containers are returned from dcid then it opens the first one in the list
function oconsh() {
  d exec -it "$(dcidf "$1")" sh
}

#Removes a docker service
function rds() {
  d service rm "$(dsid "$1")"
}

#Copies something to a docker container where $1 is the local path $2 is a part of the container name and $3 is the path to move it to in the container
#E.g. to move a local version of common utils into the APH's node modules do dcp soe-common-utils auto /home/src/app/node_modules
function dcp() {
  d cp "$1" "$(dcid "$2")":"$3"
}

#Same as dcp but copies directly into the node_modules folder
function dcpnm() {
  dcp "$1" "$2" /home/src/app/node_modules/"$3"
}

#Gets the name of the git branch and outputs it in brackets
function parseGitBranch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Change up a variable number of directories
# E.g:
#   cdu   -> cd ../
#   cdu 2 -> cd ../../
#   cdu 3 -> cd ../../../
function cdu() {
  local count=$1
    if [ -z "${count}" ]; then
      count=1
    fi

  local path=""

  for i in {1..${count}}; do
    path="${path}../"
  done

  cd "$PATH" || return
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/marc/.sdkman"
[[ -s "/home/marc/.sdkman/bin/sdkman-init.sh" ]] && source "/home/marc/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
