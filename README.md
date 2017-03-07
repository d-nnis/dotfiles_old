# dotfiles
*Home Sweet Home?*
*Home Dot Home!*

*From Middle English hous, hus, from Old English hūs (“dwelling, shelter, house”)* https://en.wiktionary.org/wiki/house

## Installation
start zsh-shell
run arrange

start shell anew || $SHELL

## The key navigation
* An overview of regular and customized functions and key bindings which will grow and change from time to time.
* caps lock is mapped to escape via Xmodmap
* coned        # load all relevant config files into Vim
* conrel (-a)  # reload

### git ...
* al ~~ list git aliases available in current dir
* r ~~ list remotes with all information
* l ~~ log --graph
* st ~~ status + ignored files
* subst ~~ status of all submodules

### Shell
* fzf (FuzzyFind)
  * `<dir>/file**<tab>`
  * `pdf$**<tab>`
  * `kill -9 <digit><tab>`
  * `ssh **<tab>` # complete with hostnames from /etc/hosts and ~/.ssh/config
* Urxvt
  * Keyboard shortcuts
    * M-Esc ~~ Vim-like navigation, pasting and searching https://github.com/muennich/urxvt-perls/
    * M-s ~~ search backwards in terminal from prompt
    * C-M-c ~~ copy selection to system clipboard
    * C-M-v ~~ paste sys clipboard (also S-Insert)
    * C-(S-)Up ~~ increase (globally) size of font
    * C-(S-)Down ~~ decrease (globally) size of font
    * C-= ~~ reset size
    * C-/ ~~ show font attributes
* commands
    * getclip ~~ paste clipboard content
### Tmux
* \<prefix\> R ~~ source ~/.tmux.conf

### VIM
* i_CTRL+v ~~ insert sytem clipboard (in insert mode)
* \<leader\> ... is ',' (comma)
* asciidoc
** \<F7\>,\<F8\> ~~ jump to next, previous chapter
** M-j ,k  : move a line down, upwards
** m  ~~ clean file from ^M from Windows encoding _\r\n_
* \<C-r\> * ~~ insert while in INSERTMODE
* fzf
  * :FZF ~~ look for and open files from CWD
  * --inline-info ~~ ?
    * <C-t> ~~ open in new *t*ab
    * <C-x> ~~ hori*x*ontal split
    * <C-v> ~~ *v*ertical split

### TMUX-VIM integration
* \<C-h\> ~~ switch to pane (tmux)/ window (vim) to the left
* \<C-j\> ~~ switch to pane (tmux)/ window (vim) down
* \<C-k\> ~~ switch to pane (tmux)/ window (vim) up
* \<C-l\> ~~ switch to pane (tmux)/ window (vim) to the right

### Vimperator
* <leader> ... # is ,
** t ~~ open URL in background
** T ~~ open URL in background based on current URL
** R ~~ reload ~/.vimperatorrc
** p ~~ print w/o confirmation (to default printer)
** a ~~ attach tab to another window
* ; ...
** c ~~ context menu
** w ~~ follow hint in a new window
* gu ~~ open URL one dir/slash *u*p: http://domain.de/here/i/am -> http://domain.de/here/i/
* gU ~~ open URL *U*p to stem: http://domain.de

## Updating
* git pull && git submodule update --remote --merge
** gca for updated submodules necessary?
* vim-submodules via vim-plug
* tmux-submodules via tpm (<prefix> U)
## todo
* BROKEN
  * start first tmux session: sourcing tmux.reset.conf
* freeze-in -> .gitignore
* color of cursor in terminal (smw between Xresources and ...x?)
* bright and dark settings
  * depending on sys-time?
  * red-light
* git
  * config rather than alias?
* Link-safer for terminal (bookmark) (s.a. [[ Tools#Collaboration ]]
* vimperator plugins - colors
* git abbreviation - package (prezto?)
* prezto
  * in what why does the order matter?
    * history-substring-search: "If this module is used in conjuncture with the *syntax-highlighting* module, it must be loaded **after** it."
* vim
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
* dependencies: (s.a. arrange.sh)
  * zsh
  * git-flow
  * vim-gnome
  * sar/atsar and/or iostat for tmux-cpu
  * wmctrl
  * xsel (xclip too?)
