#!/bin/sh

#zsh
cp ~/.zshrc .

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

#bspwm
cp ~/.config/bspwm/bspwmrc ./.config/bspwm/bspwmrc
cp ~/.config/sxhkd/sxhkdrc ./.config/sxhkd/sxhkdrc

#polybar
cp ~/.config/polybar/config ./.config/polybar/config
cp ~/.config/polybar/launch.sh ./.config/polybar/launch.sh

#dunst
cp ~/.config/dunst/dunstrc ./.config/dunst/dunstrc

#rofi
cp ~/.config/rofi/config ./.config/rofi/config
cp ~/.config/rofi/marc.rasi ./.config/rofi/

#fzf
cp ~/.fzf.zsh .

#icons
cp ~/.icons/default/index.theme ./.icons/default/index.theme

#Xresources
cp ~/.Xresources .

#gnome
cp ~/.config/gtk-2.0/gtkfilechooser.ini ./.config/gtk-2.0/gtkfilechooser.ini
cp ~/.config/gtk-3.0/settings.ini ./.config/gtk-3.0/settings.ini
cp ~/.config/gtk-4.0/settings.ini ./.config/gtk-4.0/settings.ini

#colors
cp ~/.colors.sh .

echo 'If you made changes to polybar etc, make sure all the files you need were copied before committing'
