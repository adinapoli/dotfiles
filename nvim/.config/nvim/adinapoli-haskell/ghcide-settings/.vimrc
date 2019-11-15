
let g:gutentags_enabled = 1

" AUTOFORMATTING VIA ORMULU

if !exists("g:ormolu_command")
  let g:ormolu_command = "ormolu"
endif
if !exists("g:ormolu_options")
  let g:ormolu_options = [ ]
endif

function! s:OverwriteBuffer(output)
  let winview = winsaveview()
  silent! undojoin
  normal! gg"_dG
  call append(0, split(a:output, '\v\n'))
  normal! G"_dd
  call winrestview(winview)
endfunction

function! s:Ormolu()
  if executable(g:ormolu_command)
    call s:RunOrmolu()
  elseif !exists("s:exec_warned")
    let s:exec_warned = 1
    echom "ormolu executable not found"
  endif
endfunction

function! s:RunOrmolu()
  let output = system(g:ormolu_command . " " . join(g:ormolu_options, ' ') . " " . bufname("%"))
  let errors = matchstr(output, '\(Language\.Haskell\.Stylish\.Parse\.parseModule:[^\x0]*\)')
  if v:shell_error != 0
    echom output
  elseif empty(errors)
    call s:OverwriteBuffer(output)
    write
  else
    echom errors
  endif
endfunction

augroup ormolu
  autocmd!
  "autocmd BufWritePost *.hs call s:Ormolu()
augroup END

" HIE-CORE 8.6.5

au User lsp_setup call lsp#register_server({
    \ 'name': 'hie-core',
    \ 'cmd': {server_info->['hie-core', '--lsp']},
    \ 'whitelist': ['haskell'],
    \ })


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap     <silent> <C-n> <Plug>(coc-diagnostic-next)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
