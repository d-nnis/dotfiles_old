# dotfiles
*Home Sweet Home?*
*Home Dot Home!*

*From Middle English hous, hus, from Old English hūs (“dwelling, shelter, house”)* [https://en.wiktionary.org/wiki/house]

## Installation
start zsh-shell
run arrange_pkg.zsh
run arrange_dotfiles.zsh

start shell anew

## The KEY NAVIGATION!
### git ...
* al ~~ list git aliases available in current dir
* r ~~ list remotes with all information
* l ~~ log --graph
* st ~~ status + ignored files
### Tmux
* \<prefix\> R ~~ source ~/.tmux.conf

### VIM
* i_CTRL+v ~~ insert sytem clipboard (in insert mode)

### TMUX-VIM integration
* \<C-h\> ~~ switch to pane (tmux)/ window (vim) to the left
* \<C-j\> ~~ switch to pane (tmux)/ window (vim) down
* \<C-k\> ~~ switch to pane (tmux)/ window (vim) up
* \<C-l\> ~~ switch to pane (tmux)/ window (vim) to the right

### Vimperator
* <leader> is ,
* <leader> t ~~ open URL in background
* <leader> T ~~ open URL in background based on current URL

## todo
* BROKEN
  * start first tmux session: sourcing tmux.reset.conf
* To consider
  * Updating of submodules of vim rather via vim-plug (command line).
* freeze-in
  * ini in config/mc
  * in vimperatir/info/default
  * check in config/mc/
  * checkout ini (although is ignored - frozen state)
* bright and dark settings
  * depending on sys-time?
  * like red-light
* git
  * config rather than alias?
* Link-safer for terminal (bookmark) (s.a. [[ Tools#Collaboration ]]
* vimperator plugins - colors
* git abbreviation - package (prezto?)
* prezto
  * in what why does the order matter?
* vim
  * \<C-M-s\> ~~ Ctrl+Alt+S ?
  * gvim ~~ set C-M-v to insert...
  * y$ ~~ copy till real end of line
  * i\_\<End\> ~~ end of *screen*-line <> <End> ~~ end of *real* line.
* tmux
  * autostart session if none exists
  * ... attach if no other client is attached
  * ... do not attach else and give feedback
  * break pane: even if it is a vim window-split
* vimperator
  * if \<wiki-url-pattern\>, focus on wiki-text-edit-frame textarea#wpTextbox1, send-keys \<C-i\>
    *  \<Esc\> - leave insert mode of ff-tab
    *  leave note, along the lines *editing in window gvim1*
    * opt.: position gvim-window on textarea
  *  keymapping to switch to correct window for continue editing
  *  search in website-source w/o viewsource (e.g. link contents)
  *  TEXTAREA?
  *  when mouse-click retreat from INSERT mode
* dependencies:
  * zsh
  * git-flow
  * vim-gnome
  * sar/atsar and/or iostat for tmux-cpu
