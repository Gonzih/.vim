if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax keyword racketConcealLambda lambda conceal cchar=λ

hi link racketConcealLambda Define
hi! link Conceal Define

setlocal conceallevel=2
