
nnoremap <C-p> :FuzzyOpen<CR>
nmap <leader>. :FuzzyGrep<CR>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" unlight search selection when pressing enter
:nnoremap <CR> :nohlsearch<cr>
