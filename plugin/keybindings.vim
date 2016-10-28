let mapleader = "\<Space>"

"Dvorak it!
no d h
no h j
no H J
no k t
no K T
no t k
no n l
no j d
no l n
no L N
no J D

" ; == :
nnoremap ; :
vnoremap ; :
nnoremap ,, :<Up><Cr>

nnoremap q; q:
vnoremap q; q:

nnoremap ,, :<Up><CR>

"Added benefits
no - $
no _ ^

"Buffers
no <C-w>n <C-w>l
no <C-w>t <C-w>k
no <C-w>h <C-w>j
no <C-w>d <C-w>h

no <C-w>\ <C-w>v
no <C-w>- <C-w>s

" <> repeat forward and back for f, F, k, K
"noremap gZ ;
"noremap gz ,

nmap <Tab> <Plug>VinegarUp

" copy text to "+ (clipboard)
nmap <Leader>yy "+yy
vmap <Leader>y "+y

" paste text from "+ (clipboard)
map <Leader>"p "+p
map <Leader>"P "+P
vmap <Leader>"p "+p

noremap @; @:

" Buffer resizing
if bufwinnr(1)
  nnoremap <Up> <C-W>-
  nnoremap <Down> <C-W>+
  nnoremap <Left> <c-w><
  nnoremap <Right> <c-w>>
endif

" Multiple Cursors
" let g:multi_cursor_next_key='<C-b>'
" let g:multi_cursor_prev_key='<C-x>'
" let g:multi_cursor_skip_key='<C-k>'
" let g:multi_cursor_quit_key='<Esc>'

" Gundo
nnoremap U :GundoToggle<CR>
let g:gundo_map_move_older = 'h'
let g:gundo_map_move_newer = 't'

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Git!
map <Leader>gp :Gpush<CR>
map <Leader>gf :Gpull<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit --verbose<CR>
map <Leader>gd :Gdiff<CR>

nmap js <Plug>Dsurround

" Commenting
map <Leader>cl gcc
vmap <Leader>cl gc

if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif
