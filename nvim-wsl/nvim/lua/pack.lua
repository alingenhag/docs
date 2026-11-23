vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(args)
    local data = args.data
    if data.spec.name == "telescope-fzf-native.nvim" and data.kind ~= "delete" then
      local result = vim.system({ "make" }, { cwd = data.path }):wait()
      if result.code ~= 0 then vim.notify("fzf-native: " .. result.stderr, vim.log.levels.ERROR) end
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig", version = "v2.12.0" },
  { src = "https://codeberg.org/mfussenegger/nvim-jdtls", version = "6e9d953f0b82bccdb834cfde0e893f3119c22592" },
  { src = "https://github.com/folke/lazydev.nvim", version = "ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d" },
  { src = "https://github.com/stevearc/conform.nvim", version = "016802de402556da54c36bd7359b441266b01cdd" },
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },
  { src = "https://github.com/rafamadriz/friendly-snippets", version = "7a1c9f7897a4eb078b157a04c7af81e5869215b1" },
  { src = "https://github.com/nvim-neotest/nvim-nio", version = "21f5324bfac14e22ba26553caf69ec76ae8a7662" },
  { src = "https://codeberg.org/mfussenegger/nvim-dap", version = "cfa2d58f4537aca6ca83e2de1a0d9f1491121264" },
  { src = "https://github.com/rcarriga/nvim-dap-ui", version = "cc9dd33aade7f20bae414d0cba163bc60d4d4b43" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text", version = "fbdb48c2ed45f4a8293d0d483f7730d24467ccb6" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "04f17886f75416dfdc25374c950a52c63f0e98fe" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = "1e1bab730218eaf97fce743be3f56e51075928ac" },
  {
    src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    version = "b25b749b9db64d375d782094e2b9dce53ad53a40",
  },
  { src = "https://github.com/nvim-lua/plenary.nvim", version = "74b06c6c75e4eeb3108ec01852001636d85a932b" },
  { src = "https://github.com/folke/which-key.nvim", version = "3aab2147e74890957785941f0c1ad87d0a44c15a" },
  { src = "https://github.com/stevearc/oil.nvim", version = "v2.16.0" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "3.42.0" },
  { src = "https://github.com/MunifTanjim/nui.nvim", version = "0.4.0" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "87b1a3506211538f460786c23f98ec63ad9af4e5" },
  { src = "https://github.com/mbbill/undotree", version = "6fa6b57cda8459e1e4b2ca34df702f55242f4e4d" },
  { src = "https://github.com/tpope/vim-fugitive", version = "3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0" },
  { src = "https://github.com/lewis6991/gitsigns.nvim", version = "a462f416e2ce4744531c6256252dee99a7d34a83" },
  { src = "https://github.com/ThePrimeagen/vim-be-good", version = "0ae3de14eb8efc6effe7704b5e46495e91931cc5" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", version = "v0.100" },
  { src = "https://github.com/sainnhe/gruvbox-material", version = "11d779b26a9ab2b3db8c22c6ac9fb6e8ed4fea79" },
  { src = "https://github.com/mason-org/mason.nvim", version = "v2.3.1" },
  {
    src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    version = "443f1ef8b5e6bf47045cb2217b6f748a223cf7dc",
  },
  { src = "https://github.com/nickjvandyke/opencode.nvim", version = "4851ae503585dc5142ad66a98e8952a74e1f7b3a" },
}, { confirm = false, load = true })

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server",
    "bash-language-server",
    "yaml-language-server",
    "json-lsp",
    "kotlin-language-server",
    "marksman",
    "jdtls",
    "java-debug-adapter",
    "java-test",
    "stylua",
    "shfmt",
    "tree-sitter-cli",
  },
})
