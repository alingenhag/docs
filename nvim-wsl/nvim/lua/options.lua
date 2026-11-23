local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.confirm = true
opt.inccommand = "split"

opt.foldlevelstart = 99

opt.updatetime = 250
opt.timeoutlen = 400

opt.completeopt = { "menu", "menuone", "noselect" }
