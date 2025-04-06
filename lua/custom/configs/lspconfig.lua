local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- Load default configurations from NvChad
local default_lspconfig = require("plugins.configs.lspconfig")

-- Use the default on_attach, capabilities, and on_init (if available)
local on_attach = default_lspconfig.on_attach
local capabilities = default_lspconfig.capabilities
local on_init = default_lspconfig.on_init -- Optional, included for Zig compatibility

-- Define common setup options
local common_setup = {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init, -- Include this since your original Zig setup used it
}

-- Setup for Rust
lspconfig.rust_analyzer.setup(vim.tbl_extend("force", common_setup, {
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
}))

-- Setup for Zig
lspconfig.zls.setup(common_setup)

-- Setup for C and C++ using clangd
lspconfig.clangd.setup(common_setup)

-- setup js
lspconfig.ts_ls.setup(common_setup)

