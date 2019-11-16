alias opa='open -a Atom ~/.bashrc'
alias op='vim ~/.bashrc'
alias sp='. ~/.bashrc'

alias opprofilea='open -a Atom ~/.bash_profile'
alias opprofile='vim ~/.bash_profile'
alias spprofile='. ~/.bash_profile'

alias opvr='vim ~/.vimrc'

alias cl='clear'

#Managing dotfiles repo
alias ud='cddr && cd Dotfiles/scripts && ./update.sh'
alias pd='cddr && cd Dotfiles/scripts && ./propagate.sh'

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
alias anddr='cddr && cd Android'

#Dynamo
alias startdynamo='cd ~/DynamoDB && java -Djava.library.path=DynamoDBLocal_lib -jar DynamoDBLocal.jar'

#Git
alias g='git'
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.cl clone
git config --global alias.b branch
git config --global alias.lo 'log --oneline'
git config --global alias.lg 'log --oneline --graph --decorate'
git config --global alias.wd 'diff --word-diff'
git config --global alias.wdc 'diff --word-diff --cached'
git config --global alias.yeehaw 'push --force'
git config --global alias.cane 'commit --amend --no-edit'
git config --global alias.pr 'pull --rebase'
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
