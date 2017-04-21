#!/usr/bin/env bash

set -o xtrace

## install switches
deskenv=0
entertainment=0
check_pkg=0
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
link_home+=" vimrc vim"
link_home+=" bashrc bash_logout bash_profile"
link_home+=" zprezto gitconfig"
link_home+=" tmux.conf tmux"
#link_home+=" fzf fzf.bash fzf.zsh" # managed via vim-plug
link_home+=" Xmodmap Xresources Xresources.d xbindkeysrc urxvt fonts"
link_home+=" multitailrc w3m"
link_home+=" lesskey moc htoprc"
link_home+=" asciidoc antigen ls++.conf dircolors"

# remove existing backup
if [ -d $HOME/backup_dotfiles ]; then
  rm -rfv $HOME/backup_dotfiles
fi
# make dir in any case
mkdir -pv $HOME/backup_dotfiles

# TODO: local .vim still present ...?!
# sometimes link to itself. How come?
for link in $link_home; do
  echo $link
  if [ -L $HOME/.$link ]; then
    echo -n "link "
    rm -rfv $HOME/.$link
  elif [ -e $HOME/.$link ]; then
    mv -fv $HOME/.$link $HOME/backup_dotfiles
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
link_config="mc htop"
link_config+=" redshift.conf"

mkdir -pv $HOME/backup_dotfiles/config

for link in $link_config; do
  echo $link
  if [ -L $HOME/.config/$link ]; then
    echo -n "link "
    rm -rfv $HOME/.config/$link
  elif [ -e $HOME/.config/$link ]; then
    mv -fv $HOME/.config/$link $HOME/backup_dotfiles/config
  fi
  ln -sv $HOME/dotfiles/config/$link $HOME/.config/$link
done

# for less and lesskey keybindings
#touch $HOME/.lesskey
lesskey &

## programs only for terminal environment
if [ $terminal -eq 1 ]; then
  list="tmux zsh xsel xclip sysstat zsh git-flow git silversearcher-ag"
  list+=" curl w3m w3m-img lynx"
  list+=" cups-pdf multitail vim-gnome mc mc-data odt2txt"
  list+=" xbindkeys xbidnkeys-config"
  list+=" tree"
  list+=" x11vnc x11vnc-data ssvnc" # remote stuff
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

install_pkg=0
if [ "$check_pkg" -gt "0" ]; then
  check_packages() {
    for el in $list; do
      dpkg -l $el > /dev/null
      if [ $? -eq 1 ]; then
        install_pkg=1
      fi
    done
  }
fi

if [ "$install_pkg" -eq "1" ]; then
  echo install packages
  sudo apt-get update
  sudo apt-get -y install $list
fi

## perl5 local lib
# TODO: automate local lib installation
# do not append local lib paths, as they are
# already provided in zshrc and bashrc
if [ "$terminal" -gt 0 ]; then
  cpan CPAN
  CPANS="Term::ExtendedColor"
  cpan $CPANS
fi

## textaid (vimium) server: start once at startup
# TODO: 
if [ -e /etc/cron.d/textaid-server ]; then
  rm -vf /etc/cron.d/textaid-server
fi
echo "@reboot * * * * $USER $HOME/dotfiles/lib/textaid-server.pl" | sudo tee /etc/cron.d/textaid-server


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
  if [ -L "$HOME/.$rcfile" ]; then  # file only exists as dangling symlink
    echo -n "link "
    rm -fv "$HOME/.$rcfile"
  elif [ -f "$HOME/.$rcfile" ]; then  # file exists
    cp -v "$HOME/.$rcfile" $HOME/backup_dotfiles
    rm -v "$HOME/.$rcfile"
  fi
  ln -sv "dotfiles/zprezto/runcoms/$rcfile" "$HOME/.$rcfile"
done

fc-cache ~/.fonts
xrdb ~/.Xresources
# TODO: still 2 errors
xmodmap ~/.Xmodmap
#antigen-apply

## TODO: ghide-file sync
# source/ read githidden, combine with gfmS

exit 0

