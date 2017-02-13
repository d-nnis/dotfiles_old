#!/usr/bin/env bash

set -o xtrace

sudo apt update
sudo apt install tmux

if [ -f $HOME/.tmux.conf ]; then
  # make backup
  rm $HOME/.tmux.conf
fi
ln -sv $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

if [ -d $HOME/.tmux ]; then
  rm -rf $HOME/.tmux
  #mkdir -p $HOME/dotfiles/tmux
fi
ln -sv $HOME/dotfiles/tmux $HOME/.tmux

# notwendige nach arrange_prezto?
# eigtl nicht...
#git clone https://github.com/tmux-plugins/tpm $HOME/dotfiles/tmux/plugins/tpm
#$HOME/.tmux/plugins/tpm/bin/install_plugins


