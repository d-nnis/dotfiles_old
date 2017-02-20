#!/usr/bin/env bash
set -o xtrace

# prerequisites
## git clone --recursive https://github.com/d-nnis/dotfiles.git

sudo chsh -s /usr/bin/zsh

rcfiles="zlogin zlogout zpreztorc zprofile zshenv zshrc"

setopt EXTENDED_GLOB
for rcfile in $rcfiles; do
  if [ -f "$HOME/.$rcfile" ]; then  # file exists
    mkdir -p $HOME/dotfiles_backup
    cp "$HOME/.$rcfile" dotfiles_backup
    rm "$HOME/.$rcfile"
  elif [ -L "$HOME/.$rcfile" ]; then  # file only exists as dangling symlink
    rm "$HOME/.$rcfile"
  fi
#dotfiles/zprezto/runcoms/$rcfile
  ln -sv "dotfiles/zprezto/runcoms/$rcfile" "$HOME/.$rcfile"
done

# tmux
which tmux
if [ "$?" -eq "1" ];then
  sudo apt update
  sudo apt install tmux
fi

git submodule update --init --recursive

exit 0

