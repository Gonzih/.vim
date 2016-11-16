function! AdjustParedit()
  nnoremap <buffer> <silent> j            :<C-U>call PareditSetDelete(v:count)<CR>g@
  vnoremap <buffer> <silent> j            :<C-U>call PareditDelete(visualmode(),1)<CR>
  nnoremap <buffer> <silent> jj           :<C-U>call PareditDeleteLines()<CR>

  silent! unmap <buffer> d
  silent! unmap <buffer> dd
  silent! unmap <buffer> D
endfunction

au BufEnter *.lisp,*.asd,*.lsp,*.cl,*.scm,*.rkt,*.cljs,*.cljc,*.clj,*.boot call AdjustParedit()

" vim: ts=2:sts=2:sw=2:expandtab
