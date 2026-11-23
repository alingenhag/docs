local wk = require("which-key")

wk.setup({})
wk.add({
  { "<leader>a", group = "opencode" },
  { "<leader>c", group = "Code" },
  { "<leader>d", group = "Debug" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Git" },
  { "<leader>h", group = "Harpoon" },
  { "<leader>j", group = "Java" },
  { "<leader>t", group = "Test" },
})
