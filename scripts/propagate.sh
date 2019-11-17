#!/bin/sh
#TODO script doesn't work on Linux

#Name of the directory one level up
mainDir=$(dirname "$(pwd)")

#Bash
cp "$mainDir"/.bash_profile ~
cp "$mainDir"/.bashrc ~

#Vim
cp "$mainDir"/.vimrc ~

#Git
cp "$mainDir"/.gitconfig ~

#Atom
cp "$mainDir"/atom/keymap.cson ~/.atom/keymap.cson
cp "$mainDir"/atom/config.cson ~/.atom/config.cson

#Shellcheck
cp "$mainDir"/.shellcheckrc ~

#Git Bash for Windows
cp "$mainDir"/.minttyrc ~
