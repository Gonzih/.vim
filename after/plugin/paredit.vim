function! AdjustParedit()
  if g:paredit_mode
    nnoremap <buffer> <silent> j            :<C-U>call PareditSetDelete(v:count)<CR>g@
    vnoremap <buffer> <silent> j            :<C-U>call PareditDelete(visualmode(),1)<CR>
    nnoremap <buffer> <silent> jj           :<C-U>call PareditDeleteLines()<CR>

    silent! unmap <buffer> d
    silent! unmap <buffer> dd
    silent! unmap <buffer> D
  endif
endfunction

au BufReadPost *.lisp call AdjustParedit()
au BufReadPost *.cl   call AdjustParedit()
au BufReadPost *.clj  call AdjustParedit()
au BufReadPost *.cljs call AdjustParedit()
au BufReadPost *.scm  call AdjustParedit()
au BufReadPost *.rkt  call AdjustParedit()

" vim: ts=2:sts=2:sw=2:expandtab
