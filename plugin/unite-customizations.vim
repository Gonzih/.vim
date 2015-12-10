let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_unit = 100

" The silver searcher settings
let s:ag_opts = [
        \ '--vimgrep', '--smart-case', '--skip-vcs-ignores', '--hidden',
        \ '--ignore', '.git', '--ignore', '.idea', '--ignore', '.stversions',
        \ '--ignore', 'bower_modules', '--ignore', 'node_modules'
        \ ]

if executable('ag')
  let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = join(s:ag_opts)
  let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'matchers', 'matcher_fuzzy')
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'sorters', 'sorter_selecta')
call unite#custom#source('file,file/new,buffer,file_rec,file_rec/async', 'converters', 'converter_relative_word')

" General purpose profile for grep and navigating code
call unite#custom#profile('navigate,source/grep', 'context', {
        \   'silent': 1,
        \   'start_insert': 0,
        \   'winheight': 20,
        \   'no_quit': 1,
        \   'keep_focus': 1,
        \   'direction': 'botright',
        \   'prompt_direction': 'top',
        \ })

call unite#custom#source('file,file_rec,file_rec/async', 'ignore_pattern',
      \'tmp\|vendor\|\.bundle\|target\|\.git\|\.rsync_cache')

nnoremap <space>pf :Unite -no-split -buffer-name=files   -start-insert file_rec:!<cr>
nnoremap <space>ff :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <space>bb :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <space>o  :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <space>/  :Unite -no-split -buffer-name=files   -start-insert grep<cr>
nnoremap <space>y  :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <space>b  :Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>

let g:unite_quick_match_table =
      \ get(g:, 'unite_quick_match_table', {
      \     'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6, 't' : 7, 'n' : 8, 's' : 9,
      \     ';' : 10, ',' : 11, '.' : 12, 'p' : 13, 'y' : 14, 'f' : 15, 'g' : 16, 'c' : 17, 'r' : 18, 'l' : 19,
      \     'q' : 20, 'j' : 21, 'k' : 22, 'x' : 23, 'b' : 24, 'm' : 25, 'w' : 26, 'v' : 27, 'z' : 28, '-' : 29,
      \ })

" Drop cache for unite.vim
function! UniteClearCache()
  let result = system("rm ~/.cache/unite -rf")
endfunction
command UniteClearCache call UniteClearCache()
