
" echo "sourcing adoc_specials"


if filereadable("/usr/local/bin/asciidoctor")
  function! AdocConvert()
    :!asciidoctor %
    echo "asciidoc converted"
  endfunction
endif

function! AnextChapter()
  /==\s*\w
endfunction

function! AprevChapter()
  ?==\s*\w
endfunction

function! MDnextChapter()
  /##\s*\w
endfunction

function! MDprevChapter()
  ?##\s*\w
endfunction

function! VIprevChapter()
  ?\"""
endfunction

function! VInextChapter()
  /"""
endfunction


