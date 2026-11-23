local M = {}

M.capabilities = require("blink.cmp").get_lsp_capabilities()

require("lazydev").setup({})

vim.lsp.config("*", { capabilities = M.capabilities })
vim.lsp.enable({
  "lua_ls",
  "bashls",
  "yamlls",
  "jsonls",
  "kotlin_language_server",
  "marksman",
})
if vim.fn.executable("nixd") == 1 then vim.lsp.enable("nixd") end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
  end,
})

return M
