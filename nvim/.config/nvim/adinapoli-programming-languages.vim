

"Right Column margin indicator
:set cc=110

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

let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_ctags_executable_haskell = "/Users/adinapoli/.config/nvim/adinapoli-haskell/gen-tags"

" Zig
" zig.vim: format on save via `zig fmt`
let g:zig_fmt_autosave = 1

" ZLS via nvim 0.11+ native vim.lsp.config API
lua << EOF
vim.lsp.config('zls', {
  cmd = { vim.fn.expand('~/.zvm/bin/zls') },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'build.zig', 'build.zig.zon', '.git' },
  settings = {
    zls = {
      enable_build_on_save = true,
      build_on_save_step = "check",
      enable_inlay_hints = true,
      warn_style = true,
      highlight_global_var_declarations = true,
    },
  },
})
vim.lsp.enable('zls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= 'zls' then return end
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})
EOF

" Zig ctags fallback (universal-ctags has no native zig support yet)
let g:gutentags_ctags_executable_zig = 'ctags'
