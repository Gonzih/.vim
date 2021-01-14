let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'clojure': ['bash', '-c', 'clojure-lsp'],
\ }

nmap <Leader>lm <Plug>(lcn-menu)
nmap <silent> <Leader>lh <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <Leader>lr <Plug>(lcn-rename)
