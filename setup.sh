#!/bin/sh

cd ~/dotfiles
for d in */ ; do
    stow ${d%/}
done
