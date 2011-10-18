set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype on

" Bundles
" original repos on github
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'mrtazz/molokai.vim'
Bundle 'vim-ruby/vim-ruby'
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
Bundle 'godlygeek/tabular'

" other git repos
"Bundle 'git://git.wincent.com/command-t.git'

" Enable filetype
set autoindent
filetype plugin indent on
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

augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Dvorak it
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
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

colorscheme darkblue

let g:rsenseUseOmniFunc = 1

set listchars=tab:->,trail:~,extends:>,precedes:<
set list

nmap <silent> <C-N> :silent noh<CR>

set guioptions=ai

au BufNewFile,BufRead *.j,Jakefile setf objj


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
set statusline=%<%f\ %y\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

"Fugitive aliases
autocmd User fugitive command! -bar -buffer -nargs=* Gci :Gcommit <args>

"W command that write files as root
command W w !sudo tee % > /dev/null

"File types
au BufRead,BufNewFile *.ejs setlocal filetype=html.javascript
au BufRead,BufNewFile *.coffee setlocal filetype=coffee

au BufRead,BufNewFile Guardfile setlocal filetype=ruby

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype sass setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
