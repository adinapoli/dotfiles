-- lua/workspace_diags.lua
-- Requires: Neovim HEAD/0.12+, builtin LSP; optional: folke/trouble.nvim

local has_trouble, _ = pcall(require, "trouble")
vim.notify_fancy = require("notify")

local wsDiag = require("workspace-diagnostics").setup({
    workspace_files = function()
      local files = vim.fn.split(vim.fn.system("rg --files -t hs src main test | sort"), "\n")
      vim.notify_fancy(string.format("Found %d files", #files), vim.log.levels.INFO)
      return files
    end,
  })

-- ── 1) Request workspace diagnostics (builtin API) ────────────────
-- Uses the new LSP method via Neovim: vim.lsp.buf.workspace_diagnostics()
-- Ref: :help news / workspace/diagnostic support
local function request_workspace_diags()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  local sent = false
  for _, client in ipairs(buf_clients) do
    -- Only ask clients that support workspace diagnostics
    if client.supports_method and client:supports_method("workspace/diagnostic") then
      vim.notify_fancy("Populating diagnostics for the full project..", vim.log.levels.INFO)
      vim.lsp.buf.workspace_diagnostics({ bufnr = 0 })
      sent = true
    end
  end
  if not sent then
    vim.notify_fancy("Falling back to workspace/diagnostic non-native plugin", vim.log.levels.WARN)
    wsDiag.populate_workspace_diagnostics(client, bufnr)
  end
end

-- ── 2) Populate once per root on first attach; allow manual rescan ─
local POPULATED_BY_ROOT = {}

local function populate_once_on_attach(client, bufnr)
  local root = client.config and client.config.root_dir or nil
  if not root then return end
  if client.supports_method and client:supports_method("workspace/diagnostic") then
    if not POPULATED_BY_ROOT[root] then
      vim.lsp.buf.workspace_diagnostics({ bufnr = bufnr })
      vim.notify_fancy("Populating diagnostics for the full project..", vim.log.levels.INFO)
      POPULATED_BY_ROOT[root] = true
    end
  else
    vim.notify_fancy("Falling back to workspace/diagnostic non-native plugin", vim.log.levels.WARN)
    wsDiag.populate_workspace_diagnostics(client, bufnr)
  end
end

-- expose a helper you can call in your lspconfig on_attach:
_G.workspace_diags_on_attach = populate_once_on_attach

-- manual rescan
vim.api.nvim_create_user_command("WorkspaceDiagnosticsRescan", request_workspace_diags, {})

-- ── 3) Keymaps (`,` as <leader>) ───────────────────────────────────
-- ,d  → show workspace diagnostics (Trouble if present, else quickfix)
vim.keymap.set("n", ",d", function()
  if has_trouble then
    vim.cmd("Trouble diagnostics toggle")
  else
    vim.diagnostic.setqflist({})   -- built-in: put all current diags into quickfix
    vim.cmd("copen")
  end
end, { desc = "Diagnostics (workspace)" })

-- ,dr → explicitly (re)request workspace diagnostics from the server
vim.keymap.set("n", ",dr", request_workspace_diags, { desc = "Rescan workspace diagnostics" })

-- ,D → buffer diagnostics in Trouble (or loclist)
vim.keymap.set("n", ",D", function()
  if has_trouble then
    vim.cmd("Trouble diagnostics toggle filter.buf=0")
  else
    vim.diagnostic.setloclist({})  -- current buffer only
    vim.cmd("lopen")
  end
end, { desc = "Diagnostics (buffer)" })

-- ── 4) Tiny statusline helper: counts across *open* files ─────────
-- Counts E/W/H/I from vim.diagnostic over all listed buffers in the current tab.
local function diag_counts_open_files()
  local sev = vim.diagnostic.severity
  local totals = { [sev.ERROR]=0, [sev.WARN]=0, [sev.HINT]=0, [sev.INFO]=0 }

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
      for _, d in ipairs(vim.diagnostic.get(bufnr)) do
        totals[d.severity] = (totals[d.severity] or 0) + 1
      end
    end
  end
  return string.format("E:%d W:%d H:%d I:%d",
    totals[sev.ERROR], totals[sev.WARN], totals[sev.HINT], totals[sev.INFO])
end

-- Make it accessible from 'statusline' or lualine.
_G.workspace_diags_status = diag_counts_open_files
-- Example (vanilla statusline):
-- vim.o.statusline = "%f %m %= %{%v:lua.workspace_diags_status()%} %l:%c"
