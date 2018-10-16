
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'

" General-purpose plugins
Plug 'git@github.com:jremmen/vim-ripgrep.git'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc.git'
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Haskell
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'https://github.com/itchyny/vim-haskell-indent.git'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Initialize plugin system
call plug#end()
