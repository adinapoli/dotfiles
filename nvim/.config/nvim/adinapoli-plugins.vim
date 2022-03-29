
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
Plug 'Nequo/vim-allomancer'
Plug 'jaredgorski/SpaceCamp'
Plug 'cloudhead/shady.vim'
Plug 'fcpg/vim-orbital'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'yassinebridi/vim-purpura'
Plug 'habamax/vim-polar'
Plug 'habamax/vim-habanight'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hauleth/blame.vim'
Plug 'Zabanaa/neuromancer.vim'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'humanoid-colors/vim-humanoid-colorscheme', { 'branch': 'main' }
Plug 'bignimbus/pop-punk.vim'
Plug 'cocopon/iceberg.vim'

" For markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'

" Latex
Plug 'lervag/vimtex'

Plug 'https://github.com/jamessan/vim-gnupg.git'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:rustfmt_autosave = 1

" General utils
Plug 'https://github.com/chrisbra/NrrwRgn.git'
Plug 'https://github.com/markstory/vim-zoomwin.git'
Plug 'ntpeters/vim-better-whitespace'

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
Plug 'mpickering/hlint-refactor-vim'

" PureScript
Plug 'purescript-contrib/purescript-vim'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   let g:deoplete#enable_at_startup = 1
" else
" endif


let g:python3_host_prog='/usr/local/Cellar/python/3.7.7/bin/python3'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Initialize plugin system
call plug#end()
