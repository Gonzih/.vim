let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-d>  neocomplete#undo_completion()
inoremap <expr><C-n>  neocomplete#complete_common_string()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" vim: ts=2:sts=2:sw=2:expandtab
