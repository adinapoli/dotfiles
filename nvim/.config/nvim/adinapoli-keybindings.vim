
" Set the map leader
let mapleader = ","
let maplocalleader = "-"

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

nmap <leader>tt :TagbarToggle<CR>

nmap <leader>rr :source ~/.config/nvim/init.vim<CR>


" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
