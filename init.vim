syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4

set backspace=2

set nu
set mouse=""

filetype plugin indent on
hi comment ctermfg=6
map <F7> :NERDTreeToggle<CR>
let g:go_fmt_autosave=0
let g:go_imports_autosave=0
lua require('init')
