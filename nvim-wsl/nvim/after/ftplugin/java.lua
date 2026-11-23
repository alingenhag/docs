local jdtls = require("jdtls")
local packages = vim.fn.stdpath("data") .. "/mason/packages"

local root_markers = {
  { "gradlew", "mvnw", "settings.gradle", "settings.gradle.kts" },
  ".git",
  "pom.xml",
}
local root_dir = vim.fs.root(0, root_markers)
if root_dir == nil or vim.fn.executable("jdtls") == 0 then return end

local project_name = vim.fs.basename(root_dir) .. "-" .. vim.fn.sha256(root_dir):sub(1, 12)
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

local bundles = {
  vim.fn.glob(packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
}
local not_bundles = { "com.microsoft.java.test.runner-jar-with-dependencies.jar", "jacocoagent.jar" }
for _, jar in ipairs(vim.split(vim.fn.glob(packages .. "/java-test/extension/server/*.jar", true), "\n")) do
  if not vim.tbl_contains(not_bundles, vim.fs.basename(jar)) then table.insert(bundles, jar) end
end

local config = {
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. packages .. "/jdtls/lombok.jar",
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  capabilities = require("plugins.lsp").capabilities,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.mockito.Mockito.*",
          "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
          "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },
  },
  on_attach = function(_, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end
    map("n", "<leader>jo", jdtls.organize_imports, "Organize imports")
    map("n", "<leader>jv", jdtls.extract_variable, "Extract variable")
    map("n", "<leader>jc", jdtls.extract_constant, "Extract constant")
    map("v", "<leader>jm", function() jdtls.extract_method(true) end, "Extract method")
    map("n", "<leader>tc", jdtls.test_class, "Test class")
    map("n", "<leader>tm", jdtls.test_nearest_method, "Test nearest method")
  end,
}

jdtls.start_or_attach(config)
