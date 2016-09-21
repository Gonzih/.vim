"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/gnzh/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/gnzh/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"Monkey patched netrw
" NeoBundle 'eiginn/netrw'

" NeoBundles
NeoBundle 'tpope/vim-commentary'
" extend % in html
NeoBundle 'edsono/vim-matchit'
" ruby end stuff
NeoBundle 'tpope/vim-endwise'
" git stuff
NeoBundle 'tpope/vim-fugitive'
" better netrw
NeoBundle 'tpope/vim-vinegar'
" Tab/=
NeoBundle 'godlygeek/tabular'
" Some dependency
NeoBundle 'vim-scripts/L9'

" Bottom line
NeoBundle 'bling/vim-airline'
" Syntax checks
NeoBundle 'scrooloose/syntastic'
" Git status
NeoBundle 'airblade/vim-gitgutter'
" ,f stuff
NeoBundle 'Lokaltog/vim-easymotion'

"Start screen
NeoBundle 'mhinz/vim-startify'

"Unite
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

" FileTypes
NeoBundle 'vim-ruby/vim-ruby',                 {'autoload' : {'filetypes' : ['ruby', 'erb']}}
NeoBundle 'tpope/vim-haml',                    {'autoload' : {'filetypes' : ['haml']}}
NeoBundle 'vim-scripts/Arduino-syntax-file',   {'autoload' : {'filetypes' : ['arduino']}}
NeoBundle 'wlangstroth/vim-racket',            {'autoload' : {'filetypes' : ['racket']}}
NeoBundle 'derekwyatt/vim-scala',              {'autoload' : {'filetypes' : ['scala']}}
NeoBundle 'aliva/vim-fish',                    {'autoload' : {'filetypes' : ['fish']}}
NeoBundle 'elixir-lang/vim-elixir',            {'autoload' : {'filetypes' : ['elixir']}}
NeoBundle 'gabrielelana/vim-markdown',         {'autoload' : {'filetypes' : ['markdown']}}
NeoBundle 'stephpy/vim-yaml',                  {'autoload' : {'filetypes' : ['yaml']}}
NeoBundle 'pearofducks/ansible-vim',           {'autoload' : {'filetypes' : ['ansible']}}
NeoBundle 'pangloss/vim-javascript',           {'autoload' : {'filetypes' : ['javascript', 'jsx']}}
NeoBundle 'mxw/vim-jsx',                       {'autoload' : {'filetypes' : ['javascript', 'jsx']}}
NeoBundle 'Matt-Deacalion/vim-systemd-syntax', {'autoload' : {'filetypes' : ['systemd']}}
NeoBundle 'lambdatoast/elm.vim',               {'autoload' : {'filetypes' : ['elm']}}
NeoBundle 'ekalinin/Dockerfile.vim',           {'autoload' : {'filetypes' : ['Dockerfile']}}
NeoBundle 'zah/nimrod.vim',                    {'autoload' : {'filetypes' : ['nim']}}
NeoBundle 'wstrinz/shen.vim',                  {'autoload' : {'filetypes' : ['shen']}}
NeoBundle 'rust-lang/rust.vim',                {'autoload' : {'filetypes' : ['rust']}}
NeoBundle 'rodjek/vim-puppet',                 {'autoload' : {'filetypes' : ['puppet']}}
NeoBundle 'fatih/vim-go',                      {'autoload' : {'filetypes' : ['go']}}
NeoBundle 'lepture/vim-jinja',                 {'autoload' : {'filetypes' : ['jinja']}}

" Haskell
NeoBundle 'wlangstroth/vim-haskell', {'autoload' : {'filetypes' : ['haskell']}}
NeoBundle 'bitc/vim-hdevtools',      {'autoload' : {'filetypes' : ['haskell']}}
NeoBundle 'eagletmt/ghcmod-vim',     {'autoload' : {'filetypes' : ['haskell']}}

" ProjectTypes
"NeoBundle 'vim-scripts/rubycomplete.vim'

" Autocomplete mode for delimiteres in insert mode
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'Shougo/neocomplete.vim'

" Rainbow ()
NeoBundle 'kien/rainbow_parentheses.vim'

" Clojure
NeoBundle 'guns/vim-clojure-static',                        {'autoload' : {'filetypes' : ['clojure']}}
NeoBundle 'guns/vim-clojure-highlight',                     {'autoload' : {'filetypes' : ['clojure']}}
NeoBundle 'tpope/vim-fireplace',                            {'autoload' : {'filetypes' : ['clojure']}}
NeoBundle 'tpope/vim-dispatch',                             {'autoload' : {'filetypes' : ['clojure']}}
NeoBundle 'typedclojure/vim-typedclojure',                  {'autoload' : {'filetypes' : ['clojure']}}
NeoBundle 'vim-scripts/paredit.vim',                        {'autoload' : {'filetypes' : ['clojure']}}
" This thing will go in to internet for some maven reasons
" NeoBundle 'tpope/vim-leiningen',                          {'autoload' : {'filetypes' : ['clojure']}}

"NeoBundle 'dgrnbrg/vim-redl'
NeoBundle 'tpope/timl'
NeoBundle 'sjl/tslime2.vim'

"Surround is the best!
NeoBundle 'tpope/vim-surround'

" Themes
NeoBundle 'morhetz/gruvbox'

NeoBundle 'sjl/gundo.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Gruvbox
if !has("gui_running")
  let g:gruvbox_italic=0
endif

" Enable filetype
set autoindent
syntax on
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
                           \ 'active_filetypes': ['ruby', 'haskell', 'clojure', 'rust', 'go'],
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

" vim: ts=2:sts=2:sw=2:expandtab
