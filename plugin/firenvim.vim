let g:firenvim_config = {
                        \ 'globalSettings': {
                        \  },
                        \ 'localSettings': {
                        \ }
                        \ }

let __fg = g:firenvim_config['globalSettings']
let __fl = g:firenvim_config['localSettings']

let __fg['ignoreKeys'] = {
                         \ 'all': ['<C-->', '<C-+>', '<C-CR>', '<S-CR>', '<C-s>'],
                         \ 'normal': ['<C-1>', '<C-2>']
                         \ }

if exists('g:started_by_firenvim')
  set guifont=Victor\ Mono:h10
end
