#!/bin/bash

#Bash
cp .bash_profile ~
cp .bashrc ~

#zsh
cp .zshrc ~

#p10k
cp .p10k.zsh ~

#Vim
cp .vimrc ~

#Git
cp .gitconfig ~

#Atom
cp atom/keymap.cson ~/.atom/keymap.cson
cp atom/config.cson ~/.atom/config.cson

#Shellcheck
cp .shellcheckrc ~

#Git Bash for Windows
cp .minttyrc ~

#tmux
cp .tmux.conf ~
