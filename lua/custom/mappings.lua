local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

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
