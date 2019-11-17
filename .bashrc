alias opa='open -a Atom ~/.bashrc'
alias op='vim ~/.bashrc'
alias sp='. ~/.bashrc'

alias opprofilea='open -a Atom ~/.bash_profile'
alias opprofile='vim ~/.bash_profile'
alias spprofile='. ~/.bash_profile'

alias opvr='vim ~/.vimrc'

#Terminal
alias cl='clear'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#Managing dotfiles repo
alias ud='cddr && cd dotfiles/scripts && ./update.sh'
alias pd='cddr && cd dotfiles/scripts && ./propagate.sh'

#Docker
alias d='docker'
alias dco='docker-compose'
alias inspect='d service inspect'
alias lsdocs='d service ls'
alias cllsdocs='cl && lsdocs'
alias cleanExitDoc='d ps -a | grep Exit | cut -d " " -f 1 | xargs docker rm && lsdocs'
alias lsdocc='d container ls'
alias cllsdocc='cl && lsdocc'

#Navigation
alias doc='cd ~/Documents'
alias cddr='doc && cd Code'
alias cddot='cddr && cd dotfiles'
alias anddr='cddr && cd Android'

#Dynamo
alias startdynamo='cd ~/DynamoDB && java -Djava.library.path=DynamoDBLocal_lib -jar DynamoDBLocal.jar'

#Git
alias g='git'
alias gaa='g add .'
alias grmb='git branch --merged master | grep -v "^[ *]*master$" | xargs git branch -d'
alias gpm='git checkout master && git pull && grmb'

#Functions
#Gets Docker service name
function dsname() {
	lsdocs --format "{{.Name}}" | grep "$1"
}

#Gets Docker service ID
function dsid() {
	lsdocs | grep "$1" | awk '{ print $1 }'
}

#Prints the ports the Gateway is currently running on
function wgp() {
	lsdocs | grep gateway | awk '{ print $6 }'
}

#Gets Docker container ID
function dcid() {
	lsdocc | grep "$1" | awk '{ print $1 }'
}

#Tails logs for a Docker container
function dl() {
	docker service logs --follow "$(dsname "$1")"
}

#Opens a Docker container
function ocon() {
	docker exec -it "$(dcid "$1")" /bin/bash
}

#Removes a Docker service
function rds() {
	docker service rm "$(dsid "$1")"
}

#Copies something to a docker container where $1 is the local path $2 is a part of the container name and $3 is the path to move it to in the container
#E.g. to move a local version of common utils into the APH's node modules do dcp soe-common-utils auto /home/src/app/node_modules
function dcp() {
	docker cp "$1" "$(dcid "$2")":"$3"
}

#Same as dcp but copies directly into the node_modules folder
function dcpnm() {
	dcp "$1" "$2" /home/src/app/node_modules/"$3"
}

#Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#Color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

#Color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#Enable programmable completion features (you don't need to enable this if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
