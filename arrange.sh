#!/usr/bin/env bash
set -o xtrace

## symlinks HOME -- ~/.<file> -> ~/dotfiles/<file>
link_home="vimperatorrc vimperatorrc.local vimperator"
link_home+=" vimrc vim bashrc"
link_home+=" zprezto gitconfig"
link_home+=" tmux.conf tmux"
#link_home+=" fzf fzf.bash fzf.zsh" # managed via vim-plug
link_home+=" Xmodmap Xresources Xresources.d urxvt fonts"
link_home+=" multitailrc"
link_home+=" lesskey"
#link_home+=" mc"

deskenv=1
install=0

# remove existing backup
if [ -d $HOME/dotfiles_backup ]; then
  rm -rfv $HOME/dotfiles_backup
else
  mkdir -p $HOME/dotfiles_backup
fi

# TODO: local .vim still present ...?!

for link in $link_home; do
  echo $link
  if [ -f $HOME/.$link ]; then
    mv -fv $HOME/.$link $HOME/dotfiles_backup
  elif [ -L $HOME/.$link ]; then
    rm -rfv $HOME/.$link
  fi
  ln -sv $HOME/dotfiles/$link $HOME/.$link
done


## symlinks XDG_CONFIG_DIR -- ~/.config/<program-dir> -> ~/dotfiles/config/<program-dir>
##                            ^^^^^ `pwd -L` ^^^^^^^  -> ^^^^^^^^ `pwd -P` ^^^^^^^^^^^^^
## respecting XDG_CONFIG_DIR default, only symlinking specific dirs
link_config="mc htop"
#link_config+=" "

mkdir -p $HOME/dotfiles_backup/config

for link in $link_config; do
  echo $link
  if [ -d $HOME/.config/$link ]; then
    mv -fv $HOME/.config/$link $HOME/dotfiles_backup/config
  elif [ -L $HOME/.config/$link ]; then
    rm -rfv $HOME/.config/$link
  fi
  ln -sv $HOME/dotfiles/config/$link $HOME/.config/$link
done

# for less and lesskey keybindings
#touch $HOME/.lesskey
lesskey &

## programs only for terminal environment
list="tmux zsh xsel xclip sysstat zsh git-flow git silversearcher-ag curl multitail vim-gnome mc mc-data"
#list+=" moc moc-ffmpeg-plugin  # ncurses audio-player
## programs for desktop environment
if [ $deskenv -eq 1 ]; then
  list+=" wmctrl rxvt-unicode-256color firefox-esr "
fi

packages() {
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

## TODO: install vim- and tmux-plugins from shell
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins

# prerequisites
## git clone --recursive https://github.com/d-nnis/dotfiles.git
git submodule update --init --recursive

sudo chsh -s /usr/bin/zsh

rcfiles="zlogin zlogout zpreztorc zprofile zshenv zshrc"

setopt EXTENDED_GLOB
for rcfile in $rcfiles; do
  if [ -f "$HOME/.$rcfile" ]; then  # file exists
    mkdir -p $HOME/dotfiles_backup
    cp "$HOME/.$rcfile" $HOME/dotfiles_backup
    rm "$HOME/.$rcfile"
  elif [ -L "$HOME/.$rcfile" ]; then  # file only exists as dangling symlink
    rm "$HOME/.$rcfile"
  fi
  ln -sv "dotfiles/zprezto/runcoms/$rcfile" "$HOME/.$rcfile"
done

fc-cache ~/.fonts
xrdb ~/.Xresources
xmodmap ~/.Xmodmap

exit 0

