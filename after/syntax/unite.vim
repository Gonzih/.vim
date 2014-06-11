" Play nice with supertab
let b:SuperTabDisabled=1
" Enable navigation with control-j and control-k in insert mode
"imap <buffer> <C-h>   <Plug>(unite_select_next_line)
"imap <buffer> <C-t>   <Plug>(unite_select_previous_line)

nmap <buffer> h         <Plug>(unite_loop_cursor_down)
nmap <buffer> t         <Plug>(unite_loop_cursor_up)
nmap <buffer> r         <Plug>(unite_redraw)

nnoremap <silent><buffer><expr> k
                        \ unite#smart_map('k', unite#do_action('tabopen'))
