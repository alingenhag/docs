vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("pack")

vim.o.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "material"
vim.cmd.colorscheme("gruvbox-material")

require("keymaps")
require("plugins.lsp")
require("plugins.completion")
require("plugins.format")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.dap")
require("plugins.navigation")
require("plugins.git")
require("plugins.opencode")
require("plugins.whichkey")
