#!/usr/bin/env zsh
set -o xtrace

#git clone --recursive https://github.com/zsh-users/prezto.git $HOME/dotfiles/prezto
#git clone --recursive https://github.com/d-nnis/prezto.git $HOME/dotfiles/prezto
git pull && git submodule update --init --recursive

setopt EXTENDED_GLOB
for rcfile in $HOME/dotfiles/prezto/runcoms/^README.md(.N); do
  if [ -f "$HOME/.${rcfile:t}" ]; then  # file exists
    mkdir -p $HOME/dotfiles_backup
    cp "$HOME/.${rcfile:t}" dotfiles_backup
    rm "$HOME/.${rcfile:t}"
  elif [ -L "$HOME/.${rcfile:t}" ]; then  # file only exists as dangling symlink
    rm "$HOME/.${rcfile:t}"
  fi

  ln -sv "$rcfile" "$HOME/.${rcfile:t}"
done
