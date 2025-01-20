local M = {}

M.codecompanion = {
  n = {
    -- Open chat in a new split
    ["<leader>cc"] = {
      "<cmd>CodeCompanionChat<CR>",
      "Open chat"
    },
    -- Start inline chat

    ["<leader>ca"] = {
      "<cmd>Telescope codecompanion<CR>",
      "Open action palette"
    }
  }
}

return M
