"Fugitive aliases
autocmd User fugitive command! -bar -buffer -nargs=* Gci :Gcommit <args>

"Auto cleaning fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
