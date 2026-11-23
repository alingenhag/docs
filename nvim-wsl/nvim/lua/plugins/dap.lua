local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup({})

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

local map = vim.keymap.set

map("n", "<F5>", function() dap.continue() end, { desc = "DAP continue" })
map("n", "<F10>", function() dap.step_over() end, { desc = "DAP step over" })
map("n", "<F11>", function() dap.step_into() end, { desc = "DAP step into" })
map("n", "<F12>", function() dap.step_out() end, { desc = "DAP step out" })
map("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP toggle breakpoint" })
map(
  "n",
  "<leader>dB",
  function() dap.set_breakpoint(vim.fn.input("Condition: ")) end,
  { desc = "DAP conditional breakpoint" }
)
map("n", "<leader>du", function() dapui.toggle() end, { desc = "DAP UI toggle" })
map("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "DAP REPL" })
map("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP run last" })
