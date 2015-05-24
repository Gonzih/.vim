autocmd FileType clojure
    \ setlocal lispwords+=fact,provided,go,go-loop,match

let g:tslime_ensure_trailing_newlines = 1

" Fireplace stuff
nmap <buffer> ,k <Plug>FireplaceK
nmap <buffer> ,s <Plug>FireplaceK
nmap <buffer> ,e :Eval<CR>
nmap <buffer> ,b :%Eval<CR>

" Tmux stuff
" nmap <buffer> ,b maggVG:SendSelectionToTmux<CR>`a
" vmap <buffer> ,e :SendSelectionToTmux<CR>
" nmap <buffer> ,e ma^v%,e`a

if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax keyword clojureConcealLambda fn conceal cchar=λ
syntax match clojureConcealLambda /\v#\(/me=e-1 conceal cchar=ƒ

hi link clojureConcealLambda Define
hi! link Conceal Define

setlocal conceallevel=2
