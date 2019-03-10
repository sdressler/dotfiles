#!/bin/zsh

set -x

# re-link zsh config
ZSHRC=$HOME/.zshrc
mv $ZSHRC $ZSHRC.orig
ln -s `pwd`/zshrc $ZSHRC

# install zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

brew install fzf

# reload
source ~/.zshrc

# relink vimrc
VIMRC=$HOME/.config/nvim/init.vim
mv $VIMRC $VIMRC.orig
ln -s `pwd`/vimrc $VIMRC

nvim +PlugInstall +qall
