alias vi='vim'
alias vim='vim'
alias vimdiff='vim -d'

#Opening Config
alias opprofile='vim ~/.bash_profile'
alias spprofile='. ~/.bash_profile'

alias op='vim ~/.bashrc'
alias sp='source ~/.bashrc'

alias opvr='vim ~/.vimrc'

#Terminal
alias cl='clear'
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

#Kubernetes
alias mkstart='minikube start --memory 5120 --cpus=4 && echo "Setting Minikube docker-env" && eval $(minikube -p minikube docker-env) && echo "Minikube docker-env set"'

#Navigation
alias cddr='cd ~/Documents/code'
alias cddot='cd ~/Documents/code/dotfiles'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
