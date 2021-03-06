let g:firenvim_config = {
                        \ 'globalSettings': {
                        \  },
                        \ 'localSettings': {
                        \ }
                        \ }

let __fg = g:firenvim_config['globalSettings']
let __fl = g:firenvim_config['localSettings']

let __fl['https://www\.notion\.so/'] = { 'takeover': 'never', 'priority': 1 }

let __fg['ignoreKeys'] = {
                         \ 'all': ['<C-->', '<C-+>', '<C-CR>', '<S-CR>', '<C-s>'],
                         \ 'normal': ['<C-1>', '<C-2>']
                         \ }

if exists('g:started_by_firenvim')
  set guifont=Victor\ Mono:h9

  " au BufEnter github.com_*.txt set filetype=markdown
  " pluto related stuff
  " au BufEnter localhost_edit_* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-s\>")<CR>
  " au BufEnter localhost_edit_* nnoremap <leader><CR> :w<CR>:call firenvim#press_keys("\<C-CR\>")<CR>:q<CR>
  " au BufEnter 192.168.*_edit_* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-s\>")<CR>

  " jupyter lab
  au BufEnter 127.0.0.1_lab-* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-CR\>")<CR>
  au BufEnter localhost_lab-* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-CR\>")<CR>
  au BufEnter 192.168.*_lab-* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-CR\>")<CR>

  " google colab
  au BufEnter colab.research.google.com_* nnoremap <leader><leader> :w<CR>:call firenvim#press_keys("\<C-CR\>")<CR>
  au BufEnter colab.research.google.com_* set ft=julia
end
