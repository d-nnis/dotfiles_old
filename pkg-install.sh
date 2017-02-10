#!/usr/bin/env bash

GUI=0 # gui pkg
SH=0  # shell pkg

while getopts ":ags" opt; do
  case $opt in
    a)
      echo "gui and shell pkg"
      GUI=1
      SH=1
      ;;
    g)
      echo "gui pkgs"
      GUI=1
      ;;
    s)
      echo "shell pkgs"
      SH=1
      ;;
    \?)
      echo "invalid option: -$OPTARG"
      echo "valid options:"
      echo "-a - install all: gui and shell pkgs"
      echo "-g - install gui pkgs"
      echo "-s - install shell pkgs"
      exit 1
      ;;
  esac
done

if [ "$GUI" == 1 ]; then
  echo "install gui pkgs"
  #sudo apt-get update
  #sudo apt install 
  #vimperator
  echo "done"
fi

if [ "$SH" == 1 ]; then
  echo "install shell pkgs"
  sudo apt-get update
  sudo apt install git git-flow pyenv pyenv-virtualenv vim-gnome tmux mc 
  #borg via jessie-backports
  echo "done"
fi

exit 0

