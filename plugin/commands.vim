"W command that write files as root
command! W w !sudo tee % > /dev/null

" command for capturing external command output
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

command! -nargs=* Tab Tabularize<args>
command! -nargs=* -range=% Tab <line1>,<line2>Tabularize<args>

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

command! Fish set nonu | terminal fish
command! -nargs=* -complete=shellcmd Fish !fish -c '<args>'

" command! -nargs=* -range=% CamelToSnake s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g

command! DeinInstall call dein#install() | UpdateRemotePlugins
command! DeinUpdate call dein#update() | UpdateRemotePlugins
