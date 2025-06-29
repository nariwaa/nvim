local plugins = {
  {
      "benlubas/molten-nvim",
      dependencies = { "3rd/image.nvim" },
      build = ":UpdateRemotePlugins",
      init = function()
          -- these are examples, not defaults. Please see the readme
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 20
      end,
  },
  -- {
  --   -- see the image.nvim readme for more information about configuring this plugin
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = "kitty", -- whatever backend you would like to use
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --     integrations = {
  --       markdown = {
  --         enabled = true,
  --         clear_in_insert_mode = false,
  --         download_remote_images = true,
  --         only_render_image_at_cursor = false,
  --         floating_windows = false, -- if true, images will be rendered in floating markdown windows
  --         filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  --       },
  --     },
  --   },
  --   lazy = false,
  -- },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
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
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
                url = "http://192.168.1.122:11434",
                chat_url = "/v1/chat/completions",
              },
              schema = {
                model = { default = "qwen3" },
              }
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
