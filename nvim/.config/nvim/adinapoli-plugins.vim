
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins goes here.

" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'bluz71/vim-moonfly-colors'
Plug 'ev-agelos/blaquemagick.vim'
Plug 'robertmeta/nofrils'
Plug 'owickstrom/vim-colors-paramount'
Plug 'KKPMW/distilled-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'bluz71/vim-moonfly-colors'
Plug 'Nequo/vim-allomancer'
Plug 'jaredgorski/SpaceCamp'

" For markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Latex
Plug 'lervag/vimtex'

Plug 'https://github.com/jamessan/vim-gnupg.git'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:rustfmt_autosave = 1

" Haskell
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
"Plug 'https://github.com/itchyny/vim-haskell-indent.git'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc.git'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'udalov/kotlin-vim'
Plug 'https://github.com/jremmen/vim-ripgrep.git'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   let g:deoplete#enable_at_startup = 1
" else
" endif

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Initialize plugin system
call plug#end()
