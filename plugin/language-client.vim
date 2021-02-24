let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'clojure': ['bash', '-c', 'clojure-lsp'],
\ 'typescript': ['typescript-language-server', '--stdio'],
\ 'typescript.tsx': ['typescript-language-server', '--stdio'],
\ 'dart': ['dart', $DART_SDK.'/bin/snapshots/analysis_server.dart.snapshot', '--lsp'],
\ 'nix': ['rnix-lsp'],
\ 'go': ['gopls'],
\ 'scala': ['metals'],
\ }

nmap <Leader>lm <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <Leader>lr <Plug>(lcn-rename)

let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
