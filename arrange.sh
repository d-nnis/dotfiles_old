#!/usr/bin/env bash
set -o xtrace

## install switches
deskenv=0
entertainment=0
install_pkg=0
terminal=1

if [ "$1" == "-a" ]; then
  deskenv=1
  entertainment=1
  echo install of deskenv, terminal and entertainment packages
elif [ "$1" == "-T" ]; then
  terminal=0
  echo no install, just arrange
elif [ "$1" == "-h" ]; then
  echo usage  $0 -a  -- installation for deskenv, terminal
  echo   and entertainment packages
  echo default: only necessary deb-packages and
  echo   terminal setup
else
  echo install only terminal packages
fi

## symlinks HOME -- ~/.<file> -> ~/dotfiles/<file>
link_home="vimperatorrc vimperatorrc.local vimperator"
link_home+=" vimrc vim bashrc"
link_home+=" zprezto gitconfig"
link_home+=" tmux.conf tmux"
#link_home+=" fzf fzf.bash fzf.zsh" # managed via vim-plug
link_home+=" Xmodmap Xresources Xresources.d xbindkeysrc urxvt fonts"
link_home+=" multitailrc w3m"
link_home+=" lesskey moc htoprc"
link_home+=" asciidoc antigen"

# remove existing backup
if [ -d $HOME/dotfiles_backup ]; then
  rm -rfv $HOME/dotfiles_backup
fi
# make dir in any case
mkdir -p $HOME/dotfiles_backup

# TODO: local .vim still present ...?!
# sometimes link to itself. How come?
for link in $link_home; do
  echo $link
  if [ -L $HOME/.$link ]; then
    rm -rfv $HOME/.$link
  elif [ -f $HOME/.$link ]; then
    mv -fv $HOME/.$link $HOME/dotfiles_backup
  fi
  if [ ! -e $HOME/.$link ]; then
    ln -sv $HOME/dotfiles/$link $HOME/.$link
  else
    echo !! .$link still present?
  fi
done


## symlinks XDG_CONFIG_DIR -- ~/.config/<program-dir> -> ~/dotfiles/config/<program-dir>
##                            ^^^^^ `pwd -L` ^^^^^^^  -> ^^^^^^^^ `pwd -P` ^^^^^^^^^^^^^
## respecting XDG_CONFIG_DIR default, only symlinking specific dirs
link_config="mc"
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
if [ $terminal -eq 1 ]; then
  list="tmux zsh xsel xclip sysstat zsh git-flow git silversearcher-ag"
  list+=" curl multitail vim-gnome mc mc-data odt2txt w3m w3m-img"
  list+=" cups-pdf"
  list+=" xbindkeys"
fi
if [ $entertainment -eq 1 ]; then
  list+=" moc moc-ffmpeg-plugin librcc-dev"  # ncurses audio-player
  list+=" xmms2"
  if [ $terminal -eq 1 ]; then
    list+=" esperanza"
  fi
fi
## programs for desktop environment
if [ $deskenv -eq 1 ]; then
  list+=" wmctrl rxvt-unicode-256color firefox-esr "
fi

check_packages() {
  for el in $list; do
    dpkg -l $el > /dev/null
    if [ $? -eq 1 ]; then
      install_pkg=1
    fi
  done
}

check_packages

if [ "$install_pkg" -eq "1" ]; then
  install packages
  sudo apt-get update
  sudo apt-get -y install $list
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# TODO: errors?
$HOME/.tmux/plugins/tpm/bin/install_plugins

# prerequisites
## git clone --recursive https://github.com/d-nnis/dotfiles.git
git submodule update --init --recursive --merge

if [[ "$(which $SHELL)" != *zsh ]]; then
  sudo chsh -s /usr/bin/zsh
  echo zsh is default shell
else
  echo zsh is already default shell
fi

rcfiles="zlogin zlogout zpreztorc zprofile zshenv zshrc"

#setopt EXTENDED_GLOB
for rcfile in $rcfiles; do
  if [ -f "$HOME/.$rcfile" ]; then  # file exists
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
antigen apply

exit 0

