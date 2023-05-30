#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
if [[ ! -f "$HOME/.oh-my-zsh" ]]; then
	echo Installing Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


mkdir -p $HOME/tmp
TMPDIR=$HOME/tmp
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz -P $TMPDIR
mkdir -p $TMPDIR/dotfiles
mkdir -p $HOME/src

tar xzf $TMPDIR/go1.19.1.linux-amd64.tar.gz -C $HOME/src/

for DOTFILE in .bashrc .zshrc .vimrc .nbrc .tmux.conf
do
	mv $HOME/$DOTFILE $TMPDIR/dotfiles/$DOTFILE
	ln -s $SCRIPTPATH/$DOTFILE $HOME/$DOTFILE
done
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
