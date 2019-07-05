" Disable vi-compatibility
set nocompatible

source ~/.config/nvim/adinapoli-plugins.vim
source ~/.config/nvim/adinapoli-keybindings.vim
source ~/.config/nvim/adinapoli-general.vim
source ~/.config/nvim/adinapoli-navigation.vim
source ~/.config/nvim/adinapoli-programming-languages.vim
source ~/.config/nvim/adinapoli-haskell.vim
source ~/.config/nvim/adinapoli-rust.vim
source ~/.config/nvim/adinapoli-find-in-projects.vim
source ~/.config/nvim/adinapoli-ruby.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Easier tab switching and coloring
nnoremap <silent> t :tabnext<CR>
nnoremap <silent> T :tabprevious<CR>
nnoremap <silent> <c-t> :tabnew<CR>
:hi TabLineSel guibg=Yellow guifg=Black ctermfg=Black ctermbg=Yellow
:hi TabLineFill ctermfg=Blue ctermbg=Yellow

"Shows cmd pressed in normal mode
set showcmd

