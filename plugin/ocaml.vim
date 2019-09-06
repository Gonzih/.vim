" Append this to your .vimrc to add merlin to vim's runtime-path:
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Also run the following line in vim to index the documentation:
:execute "helptags " . g:opamshare . "/merlin/vim/doc"

" Indent
autocmd FileType ocaml source /home/gnzh/.opam/default/share/typerex/ocp-indent/ocp-indent.vim
