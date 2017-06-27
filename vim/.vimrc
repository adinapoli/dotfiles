" Disable vi-compatibility
set nocompatible

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
syntax on

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

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" Set the map leader
let mapleader = ","
let maplocalleader = "-"

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

nmap <leader>tt :TagbarToggle<CR>

let g:haddock_browser = ""

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : '$HOME/.cabal/bin/hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

nmap <leader>rr :source ~/.nvimrc<CR>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Whitespace stuff
set list
set nowrap
set tabstop=2
set shiftwidth=4
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¬,trail:·

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" unlight search selection when pressing enter
:nnoremap <CR> :nohlsearch<cr>

" Modula 2, are you serious?
au BufEnter *.md set filetype=markdown

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
" Set the 256 color mode for terminal
set t_Co=256

"Font config Linux and Mac
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata-dz\ for\ Powerline\ 8
        set guioptions+=m  "leave menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
    else
        set guifont=Inconsolata-dz\ for\ Powerline:h16
    endif
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

"Right Column margin indicator
:set cc=80

"No beeping and visual bell
set noeb vb t_vb=

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" A dirty trick for preventing me to use arrow keys
inoremap <Up>      <NOP>
inoremap <Down>    <NOP>
inoremap <Left>    <NOP>
inoremap <Right>   <NOP>
noremap <Up>       <NOP>
noremap <Down>     <NOP>
noremap <Left>     <NOP>
noremap <Right>    <NOP>

" NAVIGATION
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Easier switch among buffers
nnoremap <silent> H :bp<CR>
nnoremap <silent> L :bn<CR>

" Easier tab switching and coloring
nnoremap <silent> t :tabnext<CR>
nnoremap <silent> T :tabprevious<CR>
nnoremap <silent> <c-t> :tabnew<CR>
:hi TabLineSel guibg=Yellow guifg=Black ctermfg=Black ctermbg=Yellow
:hi TabLineFill ctermfg=Blue ctermbg=Yellow

"Shows cmd pressed in normal mode
set showcmd

nnoremap <c-p> :FZF<CR>

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


"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGES-SPECIFIC STUFF
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No more autocomments on newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""
" HTML
"~~~~~~~~~~
autocmd FileType html setlocal shiftwidth=2 tabstop=2

"""""""""""
" RUST
"~~~~~~~~~~
let $RUST_SRC_PATH = '/Users/adinapoli/programming/rust/rust/src'

au BufEnter *.hsc set filetype=haskell
au FileType haskell nnoremap <silent> <leader>e :copen<CR>
au FileType haskell nnoremap <silent> <leader>n :cc<CR>
au FileType haskell setl makeprg=cabal\ build
au FileType haskell setl errorformat+=%A%f:%l:\ %m,%A%f:%l:,%C%\\s%m,%Z

"Ack.vim, uses Ack, a better grep
let g:ackprg="ack -H --nocolor --nogroup --column --type-add=haskell=.hsc --type-add=groovy=.gsp"

" Org
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()
