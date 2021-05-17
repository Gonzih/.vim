" lua << EOF
" require'lspconfig'.rust_analyzer.setup{}
" require'lspconfig'.clojure_lsp.setup{}
" require'lspconfig'.clojure_lsp.setup{}
" require'lspconfig'.dartls.setup{
"   cmd = { "dart", "$DART_SDK./snapshots/analysis_server.dart.snapshot", "--lsp" }
" }
" require'lspconfig'.gopls.setup{}
" require'lspconfig'.metals.setup{}
" lua require'lspconfig'.pyls.setup{}
" eof
