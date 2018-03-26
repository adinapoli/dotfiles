
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins goes here.
Plug 'mhartington/oceanic-next'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'cloudhead/neovim-fuzzy'
Plug 'numkil/ag.nvim'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc.git'
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'

" Initialize plugin system
call plug#end()
