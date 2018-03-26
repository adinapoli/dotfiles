
au BufEnter *.md set filetype=markdown

"Right Column margin indicator
:set cc=80

"No beeping and visual bell
set noeb vb t_vb=

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" Took from Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" " Indent if we're at the beginning of a line. Else, do completion.
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Remapping <Esc> to jj in insert mode
inoremap jj <Esc>

" No more autocomments on newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Whitespace stuff
set list
set nowrap
set tabstop=2
set shiftwidth=4
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬,trail:·

