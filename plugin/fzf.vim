nnoremap <space>pf :GFiles<cr>
nnoremap <space>bb :History<cr>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

nnoremap <space>/ :GGrep<cr>
