
" Sections:
"    -> my settings
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
mapclear
mapclear!
cmapclear
imapclear
comclear

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"""""""""""""""""""
" dennis settings "
"""""""""""""""""""
""" vim-plug [https://github.com/junegunn/vim-plug]
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" throws error after reloading vimrc: _neomake is not a command_
call plug#begin('~/.vim/plugged')
  Plug 'neomake/neomake'

  " hier die github URL
  Plug 'tpope/vim-surround'
  " Invalid URI?
  Plug 'https://github.com/tpope/vim-repeat'
  Plug 'chikamichi/mediawiki.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'asciidoc/vim-asciidoc'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/seoul256.vim'
call plug#end()

  "Plug 'junegunn/limelight.vim'
  "Plug 'junegunn/vim-peekaboo'
  "Plug 'junegunn/vim-slash'
  "Plug 'junegunn/vim-easy-align'
  "Plug 'junegunn/rainbow_parentheses.vim'
  "Plug 'https://github.com/tpope/vim-surround'
  "Plug 'tpope/vim-fugitive'

" wann geladen wird # Maske # Aktivieren # Zu verwendende Sprache
" https://wiki.archlinux.de/title/Rechtschreibprüfung_unter_Vim
" save power, check spell not in real-time!2017-03-20"au BufNewFile,BufRead,BufEnter *.adoc setlocal spell spelllang=de_de
"au BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=de_de
"au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=de_de
"au BufNewFile,BufRead,BufEnter README setlocal spell spelllang=en_us

""""""""
augroup_neomake_config
  au!
  autocmd! BufWritePost * Neomake
augroup END
let g:neomake_open_list=2

syntax enable
set shiftwidth=2
set tabstop=2

"""""""""
" color "
"""""""""
"colorscheme solarized
" https://github.com/junegunn/seoul256.vim
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 256

colo seoul256
" Light color scheme
"colo seoul256-light

" Switch
"set background=dark
"set background=light

""""""""
" Goyo "
""""""""
" distraction-free writing
" turn on! :Goyo
function! s:goyo_enter()
  silent !tmux set status off
  "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "set noshowmode
  "set noshowcmd
  "set scrolloff=999
  "Limelight
  " ...
endfunction

" turn off! :Goyo!
function! s:goyo_leave()
  silent !tmux set status on
"  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
"  set showmode
"  set showcmd
"  set scrolloff=5
"  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""""""
" help me, Ronda! "
"""""""""""""""""""

if exists("ChapterPrev")
else
  function! ChapterPrev()
    ?##\s*\w
  endfunction
  " assuming this func does not exist as well
  function! ChapterNext()
    /##\s*\w
  endfunction
  inoremap <F7> <Esc>:call ChapterPrev()<CR>
  inoremap <F8> <Esc>:call ChapterNext()<CR>
  nnoremap <F7> :call ChapterPrev()<CR>
  nnoremap <F8> :call ChapterNext()<CR>
endif


if has("gui_running")
  " GUI is running or is about to start.
  set lines=60 columns=100
endif

set modeline
set modelines=5
"set modeline modelines=5

"inoremap <buffer> <C-v> <Left><C-O>"+p


"" cursorshape, turn color when entering INSERT-/ NORMALMODE
"" throws funny signs with XFCE4-terminal
"" works vim gnome-terminal
if $XDG_CURRENT_DESKTOP != "XFCE"
  if &term =~ "screen-256color"
    let &t_SI = "\<Esc>]12;red\x7"
    let &t_EI = "\<Esc>]12;white\x7"
  endif
  if &term =~ "builtin_gui"
    let &t_SI = "\<Esc>]12;red\x7"
    let &t_EI = "\<Esc>]12;white\x7"
  endif
endif
" 
" Thanks to blueyed it works in Tmux and XFCE4
" https://github.com/blueyed/dotfiles/issues/4
" Change cursor shape for terminal mode. {{{1
" See also ~/.dotfiles/oh-my-zsh/themes/blueyed.zsh-theme.
" Note: with neovim, this gets controlled via $NVIM_TUI_ENABLE_CURSOR_SHAPE.
if !has('nvim') && exists('&t_SI')
  " 'start insert' and 'exit insert'.
  if $_USE_XTERM_CURSOR_CODES == 1
    " Reference: {{{
    " P s = 0 → blinking block.
    " P s = 1 → blinking block (default).
    " P s = 2 → steady block.
    " P s = 3 → blinking underline.
    " P s = 4 → steady underline.
    " P s = 5 → blinking bar (xterm, urxvt).
    " P s = 6 → steady bar (xterm, urxvt).
    " Source: http://vim.wikia.com/wiki/Configuring_the_cursor
    " }}}
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"

    " let &t_SI = "\<Esc>]12;purple\x7"
    " let &t_EI = "\<Esc>]12;blue\x7"

    " mac / iTerm?!
    " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  elseif $KONSOLE_PROFILE_NAME =~ "^Solarized.*"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=1\x7"
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
  elseif &t_Co > 1 && $TERM != "linux"
    " Fallback: change only the color of the cursor.
    "let &t_SI = "\<Esc>]12;#0087ff\x7"
    let &t_SI = "\<Esc>]12;red\x7"
    let &t_EI = "\<Esc>]12;white\x7"
    " red and white
    "let &t_SI = "\<Esc>]12;#FF0000\x7"
    "let &t_EI = "\<Esc>]12;#FFFFFF\x7"
    " this throws funny signs in xfce4 and tmux
    "let &t_SI = "\<Esc>]12;red\x7"
    "let &t_EI = "\<Esc>]12;white\x7"
  endif
endif
"
" Wrap escape codes for tmux.
" NOTE: wrapping it acts on the term, not just on the pane!
"if len($TMUX)
"  let &t_SI = "\<Esc>Ptmux;\<Esc>".&t_SI."\<Esc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>".&t_EI."\<Esc>\\"
"endif
" }}}
" MiscCursorShape
"    Specifies the shape of the cursor in the terminal. This can be either TERMINAL_CURSOR_SHAPE_BLOCK (the default), TERMINAL_CURSOR_SHAPE_IBEAM or TERMINAL_CURSOR_SHAPE_UNDERLINE. This option is only available when you compile against VTE 0.19.1 or newer.

if isdirectory("/home/dennis/.config/xfce4/terminal")
  if $COLORTERM == 'xfce4-terminal'
    if has("autocmd")
      au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
      au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
      au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
    endif
  endif
endif

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guifg=red ctermfg=red
    set cursorcolumn
  elseif a:mode == 'r'
    hi statusline guifg=blue ctermfg=lightblue
    "hi statusline ctermfg=green
    set cursorcolumn
  else
    hi statusline guifg=magenta ctermfg=magenta
  endif
  set cursorline
endfunction

function! InsertLeaveActions()
  hi statusline guifg=NONE ctermfg=NONE ctermbg=NONE
  set nocursorcolumn
  set nocursorline
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline
hi statusline guibg=grey ctermfg=black ctermbg=white

""""""""""""""""""""
" helper functions "
""""""""""""""""""""

"if &ft =~ 'asciidoc' || &ft =~ 'mediawiki'
"  inoremap <F7> <Esc>:call AprevChapter()<CR>
"  inoremap <F8> <Esc>:call AnextChapter()<CR>
"  nnoremap <F7> :call AprevChapter()<CR>
"  nnoremap <F8> :call AnextChapter()<CR>
"elseif &ft =~ 'markdown'
"  inoremap <F7> <Esc>:call MDprevChapter()<CR>
"  inoremap <F8> <Esc>:call MDnextChapter()<CR>
"  nnoremap <F7> :call MDprevChapter()<CR>
"  nnoremap <F8> :call MDnextChapter()<CR>
"elseif &ft =~ 'vim'
"  inoremap <F7> <Esc>:call VIprevChapter()<CR>
"  inoremap <F8> <Esc>:call VInextChapter()<CR>
"  nnoremap <F7> :call VIprevChapter()<CR>
"  nnoremap <F8> :call VInextChapter()<CR>
"endif

function! MakeFileExecutable()
    !chmod u+x %
    ":call system('chmod u+x ' . shellescape(fname)) [https://stackoverflow.com/questions/17459104/how-to-execute-an-external-command-in-vim-script#17459161]
    "    :r this
endfunction

function! OpenFileInFirefox()
  " TODO: use same tab every time (possible?)
  :!firefox % > /dev/null 2>&1 &
endfunction

nnoremap <leader>gf :call OpenFileInFirefox()<CR><CR>

""""""""""""""""""
" autocorrection "
""""""""""""""""""

"iabbrev teh the
"iab INnovation Innovation
" WIP [http://vim.wikia.com/wiki/Changing_case_with_regular_expressions]
" %s/\<\(\u\)\(\u\)\(\l\+\)/\1\L\2\L\3/cg transalte to iabbrev:
"iab \<\(\u\)\(\u\)\(\l\+\) \1\L\2\L\3

" or better yet: do it in a final phase after writing
" results in resource-saving

"""""""""""""""""""""
" saved corrections "
"""""""""""""""""""""
" turn WOrd into Word
nnoremap <F4> :%s:\<\(\u\)\(\u\)\(\l\+\):\1\L\2\L\3:cg<CR>


"""""""""""""""""""""""
" File: mediawiki.vim "
"""""""""""""""""""""""
" Many MediaWiki wikis prefer line breaks only at the end of paragraphs
" (like in a text processor), which results in long, wrapping lines.
setlocal wrap linebreak
setlocal textwidth=0

" No auto-wrap at all.
setlocal formatoptions-=tc formatoptions+=l
if v:version >= 602 | setlocal formatoptions-=a | endif

" Make navigation more amenable to the long wrapping lines.
"noremap <buffer> k gk
" disadvantage: counting lines and motion diverge with wrapping lines (e.g. d8j)
noremap k gk
noremap j gj
noremap <Up> gk
noremap <Down> gj
noremap <End> g$
noremap <Home> g0
noremap 0 g0
noremap ^ g^
noremap $ g$
noremap D dg$
noremap C cg$
noremap A g$a

inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
inoremap <End> <C-o>g$
inoremap <Home> <C-o>g0

" utf-8 should be set if not already done globally
setlocal fileencoding=utf-8
" explicit setting of fileencoding globally
setglobal fileencoding=utf-8
" is unix fileformat obvious?
setglobal fileformat=unix
setlocal matchpairs+=<:>

" Treat lists, indented text and tables as comment lines and continue with the
" same formatting in the next line (i.e. insert the comment leader) when hitting
" <CR> or using "o".
setlocal comments=n:#,n:*,n:\:,s:{\|,m:\|,ex:\|}
setlocal formatoptions+=roq

" match HTML tags (taken directly from $VIM/ftplugin/html.vim)
if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
  \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
  \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
  \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif


" Other useful mappings
"" mediawiki {{{
"" Insert a matching = automatically while starting a new header.
if &filetype =~ 'mediawiki' " works?
inoremap <buffer> <silent> = <C-R>=(getline('.')==''\|\|getline('.')=~'^=\+$')?"==\<Lt>Left>":"="<CR>

" Enable folding based on ==sections==
setlocal foldexpr=getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
endif

" }}}

setlocal fdm=expr

" map <F8> :setfiletype mediawiki<CR>
if has("autocmd")
  " native vimperator-Plugin <C-i>
  au BufRead,BufNewFile *web6.codeprobe.de*.tmp* set filetype=mediawiki
  au BufRead,BufNewFile *freddy*.tmp* set filetype=mediawiki
  " FF-Plugin-It's all text <C-e>
  au BufRead,BufNewFile *web6.codeprobe.de_wiki_* set filetype=mediawiki
  au BufRead,BufNewFile *freddy_wiki* set filetype=mediawiki
endif
"""""""""""""""""""""""""""""""""""
" watch changes in vimrc and load "
" already set with autoread?
" problem with Neomake
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

"function! ReloadVimrc()
"  command! -bar ReloadVimrc source $MYVIMRC | doautocmd <nomodeline> FileType | normal zv
"endfunction

"if !exists("*ReloadVimrc")
"function! ReloadVimrc()
"  source ~/.vimrc
""   echo "vimrc reloaded!"
"endfunction
"endif

command! -bar ReloadVimrc source $MYVIMRC | doautocmd <nomodeline> FileType | normal zv
nnoremap <leader>R :ReloadVimrc<CR>

"nnoremap <leader><F5> ReloadVimrc<CR>

"""""""""""""""""
" amix settings "
"""""""""""""""""
set list
set number
set relativenumber " (https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>
" write and quit
nmap <leader>W :wq
" quit all
nmap <leader>Q :qa
" quick save
nmap <C-s>  :w!<cr>
" TODO: does not return to INSERTMODE after reload
imap <C-s>  <Esc>:w<cr>a

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=3

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

try
    " colorscheme desert
catch
endtry

"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
map <leader>W :set wrap!<CR>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Smart way to move between windows
" TODO: Always stuck when reloading vimrc
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" do not it COMMIT_EDITMSG !?
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you snarch with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal nospell
setglobal nospell
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>
" rather asciidoc

function! ScribbleIntro()
    " line results in the line number of expression, here: "$": last line of buffer
    " min returns the minimum value. Here: 20 (if there are less lines than that number accordingly)
    " calculate range: within first 20 existing lines
    let ll = min([20, line("$")])
    " position cursor at start of file
    call cursor(1,1)
    " search for pattern == Day: 2017-03-20 with date of today
    let today = strftime('%F')
    let headtoday = "\=\= Day: ".today
    let match = search(headtoday,'', ll)
    if (match)
      "echo "found: ".headtoday
      let cursor_pos = getpos(".")
      let cursor_line = cursor_pos[1]
      echo "cursor: ".cursor_line
      call append(cursor_line+1, '')
      call cursor(cursor_line+1,1)
"      exe cursor_line."put =\n"
    else
      echo "not found: ".headtoday
      let headtoday = headtoday . "\n"
      " put after line 1
      1put =headtoday
      " set cursor one line below
      call cursor(2, 1)
      normal! o
    endif
endfun

      "normal! /headtoday
      "normal! o
map <leader>x :e ~/buffer.adoc<cr>:call ScribbleIntro()<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
"""""""""""""""""""""""""""""""""""""""""""
