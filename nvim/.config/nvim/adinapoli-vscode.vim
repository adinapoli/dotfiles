
if exists('g:vscode')

  " Normal mode: t → next tab
  nnoremap <silent> t <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
  " Normal mode: Shift-t → previous tab
  nnoremap <silent> T <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>

else
    " ordinary Neovim
endif
