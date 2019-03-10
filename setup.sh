#!/bin/zsh

# Checks
CMDS=virtualenv nvim fzf
for CMD in CMDS; do
    if ! [ -x "$(command -v $CMD)" ]; then
        echo "$CMD not installed. Cannot proceed."
        exit 1
    fi
done

# re-link zsh config
ZSHRC=$HOME/.zshrc
mv -f $ZSHRC $ZSHRC.orig
ln -s `pwd`/zshrc $ZSHRC

# install zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# brew install fzf neovim && true

# Virtual ENV
virtualenv $HOME/.local/local-env

# reload
source ~/.zshrc

# install plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# relink vimrc
mkdir -p $HOME/.config/nvim
VIMRC=$HOME/.config/nvim/init.vim
mv -f $VIMRC $VIMRC.orig
ln -s `pwd`/init.vim $VIMRC

# remaining setup
pip3 install neovim
nvim +PlugInstall +UpdateRemotePlugins +qall
