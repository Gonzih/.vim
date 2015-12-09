set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype on

" Plugins
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-commentary'
" extend % in html
Plugin 'edsono/vim-matchit'
" ruby end stuff
Plugin 'tpope/vim-endwise'
" git stuff
Plugin 'tpope/vim-fugitive'
" better netrw
Plugin 'tpope/vim-vinegar'
" Tab/=
Plugin 'godlygeek/tabular'
" Some dependency
Plugin 'vim-scripts/L9'

" Bottom line
Plugin 'bling/vim-airline'
" Syntax checks
Plugin 'scrooloose/syntastic'
" Git status
Plugin 'airblade/vim-gitgutter'
" ,f stuff
Plugin 'Lokaltog/vim-easymotion'

" Some deps i guess
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'

"Unite
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'sgur/unite-git_grep'

" FileTypes
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'wlangstroth/vim-racket'
Plugin 'derekwyatt/vim-scala'
Plugin 'aliva/vim-fish'
Plugin 'elixir-lang/vim-elixir'
Plugin 'gabrielelana/vim-markdown'
Plugin 'stephpy/vim-yaml'
Plugin 'jsx/jsx.vim'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'lambdatoast/elm.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'zah/nimrod.vim'
Plugin 'wstrinz/shen.vim'
Plugin 'rust-lang/rust.vim'

" Haskell
Plugin 'wlangstroth/vim-haskell'
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/ghcmod-vim'

" ProjectTypes
"Plugin 'vim-scripts/rubycomplete.vim'

" Autocomplete mode for delimiteres in insert mode
Plugin 'Raimondi/delimitMate'

" Clojure
Plugin 'Gonzih/vim-niji'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
" This thing will go in to internet for some maven reasons
" Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-dispatch'
Plugin 'typedclojure/vim-typedclojure'
"Plugin 'dgrnbrg/vim-redl'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/timl'

" Themes
Plugin 'morhetz/gruvbox'

Plugin 'sjl/gundo.vim'

Plugin 'sjl/tslime2.vim'

" Something
Plugin 'ryanss/vim-hackernews'

" Gruvbox
if !has("gui_running")
  let g:gruvbox_italic=0
endif

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
set background=dark
colorscheme gruvbox

let g:rsenseUseOmniFunc = 1

"List special symbols
set listchars=tab:▸\ ,eol:¬,trail:•,extends:❯,precedes:❮
set list

nmap <silent> <C-l> :silent noh<CR>

set guioptions=ai

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

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Set folding
set foldmethod=marker

" Enable indent guides
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Powerline symbols are fancy now
let g:Powerline_symbols = 'fancy'

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

let g:paredit_leader=','

set shell=bash

" Syntastic options
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'haskell', 'clojure', 'rust'],
                           \ 'passive_filetypes': [] }

" Airline
let g:airline_powerline_fonts = 1

let g:paredit_electric_return = 0

" Fix some annoying bug in SuperTab
let g:SuperTabCrMapping = 0

" Notes
let g:notes_directories = ['~/Dropbox/Vim Notes']

let g:netrw_home = "/home/gnzh/.vim/tmp/netrw"

command! -nargs=* -complete=shellcmd Fish !fish -c '<args>'
command! -nargs=* Tab Tabularize<args>
command! -nargs=* -range=% Tab <line1>,<line2>Tabularize<args>

" Persistend undo
if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif

if has("nvim")
  tnoremap <Esc> <C-\><C-n>
endif

" vim: ts=2:sts=2:sw=2:expandtab
