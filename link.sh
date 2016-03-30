#!/bin/sh

git submodule update --init --recursive
cd ~
ln -s .dotfiles/.emacs.d .emacs.d
ln -s .dotfiles/.oh-my-zsh .oh-my-zsh
ln -s .dotfiles/.vim .vim
ln -s .dotfiles/.Xmodmap .Xmodmap
ln -s .dotfiles/.Xresources .Xresources
ln -s .dotfiles/.aliases .aliases
ln -s .dotfiles/.dir_colors .dir_colors
ln -s .dotfiles/.tmux.conf .tmux.conf
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/.xsession .xsession
ln -s .dotfiles/.zshrc .zshrc
mkdir -p .config/i3 && ln -s ~/.dotfiles/i3_config ~/.config/i3/config
vim +PluginInstall +qall
