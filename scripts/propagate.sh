#Name of the directory one level up
mainDir=$(dirname "$(pwd)")

#Bash
cp "$mainDir"/.bash_profile ~
cp "$mainDir"/.bashrc ~

#Vim
cp "$mainDir"/.vimrc ~

#Git
cp "$mainDir"/.gitconfig ~

#Git Bash for Windows
cp "$mainDir"/.minttyrc ~
