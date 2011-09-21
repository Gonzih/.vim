set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
" original repos on github
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'nanki/vim-objj'
Bundle 'mrtazz/molokai.vim'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'vim-scripts/AutoComplPop'
Bundle 'tpope/vim-haml'
Bundle 'msanders/snipmate.vim'
Bundle 'Gonzih/vim-snipmate-ruby-snippets'
Bundle 'ervandew/supertab'
Bundle 'trapd00r/neverland-vim-theme'
Bundle 'vim-scripts/simplefold'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'gmarik/vundle'
Bundle 'Bogdanp/rbrepl.vim'

"Bundle 'git://git.wincent.com/command-t.git'

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  "set nobackup   " do not keep a backup file, use versions instead
  "else
  "set backup   " keep a backup file
"endif
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

"else

  set autoindent    " always set autoindenting on

"endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif
"Dvorak it
map ё $
map й ;
map ц ,
map у .
map к p
map е y
map н f
map г g
map ш c
map щ r
map з l
map х /
map ъ @
map ф a
map ы o
map в e
map а u
map п i
map р d
map о h
map л h
map д t
map ж s
map э -
map я '
map ч q
map с j
map м k
map и x
map т b
map ь m
map б w
map ю v

"Dvorak it
map Ё ~
map Й :
map Ц <
map У >
map К P
map Е Y
map Н F
map Г G
map Ш C
map Щ R
map З L
map Х ?
map Ъ @
map Ф A
map Ы O
map В E
map А U
map П I
map Р D
map О H
map Л T
map Д N
map Ж S
map Э _
map Я "
map Ч Q
map С J
map М K
map И X
map Т B
map Ь M
map Б W
map Ю V

set autowrite
set nu
set nowrap
set ts=2
set bs=2
set shiftwidth=2
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.
colorscheme darkblue
"let g:molokai_original = 1
"helptags ~/.vim/doc 
"let loaded_project=1
let g:rsenseUseOmniFunc = 1
set listchars=tab:->,trail:~,extends:>,precedes:<
set list
set expandtab
set tabstop=2
nmap <silent> <C-N> :silent noh<CR>
"rvm
"set statusline+=%{rvm#statusline()} 
set guioptions=ai

set runtimepath+=~/.vim/vim-objj
au BufNewFile,BufRead *.j,Jakefile setf objj

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

let g:SuperTabDefaultCompletionType = "\<C-X>\<C-O>"
let g:SuperTabDefaultCompletionType = "context"

set ofu=syntaxcomplete#Complete

"Dvorak it!
no d h
no h j
no k t
no K T
no t k
no n l
no ; :
no j d
no l n
no L N

"Added benefits
no - $
no _ ^

"Tabs
no N <C-w>l
no T <C-w>k
no D <C-w>h
no H <C-w>j

imap <C-Space> <C-x><C-o>
map ,, <plug>NERDCommenterToggle

"Remaping for Dvorak
let NERDTreeMapOpenInTab='c'

"Gui font
set guifont=Terminus

"Auto cleaning fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"Git branch in statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"Fugitive aliases
autocmd User fugitive command! -bar -buffer -nargs=* Gci :Gcommit <args>

"EJS files highlighting
au BufRead,BufNewFile *.ejs set filetype=html.javascript

"W command that write files as root
command W w !sudo tee % > /dev/null
