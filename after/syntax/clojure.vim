autocmd FileType clojure
    \ setlocal lispwords+=fact,provided,go,go-loop,match

let g:tslime_ensure_trailing_newlines = 1

if !has('conceal') || &enc != 'utf-8'
  finish
endif

syntax keyword clojureConcealLambda fn conceal cchar=λ
syntax match clojureConcealLambda /\v#\(/me=e-1 conceal cchar=ƒ

hi link clojureConcealLambda Define
hi! link Conceal Define

setlocal conceallevel=2

" Clojure
let g:clojure_maxlines = 100
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['with.*', 'def.*', 'let.']
let g:clojure_foldwords = ['defn', 'defonce', 'def', 'ns', 'ann', 'go', 'go-loop']

" vim: ts=2:sts=2:sw=2:expandtab
