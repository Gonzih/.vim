let g:tslime_ensure_trailing_newlines = 1

" Tmux stuff
nmap <buffer> ,b maggVG:SendSelectionToTmux<CR>`a
vmap <buffer> ,e :SendSelectionToTmux<CR>
nmap <buffer> ,e ma^v%,e`a

if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax keyword lispConcealLambda lambda conceal cchar=λ
" syntax match lispConcealLambda /\v#\(/me=e-1 conceal cchar=ƒ

hi link lispConcealLambda Define
hi! link Conceal Define

setlocal conceallevel=2
