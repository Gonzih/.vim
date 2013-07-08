au FileType clojure imap <buffer> <silent> <C-t> <Plug>clj_repl_uphist.
au FileType clojure imap <buffer> <silent> <C-h> <Plug>clj_repl_downhist.
au FileType clojure imap <buffer> <silent> <NL> <Plug>clj_repl_eval.
au FileType clojure nmap <buffer> d h
au FileType clojure no <buffer> j d
au FileType clojure no <buffer> D <C-w>h
