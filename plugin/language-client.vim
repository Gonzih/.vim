let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'clojure': ['bash', '-c', 'clojure-lsp'],
\ 'typescript': ['typescript-language-server', '--stdio'],
\ 'typescript.tsx': ['typescript-language-server', '--stdio'],
\ }

nmap <Leader>lm <Plug>(lcn-menu)
nmap <silent> <Leader>lh <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <Leader>lr <Plug>(lcn-rename)
