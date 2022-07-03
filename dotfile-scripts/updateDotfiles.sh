#!/bin/sh

#zsh
cp ~/.zshrc .
cp ~/.zprofile .
cp ~/.p10k.zsh .

#Vim
cp ~/.ideavimrc .
cp ~/.config/nvim/init.vim nvim

#Git
cp ~/.gitconfig .

echo "Copied dotfiles"
