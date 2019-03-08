"let g:haskell_indent_disable = 1 "So that haskell-vim doesn't conflict with vim-haskell-indent
let g:hindent_on_save = 0

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ }

" HASKELL
au BufEnter *.hsc set filetype=haskell

" ctags
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal', 'file': 'stack.yaml'})
let g:gutentags_ctags_executable_haskell = '~/.config/nvim/adinapoli-haskell/gen-tags'
let g:gutentags_generate_on_write = 1
