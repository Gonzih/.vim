    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3'],
    \   'ctermfgs': ['brown', 'brown', 'gray', 'black', 'red', 'brown', 'brown', 'gray', 'black', 'red', 'brown', 'brown', 'gray', 'black', 'red'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'go': {
    \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\w*{/ end=/}/ fold'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \   }
    \}

let g:rainbow_active = 1
