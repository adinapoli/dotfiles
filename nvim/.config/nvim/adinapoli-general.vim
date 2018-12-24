
" Enable true colours in terminal
set termguicolors

" Theme
" colorscheme OceanicNext
" colorscheme challenger_deep
colorscheme moonfly

syntax on
filetype plugin indent on

" Remember more history
set history=1000

" Permanent undo
set undofile

" No backups, please
set nobackup

" set a directory to store the undo history
set undodir=~/.nvim/undo/

set undolevels=1000 
set undoreload=10000

" Always show the statusline
set laststatus=2

" Highlight the current line
set cursorline

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Show line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" Disable swap files
set noswapfile

set statusline=
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%7*\ %=\ row:%l/%L\             "Rownumber/total (%)
set statusline+=%8*\ col:%03c\                            "Colnr
set statusline+=%9*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%9*\ %{strftime('🕐\ %d/%m/%y\ %I:%M')}


" https://superuser.com/questions/815416/hitting-enter-in-the-quickfix-window-doesnt-work
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
