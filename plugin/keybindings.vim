let mapleader = " "

"Dvorak it!
noremap d h
noremap h j
noremap H J
noremap k t
noremap K T
noremap t k
noremap n l
noremap j d
noremap l n
noremap L N
noremap J D
noremap jj dd

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

" no <C-w>\ <C-w>v
no <C-w>- <C-w>s

" <> repeat forward and back for f, F, k, K
"noremap gZ ;
"noremap gz ,

nmap <Tab> <Plug>VinegarUp

" copy text to "+ (clipboard)
nmap <leader>yy "+yy
vmap <leader>y "+y

" paste text from "+ (clipboard)
map <leader>"p "+p
map <leader>"P "+P
vmap <leader>"p "+p

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
map <leader>gp :Git push<CR>
map <leader>gf :Git pull<CR>
map <leader>gs :Git<CR>
map <leader>gcc :Git commit --verbose<CR>
map <leader>gcf :Git commit --fixup<CR>
map <leader>gd :Git diff<CR>
map <leader>gb :Git blame<CR>

" Commenting
map <leader>cl gcc
vmap <leader>cl gc

map <leader>cc :CopilotChat<CR>

if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif

map Q <Nop>
