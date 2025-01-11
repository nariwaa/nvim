local plugins = {
  {
    "xiyaowong/transparent.nvim",
    lazy = false
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 5,
      position = "bottom-left"
    }
  },
  {
    "gbprod/substitute.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://192.168.1.122:11434", -- optional: default value is ollama url http://127.0.0.1:11434
                api_key = "OpenAI_API_KEY", -- optional: if your endpoint is authenticated
                chat_url = "/v1/chat/completions", -- optional: default value, override if different

              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "ollama",
          },
          inline = {
            adapter = "ollama",
          },
        },
      })
    end,
    lazy = false
  },
}

return plugins
