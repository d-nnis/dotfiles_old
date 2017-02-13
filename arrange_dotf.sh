#!/usr/bin/env bash
set -o xtrace

#setup dotfiles_backup
if [ -f $HOME/.vimrc ]; then
  rm $HOME/.vimrc
fi
ln -sv $HOME/dotfiles/vimrc $HOME/.vimrc

if [ -d $HOME/.vim ]; then
  rm -rf $HOME/.vim
fi
ln -sv $HOME/dotfiles/vim $HOME/.vim

if [ -f $HOME/.vimperatorrc ]; then
  rm $HOME/.vimperatorrc
fi
ln -sv $HOME/dotfiles/vimperatorrc $HOME/.vimperatorrc

if [ -d $HOME/.vimperator ]; then
  rm -rf $HOME/.vimperator
fi
ln -sv $HOME/dotfiles/vimperator $HOME/.vimperator

if [ -d $HOME/.zprezto ]; then
  rm -rf $HOME/.zprezto
fi
ln -sv $HOME/dotfiles/prezto $HOME/.zprezto

if [ -d $HOME/.vimperator ]; then
  rm -rf $HOME/.vimperator
fi
ln -sv $HOME/dotfiles/vimperator $HOME/.vimperator
