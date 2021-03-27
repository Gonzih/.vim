let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'clojure': ['bash', '-c', 'clojure-lsp'],
\ 'typescript': ['typescript-language-server', '--stdio'],
\ 'typescript.tsx': ['typescript-language-server', '--stdio'],
\ 'dart': ['dart', $DART_SDK.'/bin/snapshots/analysis_server.dart.snapshot', '--lsp'],
\ 'nix': ['rnix-lsp'],
\ 'go': ['gopls'],
\ 'scala': ['metals-vim'],
\ 'haskell': ['haskell-language-server'],
\ }

nmap <Leader>lm <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <Leader>lr <Plug>(lcn-rename)

let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')

command! -nargs=1 LanguageClientExecute call LanguageClient#workspace_executeCommand('<args>')
command! -nargs=0 LanguageClientFormat call LanguageClient#textDocument_formatting_sync()

autocmd BufWritePre *.scala :call LanguageClient#textDocument_formatting_sync()
