local gitsigns = require("gitsigns")

gitsigns.setup({
  on_attach = function(bufnr)
    local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) end
    map("n", "]c", function()
      if vim.wo.diff then return vim.cmd.normal({ "]c", bang = true }) end
      gitsigns.nav_hunk("next")
    end, "Next hunk")
    map("n", "[c", function()
      if vim.wo.diff then return vim.cmd.normal({ "[c", bang = true }) end
      gitsigns.nav_hunk("prev")
    end, "Previous hunk")
    map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
    map("n", "<leader>gS", gitsigns.stage_hunk, "Stage hunk")
    map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
    map("n", "<leader>gl", gitsigns.blame_line, "Blame line")
  end,
})
