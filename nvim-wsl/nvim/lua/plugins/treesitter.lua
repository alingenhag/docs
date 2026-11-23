local parsers = { "java", "kotlin", "nix", "bash", "json", "yaml", "toml", "xml", "diff", "gitcommit", "git_rebase" }

local function install_parsers()
  if vim.fn.executable("tree-sitter") == 1 then require("nvim-treesitter").install(parsers) end
end

install_parsers()
vim.api.nvim_create_autocmd("User", { pattern = "MasonToolsUpdateCompleted", callback = install_parsers })

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang and vim.treesitter.query.get(lang, "indents") then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
    end
  end,
})
