#!/bin/bash

#Bash
cp .bash_profile ~
cp .bashrc ~

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
