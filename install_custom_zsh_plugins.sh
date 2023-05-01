#!/bin/sh

PLUGIN_DIR=~/.oh-my-zsh/custom/plugins
THEME_DIR=~/.oh-my-zsh/custom/themes

# zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm "$PLUGIN_DIR"/zsh-nvm

# catppuccin
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git "$THEME_DIR"/catppuccin

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git "$PLUGIN_DIR"/zsh-autocomplete
