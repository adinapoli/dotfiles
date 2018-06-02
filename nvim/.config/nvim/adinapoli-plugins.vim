
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
Plug 'https://github.com/itchyny/vim-haskell-indent.git'
Plug 'git@github.com:jremmen/vim-ripgrep.git'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc.git'
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'git-time-metric/gtm-vim-plugin'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'udalov/kotlin-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
endif

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Initialize plugin system
call plug#end()
