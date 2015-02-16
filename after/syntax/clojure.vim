if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax keyword clojureConcealLambda fn conceal cchar=λ
syntax match clojureConcealLambda /\v#\(/me=e-1 conceal cchar=ƒ

hi link clojureConcealLambda Define
hi! link Conceal Define

setlocal conceallevel=2
autocmd FileType clojure
    \ setlocal lispwords+=fact,provided,go,go-loop,match

let g:tslime_ensure_trailing_newlines = 1

" Fireplace stuff
nmap ,k <Plug>FireplaceK
nmap ,s <Plug>FireplaceK
nmap ,e :Eval<CR>
nmap ,b :%Eval<CR>

" Tmux stuff
" nmap ,b maggVG:SendSelectionToTmux<CR>`a
" nmap ,e maV:SendSelectionToTmux<CR>`a
" vmap ,e :SendSelectionToTmux<CR>
