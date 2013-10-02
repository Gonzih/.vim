set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype on

" Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/L9'

Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'airblade/vim-gitgutter'
Bundle 'goldfeld/vim-seek'
Bundle 'Lokaltog/vim-easymotion'

Bundle 'bling/vim-bufferline'

"Unite
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'

"Remote commands runners
Bundle 'tpope/vim-dispatch'

"Vim dev plugins
"Bundle 'guns/xterm-color-table.vim'

" FileTypes
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'vim-scripts/Arduino-syntax-file'
Bundle 'rainux/vim-vala'
Bundle 'wlangstroth/vim-racket'
Bundle 'derekwyatt/vim-scala'
Bundle 'wlangstroth/vim-haskell'
Bundle 'aliva/vim-fish'

" ProjectTypes
"Bundle 'vim-scripts/rubycomplete.vim'
Bundle 'tpope/vim-rails'

" Duplicates some of paredit functionality
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'

" Clojure
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'dgrnbrg/vim-redl'
Bundle 'vim-scripts/paredit.vim'

Bundle 'vim-scripts/slimv.vim'

" Themes
Bundle 'mrtazz/molokai.vim'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'wgibbs/vim-irblack'
Bundle 'ciaranm/inkpot'
Bundle 'vim-scripts/Railscasts-Theme-GUIand256color'
Bundle 'sjl/badwolf'

Bundle 'sjl/gundo.vim'

" Unite
let g:unite_source_history_yank_enable = 1
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'sorters', 'sorter_rank')

call unite#custom#source('file,file_rec,file_rec/async', 'ignore_pattern',
      \'tmp\|vendor\|\.bundle\|target\|\.git')

nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>

nnoremap <space>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <space>h :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <space>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <space>/ :Unite -no-split -buffer-name=files   -start-insert grep:.<cr>
nnoremap <space>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <space>b :Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-h>   <Plug>(unite_select_next_line)
  imap <buffer> <C-t>   <Plug>(unite_select_previous_line)

  nmap <buffer> h         <Plug>(unite_loop_cursor_down)
  nmap <buffer> t         <Plug>(unite_loop_cursor_up)

  nnoremap <silent><buffer><expr> k
        \ unite#smart_map('k', unite#do_action('tabopen'))
endfunction

" Functions
function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

function TrimTrailingWhitespaces()
  let save_cursor = getpos(".")
  :silent! %s#\s\+$##g
  call setpos('.', save_cursor)
endfunction

" Enable filetype
set autoindent
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete
set hlsearch
set nowrap
set number
set expandtab "allows use retab!

" Mouse
if has('mouse')
  set mouse=a
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" history
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

set autowrite
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

set t_Co=256
colorscheme badwolf

let g:rsenseUseOmniFunc = 1

"List special symbols
set listchars=tab:▸\ ,eol:¬,trail:•,extends:❯,precedes:❮
set list

nmap <silent> <C-l> :silent noh<CR>

set guioptions=ai

"Dvorak it!
no d h
no h j
no k t
no K T
no t k
no n l
no j d
no l n
no L N

" ; == :
nnoremap ; :
vnoremap ; :

nnoremap q; q:
vnoremap q; q:

"Added benefits
no - $
no _ ^

"Tabs
no N <C-w>l
no T <C-w>k
no D <C-w>h
no H <C-w>j

"Tab navigation
map <C-n> :tabnext<CR>
map <C-d> :tabprev<CR>

"Buffers navigation
map <C-h> :bn<CR>
map <C-t> :bp<CR>


" ' and z repeat forward and back for f, F, k, K
noremap z ;
noremap ' ,

nmap <leader>, <plug>NERDCommenterToggle
vmap <leader>, <plug>NERDCommenterToggle
nmap <Tab> :NERDTreeToggle<CR>
nmap <Leader>a :TagbarToggle<CR>

" copy text to "+ (clipboard)
nmap <Leader>yy "+yy
vmap <Leader>y "+y

" paste text from "+ (clipboard)
map <Leader>p "+p
map <Leader>P "+P
vmap <Leader>p "+p

noremap , @:

imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

"Remaping for Dvorak
let NERDTreeMapOpenInTab='c'

"Auto cleaning fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"Git branch in statusline
set statusline=%<%f\ %y\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"Fugitive aliases
autocmd User fugitive command! -bar -buffer -nargs=* Gci :Gcommit <args>

"W command that write files as root
command W w !sudo tee % > /dev/null

" command for capturing external command output
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"File types
au BufRead,BufNewFile *.ejs        setlocal filetype=html.javascript
au BufRead,BufNewFile *.coffee     setlocal filetype=coffee
au BufRead,BufNewFile *.feature    setlocal filetype=cucumber
au BufRead,BufNewFile Guardfile    setlocal filetype=ruby
au BufNewFile,BufRead *.j,Jakefile setlocal filetype=objj
au BufRead,BufNewFile *.pde        setlocal filetype=arduino
au BufRead,BufNewFile *.ino        setlocal filetype=arduino
au BufRead,BufNewFile *.vala       setlocal filetype=vala
au BufRead,BufNewFile *.clj        setlocal filetype=clojure
au BufRead,BufNewFile *.cljs       setlocal filetype=clojure
au BufRead,BufNewFile *.cljx       setlocal filetype=clojure
au BufRead,BufNewFile *.scala      setlocal filetype=scala
au BufRead,BufNewFile *.rkt        setlocal filetype=racket
au BufRead,BufNewFile *.fish       setlocal filetype=fish


"Trim empty lines at the EOF
au BufWritePre * call TrimEndLines()
au BufWritePre * call TrimTrailingWhitespaces()

"ruby
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype coffee     setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype sass       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype eruby      setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype arduino    setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype cucumber   setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype lisp       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype racket     setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype clojure    setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype fish       setlocal ts=4 sts=4 sw=4 noexpandtab

" ruby autocomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1"
autocmd FileType ruby,eruby imap <C-Space> <C-x><C-]>

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Set folding
"set foldmethod=syntax

" Enable indent guides
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ [ '197', 'SeaGreen3'   ],
    \ [ '10',  'DarkOrchid3' ],
    \ [ '136', 'firebrick3'  ],
    \ [ '43',  'RoyalBlue3'  ],
    \ [ '129', 'SeaGreen3'   ],
    \ [ '86',  'RoyalBlue3'  ],
    \ [ '33',  'DarkOrchid3' ],
    \ [ '202', 'firebrick3'  ],
    \ [ '47',  'RoyalBlue3'  ],
    \ [ '9',   'DarkOrchid3' ],
    \ [ '13',  'RoyalBlue3'  ],
    \ [ '14',  'SeaGreen3'   ],
    \ [ '12',  'firebrick3'  ],
    \ [ '118', 'DarkOrchid3' ],
    \ [ '40',  'SeaGreen3'   ],
    \ [ '196', 'firebrick3'  ],
    \ ]

au FileType clojure let b:delimitMate_quotes = "\""
au FileType racket  let b:delimitMate_quotes = "\""
au FileType lisp    let b:delimitMate_quotes = "\""

" Clojure
let g:clojure_maxlines = 100
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*"

" Powerline symbols are fancy now
let g:Powerline_symbols = 'fancy'

" Buffer resizing
if bufwinnr(1)
  map <Up> <C-W>-
  map <Down> <C-W>+
  map <Left> <c-w><
  map <Right> <c-w>>
endif

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Ctags
" If tags file does not exist initializes it with symlink to tmp with UUID in
" filename
function! InitTagsFileWithSymlink(f)
  let filepath = a:f
  let issymlink = system("find '" . filepath . "' -type l | wc -l")
  if issymlink == 0
    let uuid = system('uuidgen')
    let cmd  = 'ln -s "/tmp/ctags-for-vim-' . uuid . '" "' . filepath . '"'
    let cmd  = substitute(cmd, '\n', '', 'g')
    let resp = system(cmd)
  endif
endfunction

" Populates tags file if lines count is equal to 0
" with `ctags -R .`
function! PopulateTagsFile(f)
  let filepath = a:f
  let resp     = system('touch "' . filepath . '"')
  let lines    = system('wc -l "' . filepath . '"')
  let linescnt = substitute(lines, '\D', '', 'g')
  if linescnt == 0
    let cwd  = getcwd()
    let cmd  = 'ctags -Rf "'. filepath . '" "' . cwd . '"'
    let resp = system(cmd)
  endif
endfunction

" Remove tags for saved file from tags file
function! DelTagOfFile(file)
  let fullpath    = a:file
  let cwd         = getcwd()
  let tagfilename = cwd . "/tags"
  let f           = substitute(fullpath, cwd . "/", "", "")
  let f           = escape(f, './')
  let cmd         = 'sed --follow-symlinks -i "/' . f . '/d" "' . tagfilename . '"'
  let resp        = system(cmd)
endfunction

" Init tags file
" Populate it
" Remove data related to saved file
" Append it with data for saved file
function! UpdateTags()
  let f           = expand("%:p")
  let cwd         = getcwd()
  let tagfilename = cwd . "/tags"
  call InitTagsFileWithSymlink(tagfilename)
  call PopulateTagsFile(tagfilename)
  call DelTagOfFile(f)
  let cmd  = 'ctags -a -f ' . tagfilename . ' "' . f . '"'
  let resp = system(cmd)
endfunction

command UpdateTags call UpdateTags()
autocmd BufWritePost *.rb,*.js,*.coffee,*.clj call UpdateTags()

set viminfo+=!

highlight clear SignColumn

" Tmux workaround with C-Arrows and S-Arrows
" Tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

let g:paredit_leader='\|'

set shell=/bin/bash

" Syntastic options
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby'],
                           \ 'passive_filetypes': [] }

" Enable spellcheck for markdown files
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Airline
let g:airline_powerline_fonts = 1

" Gundo
nnoremap U :GundoToggle<CR>
let g:gundo_map_move_older = 'h'
let g:gundo_map_move_newer = 't'

" Bufferline
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  1
let g:bufferline_echo = 0

" Slimv
let g:paredit_electric_return = 0
let g:slimv_swank_clojure = '! xterm -e lein ritz 4005 localhost &'

" vim: ts=2:sts=2:sw=2:expandtab
