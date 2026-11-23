local luasnip = require("luasnip")

luasnip.setup({
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged",
})
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  snippets = { preset = "luasnip" },
  completion = {
    list = { selection = { preselect = false } },
    documentation = { auto_show = true },
  },
  signature = { enabled = true },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
    },
  },
})
