# dotfiles
*Home Sweet Home?*
*Home Dot Home!*

*From Middle English hous, hus, from Old English hūs (“dwelling, shelter, house”)* https://en.wiktionary.org/wiki/house

## Installation
. start zsh-shell
. run arrange.sh # WIP
. start shell anew || $SHELL

* tmux-plugins are installed once tmux gets started the first time

## The key navigation
* An overview of regular and customized functions and key bindings which will grow and change from time to time.

### git
* git ...
  * al ~~ list git aliases available in current dir
  * r ~~ list remotes with all information
  * l ~~ log --graph
  * st ~~ status + ignored files
  * subst ~~ status of all submodules
  * intsub ~~ gca 'integrate latest submodule commit(s)'
* glols ~~ git log (pretty stuff) -n (s)top at terminal-height - 10
* glogs ~~ git log (some other pretty stuff) -n (s)top at terminal-height - 10

### Shell
* caps lock is mapped to escape via Xmodmap
* confed        # load relevant config files into Vim
* confrel (-a)  # reload (all) config
* mkcd          # mkdir and cd into dir, with indefinite depth (-p)
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
    * C-M-plus ~~ increase size of font
    * C-M-minus ~~ decrease size of font
    * C-S-plus ~~ increase (globally) size of font
    * C-S-minus ~~ decrease (globally) size of font
    * C-= ~~ reset size
    * C-/ ~~ show font attributes
* commands
  * getclip ~~ paste clipboard content
### Tmux
* \<prefix\>... # is \<C-a\>
  * R ~~ source ~/.tmux.conf
  * S ~~ display and choose session

### VIM
* i_CTRL+v ~~ insert sytem clipboard (in insert mode)
* \<leader\> ... is ',' (comma)
  * w ~~ quick write
  * x ~~ open scribble page (adoc)
  * m  ~~ clean file from ^M from Windows encoding _\r\n_
* \<F7\>,\<F8\> ~~ jump to next, previous chapter
* M-j ,k  : move a line down, upwards # not working anymore?
* \<C-r\> * ~~ insert while in INSERTMODE (or + (_Plus_))
* fzf
  * :FZF ~~ look for and open files from CWD
  * --inline-info ~~ ?
    * \<C-t\> ~~ open in new *t*ab
    * \<C-x\> ~~ hori*x*ontal split
    * \<C-v\> ~~ *v*ertical split

### TMUX-VIM integration
* \<C-h\> ~~ switch to pane (tmux)/ window (vim) to the left
* \<C-j\> ~~ switch to pane (tmux)/ window (vim) down
* \<C-k\> ~~ switch to pane (tmux)/ window (vim) up
* \<C-l\> ~~ switch to pane (tmux)/ window (vim) to the right

### Vimperator
* \<leader\> ... # is ,
  * t ~~ open URL in background
  * T ~~ open URL in background based on current URL
  * R ~~ reload ~/.vimperatorrc
  * h ~~ make (h)ardcopy w/o confirmation (print wiht default printer)
  * p ~~ (p)aste clipboard enclosed in quote signs in current tab (i.e. search with default engine and ignore comma)
  * P ~~ (P)aste clipboard enclosed in quote signs in new tab
  * a ~~ attach tab to another window
* ; ...
  * c ~~ context menu
  * w ~~ follow hint in a new window
* gu ~~ open URL one dir/slash *u*p: http://domain.de/here/i/am -> http://domain.de/here/i/
* gU ~~ open URL *U*p to stem: http://domain.de

## Updating
* git pull && git submodule update --init --recursive
* vim-submodules via vim-plug
* tmux-submodules via tpm (<prefix> U)

## todo
* BROKEN
  * start first tmux session: sourcing tmux.reset.conf
* ~/.multitailrc not being read?
* color
  * of cursor in terminal: zpreztorc, highlight cursor
  * tmux - Xresources - zpreztorc
  * bright and dark settings
    * depending on sys-time?
    * red-light
* vi-keybindings for prompt in zpreztorc
* git
  * config rather than alias?
* Link-safer for terminal (bookmark) (s.a. [[ Tools#Collaboration ]]
* vimperator plugins - colors
* git abbreviation - package (prezto?)
* prezto
  * in what why does the order matter?
    * history-substring-search: "If this module is used in conjuncture with the *syntax-highlighting* module, it must be loaded **after** it."
* arrange
  * default only terminal packages
  * start tpm and vim-plug fetch
  * "pmodload: no such module: rumpel" ?
* vim
  * PlugInstall! if not exist
  * collision with fzf
  * if INSERTMODE cursor w/ underline
  * gvim ~~ set C-M-v to insert...
  * y$ ~~ copy till real end of line
  * i\_\<End\> ~~ end of *screen*-line \<-\> <End> ~~ end of *real* line.
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
