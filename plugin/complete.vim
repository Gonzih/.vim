autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if has("nvim")
  let g:deoplete#enable_at_startup = 1
  " let g:deoplete#complete_method = "omnifunc"
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
  let deoplete#sources#dart#dart_sdk_path = "/opt/dart-sdk/"

	inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-d> deoplete#undo_completion()
endif

if !has("nvim")
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1

  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-d> neocomplete#undo_completion()
  inoremap <expr><C-n> neocomplete#complete_common_string()
endif

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" vim: ts=2:sts=2:sw=2:expandtab
