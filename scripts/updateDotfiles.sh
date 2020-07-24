#!/bin/bash

#Bash
cp ~/.bash_profile .
cp ~/.bashrc .

#zsh
cp ~/.zshrc .
cp -r ~/.oh-my-zsh/custom/themes/marc .oh-my-zsh/custom/themes/

#p10k
cp ~/.p10k.zsh .

#Vim
cp ~/.vimrc .

#Git
cp ~/.gitconfig .

#Git Bash for Windows
cp ~/.minttyrc .

#Atom
cp ~/.atom/keymap.cson ./atom
cp ~/.atom/config.cson ./atom

#Shellcheck
cp ~/.shellcheckrc .

#tmux
cp ~/.tmux.conf .

#Do Git Commit
if [ $# -eq 0 ]; then
	git st
	echo "No message given, not committing"
else
	git st
	git add .
	git cm -m "$1"
fi
