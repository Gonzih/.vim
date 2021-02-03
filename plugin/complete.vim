autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if has("nvim")
  let g:deoplete#enable_at_startup = 1
  " let g:deoplete#complete_method = "omnifunc"

  call deoplete#custom#option('smart_case', 1)
  call deoplete#custom#option('sources', {
        \ 'rust': ['LanguageClient'],
        \ 'clojure': ['LanguageClient'],
        \ 'typescript': ['LanguageClient'],
        \ 'typescript.tsx': ['LanguageClient'],
        \ 'dart': ['LanguageClient'],
        \ 'nix': ['LanguageClient'],
        \ 'go': ['LanguageClient'],
        \ })

	inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-d> deoplete#undo_completion()
endif

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" vim: ts=2:sts=2:sw=2:expandtab
