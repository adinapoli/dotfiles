
let g:rustfmt_autosave = 1

aut BufEnter *.rs inoremap <silent><expr> <cr> 
            \ pumvisible() ? coc#_select_confirm() : 
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
