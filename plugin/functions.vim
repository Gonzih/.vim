function MyTrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

function MyTrimTrailingWhitespaces()
  let save_cursor = getpos(".")
  :silent! %s#\s\+$##g
  call setpos('.', save_cursor)
endfunction

"Trim empty lines at the EOF
au BufWritePre * call MyTrimEndLines()
au BufWritePre * call MyTrimTrailingWhitespaces()
