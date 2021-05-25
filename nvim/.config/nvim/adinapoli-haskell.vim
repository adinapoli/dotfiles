"let g:haskell_indent_disable = 1 "So that haskell-vim doesn't conflict with vim-haskell-indent
let g:hindent_on_save = 0

" General haskell-vim defaults.
" let x = 1
" >in x
let g:haskell_indent_in = 0
let g:haskell_indent_disable = 1

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ }

" HASKELL
au BufEnter *.hsc set filetype=haskell
au BufEnter *.lhs set filetype=haskell

" ctags
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal', 'file': 'stack.yaml'})
let g:gutentags_ctags_executable_haskell = '~/.config/nvim/adinapoli-haskell/gen-tags'
let g:gutentags_generate_on_write = 1
" Set the line below to 1 in case the ctagging process fails.
let g:gutentags_trace = 0

" https://github.com/mpickering/hlint-refactor-vim
let g:hlintRefactor#disableDefaultKeybindings = 1

" Allow C-n to bring you to the next COC error.
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

noremap <leader>d :call ToggleCocListDiagnostics()<CR>
nmap <silent> <leader>a <Plug>(coc-codeaction)
nmap <silent> <leader>l <Plug>(coc-codeaction-line)
nmap <leader>ca <Plug>(coc-codelens-action)

let s:adinapoliDiagnosticsListOpen=0

" Toggles the diagnostics box.
function! ToggleCocListDiagnostics()
    if s:adinapoliDiagnosticsListOpen
        :exec ":bd"
    else
        :exec ":CocList --normal diagnostics"
    endif

    let s:adinapoliDiagnosticsListOpen = !s:adinapoliDiagnosticsListOpen
endfunction
