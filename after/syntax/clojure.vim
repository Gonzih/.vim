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
