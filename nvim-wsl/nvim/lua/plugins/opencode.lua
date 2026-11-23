local opencode = require("opencode")
local map = vim.keymap.set

map({ "n", "x" }, "<leader>as", function() opencode.ask("@this: ") end, { desc = "Ask opencode about this" })
map("n", "<leader>ab", function() opencode.ask("@buffer: ") end, { desc = "Ask opencode about buffer" })
map("n", "<leader>ad", function() opencode.prompt("Explain @diagnostics") end, { desc = "Explain diagnostics" })
map({ "n", "x" }, "<leader>ap", function() opencode.select() end, { desc = "Pick opencode action" })
map("n", "<leader>ai", "<cmd>checkhealth opencode<CR>", { desc = "opencode connection status" })
