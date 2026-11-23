require("oil").setup({
  view_options = { show_hidden = true },
  keymaps = { ["<C-h>"] = false, ["<C-l>"] = false },
})
require("neo-tree").setup({
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = "disabled",
    filtered_items = { visible = true },
  },
})

local harpoon = require("harpoon")
harpoon:setup()

local map = vim.keymap.set

map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>e", "<cmd>Neotree toggle reveal<CR>", { desc = "File tree" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree" })

map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
for i = 1, 4 do
  map("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon file " .. i })
end
