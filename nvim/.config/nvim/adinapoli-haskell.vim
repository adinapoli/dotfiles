
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ }

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

" HASKELL
au BufEnter *.hsc set filetype=haskell

" ctags
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal', 'file': 'stack.yaml'})
let g:gutentags_ctags_executable_haskell = 'hasktags --ignore-close-implementation -c -o tags .'
