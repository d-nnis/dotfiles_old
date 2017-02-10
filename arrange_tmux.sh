#!/usr/bin/env bash

sudo apt update
sudo apt install tmux

if [ -f $HOME/.tmux.conf ]; then
  rm $HOME/.tmux.conf
fi

ln -sv $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/dotfiles/tmux

ln -sv $HOME/dotfiles/tmux $HOME/.tmux

git clone https://github.com/tmux-plugins/tpm $HOME/dotfiles/tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins


