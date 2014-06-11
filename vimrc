set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype on

" Plugins
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/L9'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'goldfeld/vim-seek'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"Unite
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'sgur/unite-git_grep'

"Vim dev plugins
"Plugin 'guns/xterm-color-table.vim'

" FileTypes
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'rainux/vim-vala'
Plugin 'wlangstroth/vim-racket'
Plugin 'derekwyatt/vim-scala'
Plugin 'wlangstroth/vim-haskell'
Plugin 'aliva/vim-fish'
Plugin 'Blackrush/vim-gocode'
Plugin 'elixir-lang/vim-elixir'
Plugin 'gabrielelana/vim-markdown'
Plugin 'stephpy/vim-yaml'
Plugin 'jsx/jsx.vim'

" ProjectTypes
"Plugin 'vim-scripts/rubycomplete.vim'
Plugin 'tpope/vim-rails'

" Duplicates some of paredit functionality
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" Clojure
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-dispatch'
"Plugin 'dgrnbrg/vim-redl'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/timl'

"Plugin 'vim-scripts/slimv.vim'

" Themes
Plugin 'mrtazz/molokai.vim'
Plugin 'trapd00r/neverland-vim-theme'
Plugin 'wgibbs/vim-irblack'
Plugin 'ciaranm/inkpot'
Plugin 'vim-scripts/Railscasts-Theme-GUIand256color'
Plugin 'sjl/badwolf'

Plugin 'sjl/gundo.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'sjl/tslime2.vim'

" Unite
let g:unite_source_history_yank_enable = 1

call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'sorters', 'sorter_rank')
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'converters', 'converter_relative_word')

call unite#custom#source('file,file_rec,file_rec/async', 'ignore_pattern',
      \'tmp\|vendor\|\.bundle\|target\|\.git\|\.rsync_cache')

nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec:!<cr>

nnoremap <space>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <space>h :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <space>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <space>/ :Unite -no-split -buffer-name=files   -start-insert vcs_grep<cr>
nnoremap <space>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <space>b :Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>

let g:unite_quick_match_table =
      \ get(g:, 'unite_quick_match_table', {
      \     'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6, 't' : 7, 'n' : 8, 's' : 9,
      \     ';' : 10, ',' : 11, '.' : 12, 'p' : 13, 'y' : 14, 'f' : 15, 'g' : 16, 'c' : 17, 'r' : 18, 'l' : 19,
      \     'q' : 20, 'j' : 21, 'k' : 22, 'x' : 23, 'b' : 24, 'm' : 25, 'w' : 26, 'v' : 27, 'z' : 28, '-' : 29,
      \ })

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

"Buffers
no N <C-w>l
no T <C-w>k
no D <C-w>h
no H <C-w>j
no <C-w>\ <C-w>v
no <C-w>- <C-w>s

"Tab navigation
map <C-n> :tabnext<CR>
map <C-d> :tabprev<CR>

"Buffers navigation
map <C-h> :bn<CR>
map <C-t> :bp<CR>


" <> repeat forward and back for f, F, k, K
"noremap gZ ;
"noremap gz ,

nmap <leader>, <plug>NERDCommenterToggle
vmap <leader>, <plug>NERDCommenterToggle
nmap <Tab> <Plug>VinegarUp
nmap <Leader>a :TagbarToggle<CR>

" copy text to "+ (clipboard)
nmap <Leader>yy "+yy
vmap <Leader>y "+y

" paste text from "+ (clipboard)
map <Leader>p "+p
map <Leader>P "+P
vmap <Leader>p "+p

noremap , @:

" EasyMotion
let g:EasyMotion_leader_key = ','

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

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
au BufRead,BufNewFile Guardfile,Procfile,Rakefile,Gemfile setlocal filetype=ruby

au BufRead,BufNewFile *.ejs        setlocal filetype=html.javascript
au BufRead,BufNewFile *.coffee     setlocal filetype=coffee
au BufRead,BufNewFile *.feature    setlocal filetype=cucumber
au BufRead,BufNewFile *.j,Jakefile setlocal filetype=objj
au BufRead,BufNewFile *.pde        setlocal filetype=arduino
au BufRead,BufNewFile *.ino        setlocal filetype=arduino
au BufRead,BufNewFile *.vala       setlocal filetype=vala
au BufRead,BufNewFile *.clj        setlocal filetype=clojure
au BufRead,BufNewFile *.cljs       setlocal filetype=clojure
au BufRead,BufNewFile *.cljx       setlocal filetype=clojure
au BufRead,BufNewFile *.scala      setlocal filetype=scala
au BufRead,BufNewFile *.scala.sc   setlocal filetype=scala
au BufRead,BufNewFile *.rkt        setlocal filetype=racket
au BufRead,BufNewFile *.fish       setlocal filetype=fish
au BufRead,BufNewFile *.asd        setlocal filetype=lisp
au BufRead,BufNewFile *.go         setlocal filetype=go
au BufRead,BufNewFile *.ex,*.exs   setlocal filetype=elixir


"Trim empty lines at the EOF
au BufWritePre * call TrimEndLines()
au BufWritePre * call TrimTrailingWhitespaces()


au FileType arc call PareditInitBuffer()
"au FileType ruby call PareditInitBuffer()

au Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
au Filetype elixir     setlocal ts=2 sts=2 sw=2 expandtab
au Filetype coffee     setlocal ts=2 sts=2 sw=2 expandtab
au Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab
au Filetype sass       setlocal ts=2 sts=2 sw=2 expandtab
au Filetype html       setlocal ts=4 sts=4 sw=4 expandtab
au Filetype eruby      setlocal ts=2 sts=2 sw=2 expandtab
au Filetype yaml       setlocal ts=2 sts=2 sw=2 expandtab
au Filetype arduino    setlocal ts=2 sts=2 sw=2 expandtab
au Filetype cucumber   setlocal ts=2 sts=2 sw=2 expandtab
au Filetype lisp       setlocal ts=2 sts=2 sw=2 expandtab
au Filetype racket     setlocal ts=2 sts=2 sw=2 expandtab
au Filetype clojure    setlocal ts=2 sts=2 sw=2 expandtab
au Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
au Filetype fish       setlocal ts=4 sts=4 sw=4 noexpandtab
au Filetype scala      setlocal ts=2 sts=2 sw=2 expandtab

" ruby autocomplete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1"

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Set folding
set foldmethod=marker

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
    let cmd  = 'ctags --exclude=.rsync_cache -Rf "'. filepath . '" "' . cwd . '"'
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
autocmd BufWritePost *.rb,*.js,*.coffee,*.clj,*.scala call UpdateTags()

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
autocmd FileType mail setlocal spell

" Airline
let g:airline_powerline_fonts = 1

" Gundo
nnoremap U :GundoToggle<CR>
let g:gundo_map_move_older = 'h'
let g:gundo_map_move_newer = 't'

let g:paredit_electric_return = 0

au VimEnter * syntax keyword lambdaConceal lambda conceal cchar=λ
au VimEnter * hi  link lambdaConceal Define
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2

let g:NERDCustomDelimiters = {
  \ 'racket': { 'left': ';', 'leftAlt': '#| ', 'rightAlt': ' |#' },
  \ 'haskell': { 'left': '--' },
\ }

" Multiple Cursors
let g:multi_cursor_next_key='<C-b>'
let g:multi_cursor_prev_key='<C-x>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

" This thing requires MozRepl in firefox installed (look up in addons)
" to start REPL go to Tools -> MozRepl -> Start
function! RefreshFirefox()
  let command="echo  'var vimYo = content.window.pageYOffset;
        \ var vimXo = content.window.pageXOffset;
        \ BrowserReload();
        \ content.window.scrollTo(vimXo,vimYo);
        \ repl.quit();'  |
        \ nc -w 1 localhost 4242 2>&1 > /dev/null"

  let result=system(command)
endfunction

command RefreshFirefox call RefreshFirefox()
autocmd BufWritePost *.html,*.css,*.scss,*.sass,*.haml,*.erb,*.js,*.rb call RefreshFirefox()
"autocmd FocusLost *.html,*.css,*.scss,*.sass,*.haml,*.erb,*.js,*.rb call RefreshFirefox()

" Autosave on lost focus
autocmd FocusLost * :wa

" Fix some annoying bug in SuperTab
let g:SuperTabCrMapping = 0

" Notes
let g:notes_directories = ['~/Dropbox/Vim Notes']

" Drop cache for unite.vim
function! UniteClearCache()
  let result = system("rm ~/.cache/unite -rf")
endfunction
command UniteClearCache call UniteClearCache()

let g:netrw_home = "/home/gnzh/.vim/tmp/netrw"

command! -nargs=* -complete=shellcmd Fish !fish -c '<args>'

" vim: ts=2:sts=2:sw=2:expandtab
