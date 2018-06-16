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
* gpOG  ~~ git push master to origin (github) and gitspace (local hosting)
* gcn!  ~~ amend! that file, (n)o edit of commit msg
* gcan! ~~ amend! (a)ll files, (n)o edit of commit msg
* gSurl ~~ show urls of (S)ubmodules
* gSsync ~~ sync url of submodules as registered in supermodule
* gpSOG ~~ chaining perl-scripts to (p)ush (S)ubmodules to (O)rigin and (G)itspace
* ghide ~~ hide (changes of) file from index (''assume-unchanged'')
* gunhide ~~ unhide/ re-register file to index (''no-assume-unchanged'')
* gunhide-all ~~ unhide all files
* ghide-all ## read .githide in root of git dir to _assume-unchanged_
* gshidden ~~ show hidden files

### Shell
* caps lock is mapped to escape via Xmodmap
* confed        # load relevant config files into Vim
* confrel (-a)  # reload (all) config
* mkcd          # mkdir and cd into dir, with indefinite depth (-p)
* lam           # show 20 of (la)test files, which where (m)odified
* ltm           # mtime, i.e. time of data in file [Thanks to]()
* ltc           # ctime, inode change of file
* lta           # atime, last access time or use
* lx            # sort by extension
* lad           # ls dirs only (&& do not enter)
* lal           # la | less
* get_crtime    # get _creation_ time of file
* diffdir       # compare to dirs recursively (diff -rq)
* a2pdf_latex   # adoc to pdf-toolchain
* lpqueue       # watch-like monitoring of printing queue
* mulch 'cmd'   # (mul)titail wat(ch): watch-like monitoring: print changes extra
* get_crtime    # show creation time of file
* cmdoften      # show ten most used commands
* treegraph     # show subdirs in tree-format
* tree          # -- " --, plus files and info
* spacewaste    # show file/dir size of 10 biggest entries
* lssize        # size of all entries of file
* ii            # show host related infos
* global aliases
  * <cmd> G xz  # <command> grep xy
  * L           # less
  * X           # xclip - copy to system clipoard
  * A           # search with ag in a list of files, e.g. dpkg -L asciidoc A "-A2 -B2" "Vorwort"
  * V           # edit piped result (files) in vim
* zsh
  * Alt-
    * . # last argument in history
    * / # "?
    * , # "?
    * ((x = 33.3 /9.1)) # echo $x
  * [z plugin](https://github.com/rupa/z/)
    * -c     restrict matches to subdirectories of the current directory
    * -e     echo the best match, don't cd
    * -l     list only (default)
    * -r     match by rank only
    * -t     match by recent access only
    * -x     remove the current directory from the datafile
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
  * s ~~ display and choose session
  * S ~~ send pane to other window
  * ? ~~ list defined hotkeys
  * # ~~ list buffers
  * = ~~ choose which buffer to paste from
  * C-s ~~ (s)ave tmux session ([tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect))
  * C-r ~~ (r)estore tmux session

### VIM
* CTRL-s ~~ quick save, also in INSERTMODE
* CTRL-p/ -n ~~ in perl: search @INC for defined words, (p)revious/ (n)ext
* :W  ~~ save file in sudo mode
* gt  ~~ (g)o to next (t)ab
* gT  ~~ (g)o to (T)ab before
* \<leader\> ... ~~ is ',' (comma). Usage: type ,w (_comma w_) to save file
  * w ~~ quick (w)rite
  * x ~~ open scribble page (in asciidoc), add date
  * bd ~~ (d)elete current (b)uffer
  * ba ~~ (d)elete (a)ll buffers
  * tn ~~ (t)ab (n)ew
  * to ~~ (t)ab, (o)nly this one keep open
  * tc ~~ (t)ab (c)lose (better delete for consistency?)
  * tm ~~ (t)ab, (m)ove!
  * t, ~~ next (t), optionally give number (,t,)
  * tl ~~ switch to (t)ab I used (l)ast
  * te ~~ (e)dit new (t)ab in the path of the current buffer
  * cd ~~ switch (c)urrent (w)orking directory of the current buffer
  * m  ~~ clean file from _^M_ from Windows encoding (_\r\n_)
  * gf ~~ open current file in (f)irefox - useful for getting[](certainly not forgetting as in _disremembering_) a [rendered](dependent on Firefox plugins, such as [asciidoctorjslivepreview](https://github.com/asciidoctor/asciidoctor-firefox-addon) for AsciiDoc and [Markdown Viewer](https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer/)) version of markup file. (TODO: amend in arrange)
  * ss ~~ toggle local (s)pellcheck
  * sn ~~ (s)pell error, (n)ext # :]s
  * sp ~~ (s)pell error, (p)revious # :[s
  * sa ~~ (s)pell, (a)dd to collection # :zg - :zug undo adding word
  * s? ~~ show (s)pelling suggestion # : z=
  * W  ~~ toggle wrapping lines
  * of ~~ (o)ne(f)low: replace many whitespaces to one
  * co ~~ (co)py file into a new tab
  * # ~~ switch to last tab
* AsciiDoc: <leader>...
  * bq  ~~  (b)lock (q)uote
  * bn  ~~  (b)lock (n)ote
  * nf  ~~  (n)ote (f)oot (footnote)
  * qb  ~~ (q)uote(b)lock
  * F ~~ (F)ootnote
* \<F4\>  ~~ correction: WOrd -> Word
* \<F7\>,\<F8\> ~~ jump to next, previous chapter (mediawiki, adoc, markdown)
* M-j ,k  : move a line down, upwards # not working anymore?
* \<C-r\> * ~~ insert while in INSERTMODE (or + (_Plus_))
* \>,< ~~ indent line, re-indent(?) line
* fzf
  * :FZF ~~ look for and open files from CWD
  * --inline-info ~~ ?
    * \<C-t\> ~~ open in new *t*ab
    * \<C-x\> ~~ hori*x*ontal split
    * \<C-v\> ~~ *v*ertical split
* [vim-surround](https://github.com/tpope/vim-surround)
  * cs"'  ~~ in "Hello" -> 'Hello'
  * cst"  ~~ surround with \" - does not work? Instead...
  * yss"  ~~ wrap entire line
  * ysiw<sth> ~~ surround with HTML tags
  * s.a. doc/vim-surround.txt
* [goyo](https://github.com/junegunn/goyo.vim)
  * :Goyo [dimension] ~~ absolute measure or percentage (80x50%)q
  * \<C-w\> +,-,<,>  ~~ Resize window (regular) in-, decrease height/ width
  * \<F9\>  ~~ set to comfortable dimensions (65%x80%)
    * does not work inside tmux
  * \<C-F9\> ~~ _dirty little hack_: change font size to 15 (via urxvt-font-size)
* [docopen](https://github.com/nelstrom/vim-docopen)
  * gd  ~~ or :DocOpen Open Vimhelp in Browser, regardings help tag under cursor
  * ygd ~~ yank :DocOpen URL
  * _Couldn't get a file descriptor referring to the console_ - even is suffix alias is configured in zsh.
* [cutlass](https://github.com/nelstrom/vim-cutlass)
* [NERDTree](https://github.com/scrooloose/nerdtree)
  * <leader>
    * t ## toggle Nerdtree
    * f ## find file in Nerdtree

### TMUX-VIM integration
* \<C-h\> ~~ switch to pane (tmux)/ window (vim) to the left
* \<C-j\> ~~ switch to pane (tmux)/ window (vim) down
* \<C-k\> ~~ switch to pane (tmux)/ window (vim) up
* \<C-l\> ~~ switch to pane (tmux)/ window (vim) to the right

### VIFM
* \<C- --\>\> ~~ clone file
* gD ~~ go to dir of other pane

### Midnight Commander
* Sort order ... # Alt-
  * # ~~ by name
  * $ ~~ by extention
  * z ~~ by time, (Z)eit
  * ! ~~ show sort order menu
### Vimperator
* \<leader\> ... # is ,
  * t ~~ open URL in background
  * T ~~ open URL in background based on current URL
  * R ~~ reload ~/.vimperatorrc
  * h ~~ make (h)ardcopy w/o confirmation (print with default printer)
    * _WIP_:
    * h1 ~~ make (h)ardcopy - one-on-one page
    * h2 ~~ two-on-one page
  * p ~~ (p)aste clipboard enclosed in quote signs in current tab (i.e. search with default engine and ignore comma)
  * P ~~ (P)aste clipboard enclosed in quote signs in new tab
  * f ~~ (f)ind clipboard content in website/ tab
  * s ~~ (s)ave current page in default download directory
  * gta ~~ (g)o! (t)ab (a)ttach tab to another window
  * gtd ~~ (t)ab (d)etach to its own window
* ; ...
  * c ~~ context menu
  * w ~~ follow hint in a new window
* g ... # <g>o!
  * u ~~ open URL one dir/slash (u)p: http://domain.de/here/i/am -> http://domain.de/here/i/
  * U ~~ open URL (U)p to stem: http://domain.de
  * f ~~ view source of website in current tab
  * F ~~ view source of website in GVim
  * s ~~ (s)earch in current tab (`-windows`)
  * S ~~ (S)earch in new tab (`-windows`)
  * ge ~~ (g)o! (e)dit wiki page!
  * gE ~~ (g)o! (E)dit page in a new tab
  * gne ~~ (g)o! (n)ew wiki page, (e)dit! (with _Template:Preload\_gen_)

### cVim for Chromium
* \<leader\> ... # is ,
  * E ~~ edit wiki-page
  * yy ~~ yank current URL
* \<C-o\> ~~ go back in history
* \<C-i\> ~~ go forward in history
* gb<num> ~~ (go) to (b)uffer/ tab
* \<C-#\> ~~ edit text box with gvim (lib/cvim-server requires to be run)

## Updating
* one script: ''
  * git pull && git submodule update --init --recursive --merge (_gfmS_)
  * vim-submodules via vim-plug
  * tmux-submodules via tpm (<prefix> U)

## misc
* dotfiles/treasury ~~ some perls yet to be included

## todo
* BROKEN
  * start first tmux session: sourcing tmux.reset.conf
  * VIM: after reloading vimrc a few functions are broken
  * cannot use .less
  * todo parser
  * copyfast
* setup
  * *one* update function
  * gfmS, vi and tpm
  * confed with switch to differentiate btw terminal-only and including DE-packages
* ~/.multitailrc not being read
* color
  * of cursor in terminal: zpreztorc, highlight cursor
  * color spectrum is shitty, some colors do not differ from bg
  * tmux - Xresources - zpreztorc - vim
  * toggle color in vim
  * bright and dark settings
    * depending on sys-time?
    * red-light
* vi-keybindings for prompt in zpreztorc
* git
  * collection command to see unstaged or uncommited content in all (sub)modules
  * commit_msg: remove remote address
  * config rather than alias?
* Link-safer for terminal (bookmark) (s.a. [[ Tools#Collaboration ]]
* vimperator plugins - colors
* git abbreviation - package (prezto?)
* prezto
  * in what way does the order matter?
    * history-substring-search: "If this module is used in conjuncture with the *syntax-highlighting* module, it must be loaded **after** it."
* arrange
  * default only terminal packages
  * start tpm and vim-plug fetch
  * "pmodload: no such module: rumpel" ?
* vim
  * \<\> ~~ move tab one down/up...?
  * PlugInstall! if not exist
  * if INSERTMODE cursor w/ underline
  * gvim ~~ set C-M-v to insert...
  * y$ ~~ copy till real end of line
  * i\_\<End\> ~~ end of *screen*-line \<-\> <End> ~~ end of *real* line.
* tmux
  * autostart session if none exists
  * ... attach if no other client is attached
  * ... do not attach else and give feedback
  * break pane: even if it is a vim window-split
  * *destroy-unattached on*: exit/ kill session if no other attached?
  * kill sessions that are lonely
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
* bin
** killhim: kill all found processes (not just one)
* README/ doc
** generate hotkey-centric view and function-centric view (e.g. "search") from program-centric view (this)
