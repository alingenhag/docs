local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    nix = { "alejandra" },
    lua = { "stylua" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  format_on_save = { timeout_ms = 1000 },
})

vim.keymap.set(
  { "n", "v" },
  "<leader>cf",
  function() conform.format({ lsp_format = "fallback" }) end,
  { desc = "Format buffer or selection" }
)
