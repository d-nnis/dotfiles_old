#!/usr/bin/env zsh

git clone --recursive https://github.com/zsh-users/prezto.git $HOME/dotfiles/prezto

setopt EXTENDED_GLOB
for rcfile in $HOME/dotfiles/prezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "$HOME/.${rcfile:t}"
done
