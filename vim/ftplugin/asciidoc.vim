
function! ChapterPrev()
  ?==\s*\w
endfunction

function! ChapterNext()
  /==\s*\w
endfunction

inoremap <F7> <Esc>:call ChapterPrev()<CR>
inoremap <F8> <Esc>:call ChapterNext()<CR>
nnoremap <F7> :call ChapterPrev()<CR>
nnoremap <F8> :call ChapterNext()<CR>

if filereadable('/usr/bin/a2x')
  function! AdocConvert()
    :! "a2pdf.sh" %
  endfunction
endif
map <F3> :call AdocConvert()<CR>

""""""""""""
" Snippets "
""""""""""""
" Quoteblock
map <leader>qb i****<CR>****<Home><CR><up>

" Footnote
function! InsertFootnote()
  ifootnote:[]<left>
endfunction
" same as above ?
":command InsFootnote :normal <right>ifootnote:[]
"nnoremap <leader>F :InsFootnote<CR>

map <leader>F i<right>footnote:[]<left>
