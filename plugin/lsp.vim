" call lsp#add_server_config('rust', { 'execute_path': '/run/current-system/sw/bin/rls', 'args': [] }, {})
" call lsp#add_server_config('go', { 'execute_path': expand('$GOPATH/bin/go-langserver'),
"       \ 'args': ['-format-tool', 'gofmt', '-lint-tool', 'golint', '-gocodecompletion']})

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['/run/current-system/sw/bin/rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
