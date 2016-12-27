#!/bin/sh

cd ~/dotfiles
for d in */ ; do
    stow ${d%/}
done

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
