let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

" ====================== DEPENDENCIES BEGIN ======================
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('tpope/vim-commentary')
  " extend % in html
  call dein#add('vim-scripts/matchit.zip')
  " ruby end stuff
  call dein#add('tpope/vim-endwise')
  " git stuff
  call dein#add('tpope/vim-fugitive')
  " better netrw
  call dein#add('tpope/vim-vinegar')
  " db interface
  " call dein#add('tpope/vim-dadbod')
  " Tab/=
  call dein#add('godlygeek/tabular')

  " Nix os syntax
  call dein#add('LnL7/vim-nix')

  " Bottom line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " Syntax checks
  call dein#add('scrooloose/syntastic')
  " Git status
  call dein#add('airblade/vim-gitgutter')
  " ,f stuff
  call dein#add('Lokaltog/vim-easymotion')

  "FZF
  call dein#add('junegunn/fzf',     {'build': './install --all', 'merged': 0})
  call dein#add('junegunn/fzf.vim', {'depends': 'junegunn/fzf'})

  " Arduino
  call dein#add('stevearc/vim-arduino',            {'on_ft': ['arduino']})
  call dein#add('vim-scripts/Arduino-syntax-file', {'on_ft': ['arduino']})

  " FileTypes
  call dein#add('vim-ruby/vim-ruby',                 {'on_ft': ['ruby', 'erb']})
  call dein#add('wlangstroth/vim-racket',            {'on_ft': ['racket']})
  call dein#add('derekwyatt/vim-scala',              {'on_ft': ['scala']})
  call dein#add('neovimhaskell/haskell-vim',         {'on_ft': ['haskell']})
  call dein#add('aliva/vim-fish',                    {'on_ft': ['fish']})
  call dein#add('elixir-lang/vim-elixir',            {'on_ft': ['elixir']})
  call dein#add('slashmili/alchemist.vim',           {'on_ft': ['elixir']})
  call dein#add('gabrielelana/vim-markdown',         {'on_ft': ['markdown']})
  call dein#add('stephpy/vim-yaml',                  {'on_ft': ['yaml']})
  call dein#add('pearofducks/ansible-vim',           {'on_ft': ['yaml.ansible']})
  call dein#add('pangloss/vim-javascript',           {'on_ft': ['javascript', 'jsx']})
  call dein#add('mxw/vim-jsx',                       {'on_ft': ['javascript', 'jsx']})
  call dein#add('Matt-Deacalion/vim-systemd-syntax', {'on_ft': ['systemd']})
  " call dein#add('lambdatoast/elm.vim',               {'on_ft': ['elm']})
  call dein#add('ekalinin/Dockerfile.vim',           {'on_ft': ['Dockerfile']})
  " call dein#add('zah/nimrod.vim',                    {'on_ft': ['nim']})
  call dein#add('rust-lang/rust.vim',                {'on_ft': ['rust']})
  call dein#add('wagnerf42/vim-clippy.git',          {'on_ft': ['rust']})
  call dein#add('fatih/vim-go',                      {'on_ft': ['go']})
  " call dein#add('jodosha/vim-godebug',               {'on_ft': ['go']})
  " call dein#add('lepture/vim-jinja',                 {'on_ft': ['jinja']})
  call dein#add('hashivim/vim-terraform',            {'on_ft': ['terraform']})
  call dein#add('dart-lang/dart-vim-plugin',         {'on_ft': ['dart']})
  call dein#add('thosakwe/vim-flutter',              {'on_ft': ['dart']})
  " call dein#add('reasonml-editor/vim-reason-plus',   {'on_ft': ['reason']})
  call dein#add('HerringtonDarkholme/yats.vim',      {'on_ft': ['typescript', 'typescript.tsx']})
  call dein#add('sirtaj/vim-openscad',               {'on_ft': ['openscad']})
  call dein#add('JuliaEditorSupport/julia-vim')
  call dein#add('vim-python/python-syntax',          {'on_ft': ['python']})
  call dein#add('prettier/vim-prettier',             {'build': 'yarn install', 'on_ft': ['javascript', 'typescript', 'typescript.tsx', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']})
  call dein#add('OmniSharp/omnisharp-vim',           {'on_ft': ['cs']})
  call dein#add('tikhomirov/vim-glsl',               {'on_ft': ['glsl']})
  call dein#add('TovarishFin/vim-solidity',          {'on_ft': ['solidity']})
  call dein#add('jparise/vim-graphql',               {'on_ft': ['graphql']})


  " Completion
  " call dein#add('prabirshrestha/async.vim')

  if has('nvim')
    call dein#add('autozimu/LanguageClient-neovim', {'build': 'bash install.sh', 'merged': 0, 'rev': 'next'})
    call dein#add('neovim/nvim-lspconfig', {'on_ft': ['disablethatshitfornow']})
    call dein#add('Shougo/deoplete.nvim',         {'do': ':UpdateRemotePlugins'})
    call dein#add('xavierd/clang_complete')
  endif

  " Rainbow ()
  call dein#add('luochen1990/rainbow')

  " Clojure
  call dein#add('vim-scripts/paredit.vim',                    {'on_ft': ['clojure']})
  call dein#add('guns/vim-clojure-static',                    {'on_ft': ['clojure']})
  call dein#add('guns/vim-clojure-highlight',                 {'on_ft': ['clojure']})
  " call dein#add('gberenfield/cljfold.vim',                    {'on_ft': ['clojure']})
  call dein#add('Olical/conjure',                             {'on_ft': ['clojure'], 'rev': 'v4.11.0'})


  call dein#add('cespare/vim-toml', {'on_ft': ['toml']})

  call dein#add('cakebaker/scss-syntax.vim', {'on_ft': ['scss', 'sass']})

  "Surround is the best!
  call dein#add('tpope/vim-surround')

  " Themes
  call dein#add('morhetz/gruvbox')
  call dein#add('sjl/badwolf')
  call dein#add('sonph/onehalf', {'rtp': 'vim'})

  call dein#add('sjl/gundo.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell')

  call dein#add('vimwiki/vimwiki')

  call dein#add('vim-scripts/dbext.vim', {'on_ft': ['sql']})

  call dein#add('liuchengxu/vim-which-key')

  call dein#add('lervag/vimtex')

  " disabel for now, annoying
  " call dein#add('nathanaelkane/vim-indent-guides', {'on_ft': ['yaml']})

  call dein#add('majutsushi/tagbar')

  call dein#add('rhysd/vim-grammarous')

  call dein#add('glacambre/firenvim', { 'hook_post_update': { _ -> firenvim#install(0) } })

  call dein#add('github/copilot.vim')
  call dein#add('zbirenbaum/copilot.lua')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('CopilotC-Nvim/CopilotChat.nvim', { 'rev': 'canary' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ====================== DEPENDENCIES END ======================

" Read config files from a project dir
set exrc
set secure

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
colorscheme onehalfdark

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

if !has('win32')
  set shell=bash
endif

let g:netrw_home = "~/.vim/tmp/netrw"

" Persistend undo
if exists("&undodir")
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif

let g:deoplete#enable_at_startup = 1

lua << EOF
require("CopilotChat").setup {
  debug = false, -- Enable debugging
  mappings = {
    close = {
      normal = 'q',
      insert = '<C-m>'
    },
    reset = {
      normal ='<C-l>',
      insert = '<C-l>'
    },
    submit_prompt = {
      insert = '<CR>'
    },
  },
  -- See Configuration section for rest
}
EOF

" vim: ts=2:sts=2:sw=2:expandtab
