local telescope = require("telescope")

telescope.setup({})
pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fr", builtin.resume, { desc = "Resume last picker" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
