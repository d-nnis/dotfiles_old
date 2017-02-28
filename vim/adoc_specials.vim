
echo "sourcing adoc_specials"


if filereadable("/usr/local/bin/asciidoctor")
  function! AdocConvert()
    :!asciidoctor %
    echo "asciidoc converted"
  endfunction
  nnoremap <leader><F7> :call AdocConvert()<CR>
endif
