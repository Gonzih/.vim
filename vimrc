" ====================== DEPENDENCIES BEGIN ======================
if &compatible
  set nocompatible
endif

set runtimepath+=/home/gnzh/.vim/bundle/dein.vim/repos/github.com/Shougo/dein.vim

call dein#begin('/home/gnzh/.vim/bundle/dein.vim/')

call dein#add('Shougo/dein.vim')

call dein#add('tpope/vim-commentary')
" extend % in html
call dein#add('vim-scripts/matchit.zip')
" ruby end stuff
call dein#add('tpope/vim-endwise')
" git stuff
call dein#add('tpope/vim-fugitive')
" better netrw
call dein#add('tpope/vim-vinegar')
" Tab/=
call dein#add('godlygeek/tabular')

" Bottom line
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" Syntax checks
call dein#add('scrooloose/syntastic')
" Git status
call dein#add('airblade/vim-gitgutter')
" ,f stuff
call dein#add('Lokaltog/vim-easymotion')

"Unite
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')

" FileTypes
call dein#add('vim-ruby/vim-ruby',                 {'on_ft': ['ruby', 'erb']})
call dein#add('vim-scripts/Arduino-syntax-file',   {'on_ft': ['arduino']})
call dein#add('wlangstroth/vim-racket',            {'on_ft': ['racket']})
call dein#add('derekwyatt/vim-scala',              {'on_ft': ['scala']})
call dein#add('aliva/vim-fish',                    {'on_ft': ['fish']})
call dein#add('elixir-lang/vim-elixir',            {'on_ft': ['elixir']})
call dein#add('gabrielelana/vim-markdown',         {'on_ft': ['markdown']})
call dein#add('stephpy/vim-yaml',                  {'on_ft': ['yaml']})
call dein#add('pearofducks/ansible-vim',           {'on_ft': ['ansible']})
call dein#add('pangloss/vim-javascript',           {'on_ft': ['javascript', 'jsx']})
call dein#add('mxw/vim-jsx',                       {'on_ft': ['javascript', 'jsx']})
call dein#add('Matt-Deacalion/vim-systemd-syntax', {'on_ft': ['systemd']})
call dein#add('lambdatoast/elm.vim',               {'on_ft': ['elm']})
call dein#add('ekalinin/Dockerfile.vim',           {'on_ft': ['Dockerfile']})
call dein#add('zah/nimrod.vim',                    {'on_ft': ['nim']})
call dein#add('wstrinz/shen.vim',                  {'on_ft': ['shen']})
call dein#add('rust-lang/rust.vim',                {'on_ft': ['rust']})
call dein#add('racer-rust/vim-racer',              {'on_ft': ['rust']})
call dein#add('rodjek/vim-puppet',                 {'on_ft': ['puppet']})
call dein#add('fatih/vim-go',                      {'on_ft': ['go']})
" call dein#add('jodosha/vim-godebug',               {'on_ft': ['go']})
call dein#add('lepture/vim-jinja',                 {'on_ft': ['jinja']})

" Haskell
call dein#add('wlangstroth/vim-haskell', {'on_ft': ['haskell']})
call dein#add('bitc/vim-hdevtools',      {'on_ft': ['haskell']})
call dein#add('eagletmt/ghcmod-vim',     {'on_ft': ['haskell']})

" Autocomplete mode for delimiteres in insert mode
call dein#add('Raimondi/delimitMate')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/deoplete.nvim')

" Rainbow ()
call dein#add('luochen1990/rainbow')

" Clojure
call dein#add('guns/vim-clojure-static',    {'on_ft': ['clojure']})
call dein#add('guns/vim-clojure-highlight', {'on_ft': ['clojure']})
call dein#add('tpope/vim-fireplace',        {'on_ft': ['clojure']})
call dein#add('tpope/vim-dispatch',         {'on_ft': ['clojure']})
call dein#add('vim-scripts/paredit.vim',    {'on_ft': ['clojure']})

call dein#add('cespare/vim-toml', {'on_ft': ['toml']})

call dein#add('tpope/timl')
call dein#add('sjl/tslime2.vim')

"Surround is the best!
call dein#add('tpope/vim-surround')

" Themes
call dein#add('morhetz/gruvbox')

call dein#add('sjl/gundo.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell')

call dein#add('vimwiki/vimwiki')

call dein#add('vim-scripts/dbext.vim', {'on_ft': ['sql']})

call dein#end()

filetype plugin indent on
syntax enable

" ====================== DEPENDENCIES END ======================

" Gruvbox
if !has("gui_running")
  let g:gruvbox_italic=0
endif

" Enable filetype
set autoindent
syntax on
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

set autowrite
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

set t_Co=256
set background=dark
colorscheme gruvbox

"List special symbols
set listchars=tab:▸\ ,eol:¬,trail:•,extends:⟩,precedes:⟨
set list

nmap <silent> <C-l> :silent noh<CR>

set guioptions=ai

"Git branch in statusline
set statusline=%<%f\ %y\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" Set folding
set foldmethod=marker

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

set shell=bash

let g:netrw_home = "/home/gnzh/.vim/tmp/netrw"

" Persistend undo
if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif

" vim: ts=2:sts=2:sw=2:expandtab
