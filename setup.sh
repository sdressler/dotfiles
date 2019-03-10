#!/bin/bash

# install zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

brew install fzf

# link zsh config
mv ~/.zshrc ~/.zshrc.orig
ln -s zshrc ~/.zshrc

# reload
source ~/.zshrc
