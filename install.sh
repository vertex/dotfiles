#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
mkdir -p $HOME/tmp
TMPDIR=$HOME/tmp
mkdir -p $TMPDIR/dotfiles
mkdir -p $HOME/src
for DOTFILE in .bashrc .zshrc .vimrc .nbrc .tmux.conf
do
	mv $HOME/$DOTFILE $TMPDIR/dotfiles/$DOTFILE
	ln -s $SCRIPTPATH/$DOTFILE $HOME/$DOTFILE
done
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
