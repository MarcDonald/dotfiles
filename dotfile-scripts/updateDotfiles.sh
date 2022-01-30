#!/bin/sh

#zsh
cp ~/.bashrc .
cp ~/.bash_profile .

#Vim
cp ~/.vimrc .
cp ~/.ideavimrc .

#Git
cp ~/.gitconfig .

#Git Bash for Windows
cp ~/.minttyrc .

#VS Code
cp ~/AppData/Roaming/Code/User/settings.json ./vscode/

echo "Copied dotfiles"
