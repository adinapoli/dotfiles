
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rp', ht.repl.toggle, opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
