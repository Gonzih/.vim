let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'haskell', 'clojure', 'rust', 'go'],
                           \ 'passive_filetypes': [] }

let g:syntastic_rust_checkers = ['cargo']
