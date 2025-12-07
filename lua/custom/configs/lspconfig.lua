local util = require("lspconfig.util")

-- Load default configurations from NvChad
local default_lspconfig = require("plugins.configs.lspconfig")

-- Define common setup options
local common_setup = {
  on_attach = default_lspconfig.on_attach,
  capabilities = default_lspconfig.capabilities,
  on_init = default_lspconfig.on_init,
}

local function with_common(opts)
  return vim.tbl_deep_extend("force", {}, common_setup, opts or {})
end

-- Setup for Rust
vim.lsp.config("rust_analyzer", with_common({
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}))

-- Setup for Zig
vim.lsp.config("zls", with_common())

-- Setup for C and C++ using clangd
vim.lsp.config("clangd", with_common())

-- Setup for JavaScript / TypeScript
vim.lsp.config("ts_ls", with_common())

vim.lsp.enable({ "rust_analyzer", "zls", "clangd", "ts_ls" })
