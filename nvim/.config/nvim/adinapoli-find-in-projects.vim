
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_OPTS .= ' --no-height'

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" unlight search selection when pressing enter
:nnoremap <CR> :nohlsearch<cr>
