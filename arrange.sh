#!/usr/bin/env bash
set -o xtrace

files="vimperatorrc vimperatorrc.local vimperator"
files+=" vimrc vim"
files+=" zprezto gitconfig"
files+=" tmux.conf tmux"
files+=" fzf fzf.bash fzf.zsh"
files+=" Xmodmap Xresources urxvt fonts"

deskenv=1
install=0
mkdir -p $HOME/dotfiles_backup

for file in $files; do
  echo $file
  if [ -f $HOME/.$file ]; then
    mv -fv $HOME/.$file $HOME/dotfiles_backup
  elif [ -L $HOME/.$file ]; then
    rm $HOME/.$file
  fi
  ln -sv $HOME/dotfiles/$file $HOME/.$file
done

~/.fzf/install
fc-cache ~/.fonts
xrdb ~/.Xresources

packages() {
  # packages only for terminal environment
  list="tmux zsh xsel xclip atsar iostat zsh git-flow git"
  # programs for desktop environment
  if [ $deskenv -eq 1 ]; then
    list+=" wmctrl rxvt-unicode-256color firefox vimperator"
  fi
  
  for el in $list; do
    dpkg -l $el > /dev/null
    if [ $? -eq 1 ]; then
      install=1
    fi
  done
}

if [ $install -eq 1 ]; then
  sudo apt-get update
  sudo apt-get install $list
fi


# prerequisites
## git clone --recursive https://github.com/d-nnis/dotfiles.git
git submodule update --init --recursive

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
  ln -sv "dotfiles/zprezto/runcoms/$rcfile" "$HOME/.$rcfile"
done

exit 0

