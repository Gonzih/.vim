function AdjustFireplace()
  nnoremap <buffer> <C-w>d <C-w>h
  nnoremap <buffer> <C-w>j <C-w>d

  " Fireplace stuff
  nmap <buffer> <Leader>mek <Plug>FireplaceK
  nmap <buffer> <Leader>mef :Eval<CR>
  nmap <buffer> <Leader>meb :%Eval<CR>

  " Tmux stuff
  " nmap <buffer> <Leader>meb maggVG:SendSelectionToTmux<CR>`a
  " vmap <buffer> <Leader>mee :SendSelectionToTmux<CR>
  " nmap <buffer> <Leader>mee ma^v%,e`a
  "
endfunction

au BufEnter *.cljc,*.cljs,*.clj,*.boot call AdjustFireplace()

" vim: ts=2:sts=2:sw=2:expandtab
