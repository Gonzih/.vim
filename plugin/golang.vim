let g:go_fmt_experimental = 1
let g:go_code_completion_enabled = 0

au FileType go nmap <leader>mr <Plug>(go-run)
au FileType go nmap <leader>mb <Plug>(go-build)
au FileType go nmap <leader>mt <Plug>(go-test)
au FileType go nmap <leader>mc <Plug>(go-coverage)
