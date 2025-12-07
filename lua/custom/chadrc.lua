---@type ChadrcConfig

local M = {}

local ascii_art_flower = {
  "       ⊹⠀⠀⠀ ⣤⣶⠿⢖⣢⣴⣶⣦⣤⣄         ",
  "       ⠀⠀⠀⢸⡟⢁⣼⠟⣩⢤⣤⠤⣉⠻⣇⠀     ˖  ",
  "       ⢀⣾⣿⡈⡇⢸⡏⣼⣇⡑⢀⠇⣸⢆⢿⢸⣿⣦      ",
  "       ⣸⣿⣿⡇⠁⣀⡘⠿⠿⠿⢣⡾⢏⣼⠈⣼⣿⣿      ",
  "       ⣿⣿⣿⣄⠾⣿⣿⣿⣶⣶⣤⣶⣿⡟⠀⣿⣿⠏      ",
  "       ⠈⠙⠿⣿⣦⡈⢿⣿⣿⣿⣿⡿⠋⣠⣾⣿⣷       ",
  "       ⠀⠀⠀⠈⠉⠉⢀⣉⣉⣩⣥⣶⣿⣿⡿⠟⠋       ",
  "  ⁺⊹     ⠀⠀⠀⠀⠀ ⠻⣿⣿⣿⠟⠉⠀⠀    ⊹   ",
  "                               ",
  "      Powered By eovim      ",
}
local ascii_art_butterfly = {
  "   ⠀⣴⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
  "   ⠀⣷⡿⣿⣿⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
  "   ⠀⡿⣿⣿⠻⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
  "   ⠀⣿⣿⠯⣍⣳⡈⢷⡀⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
  "   ⣰⣾⠻⠷⣶⣭⣹⣤⢗⣮⡰⣃⣤⣤⣤⣤⣤⢤⣤⣄⣀⠀  ",
  "   ⣿⠅⣾⢉⣁⣈⣙⣻⣿⣿⣟⡶⠲⢶⡛⢭⣿⣟⣿⣿⡿⠃  ",
  "   ⣿⣮⣥⠊⢡⡔⣮⣿⣿⣧⠉⢻⣷⣦⡍⣿⣿⣷⠛⠁⠀⠀  ",
  "   ⠈⠻⣷⣮⠷⠛⢹⠏⣷⡌⢢⣀⣫⢝⣿⠿⠟⠃⠀⠀⠀⠀  ",
  "   ⠀⠀⠀⠀⠀⠀⠋⠀⣹⣡⠈⡎⢫⣲⣿⠃⠀⠀⠀⠀⠀⠀  ",
  "   ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣲⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀  ",
  "                           ",
  "    Powered By eovim    ",
}
local ascii_art_ribbon = {
  "  ⢠⡶⠒⠖⢢⡤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⢤⡔⠶⢲⣆⠀  ",
  "  ⢸⣇⠀⠀⠀⠀⠀⠉⠙⢣⣀⠀⠀⠀⠀⠀⠀⣀⠞⠛⠉⠀⠀⠀⠀⠀⣸⡇  ",
  "  ⣿⡆⠀⠀⠀⠀⠀⠀⠀⢸⡘⣄⠀⣀⣀⠀⣠⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿  ",
  "  ⣿⡄⠀⠀⠀⠈⠓⠤⠤⣶⣥⣟⠋⠁⠉⣽⢳⣕⡠⠴⠃⠀⠀⠀⠀⠀⢘⠀  ",
  "  ⣿⡄⠀⠀⠀⡀⠤⠖⠋⢻⣼⢻⡀⠀⣀⢾⠟⣮⣽⠲⠤⠀⠀⠀⠀⠀⠰⠆  ",
  "  ⣿⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠫⣿⡝⠋⢻⣽⣰⡠⠀⠀⠀⠀⠀⠀⠀⢱⣻  ",
  "  ⠸⣷⢆⠀⠀⠀⠀⠀⠀⠀⢰⣴⠎⠀⠀⠀⣧⢞⣾⡀⠀⠀⠀⠀⠀⢺⣾⠇  ",
  "  ⠀⢻⣿⣷⣦⣽⡶⣾⢿⡹⠎⡏⠀⠀⠀⣹⣿⡸⢏⣟⡻⢿⣻⡿⣏⣾⠿⠀  ",
  "  ⠀⠀⠈⢹⡡⢍⠒⠀⠂⠑⢹⠇⠀⠀⠀⠈⢻⡷⠈⠆⠱⠉⠦⡩⣏⠉⠀⠀  ",
  "  ⠀⠀⢨⠇⠀⠀⠀⠀⠀⢈⣸⡟⠀⠀⠀⠀⠀⢟⡈⠀⠀⠀⠀⠠⠹⣃⠀⠀  ",
  "  ⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠀⢸⡁⠀⠀⠀⠀⠀⠀⢿⡀⠀  ",
  "  ⠀⢨⡇⠀⠀⠀⠀⠀⠀⠸⣷⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⢸⡇⠀  ",
  "  ⠀⣿⠀⠀⠀⠀⠀⠀⠀⠠⣿⡀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⣀⠒⣿⠀  ",
  "  ⠀⠙⠳⠾⠷⠷⣮⣴⢧⡽⡇⠀⠀⠀⠀⠀⠀⢸⣵⣬⣳⣦⠿⠷⠞⠟⠋⠀  ",
  "                                ",
}

M.ui = {
  theme = "blossom_light",
  nvdash = {
    load_on_startup = true,
    header = ascii_art_flower,
  },

  statusline = {
    theme = "minimal",
    separator_style = { left = "", right = "" },
    overriden_modules = function(modules)
      local mode = modules[1] or ""
      local fileinfo = modules[2] or ""
      local git = modules[3] or ""
      local lsp_progress = modules[5] or ""
      local diagnostics = modules[7] or ""
      local lsp_status = modules[8] or ""
      local cwd = modules[9] or ""
      local position = modules[10] or ""

      modules[1] = mode .. fileinfo
      modules[2] = "%="
      modules[3] = git .. lsp_progress
      modules[4] = "%="
      modules[5] = diagnostics .. lsp_status .. cwd .. position

      for index = 6, #modules do
        modules[index] = nil
      end
    end,
  },

  tabufline = {
    show_numbers = false,
    overriden_modules = function(modules)
      local buffers = modules[2] or ""
      local tabs = modules[3] or ""
      local buttons = modules[4] or ""

      modules[1] = buffers
      modules[2] = "%="
      modules[3] = tabs .. buttons

      for index = 4, #modules do
        modules[index] = nil
      end
    end,
  },

  hl_override = {
      NvDashAscii = {
      fg = "pink",
      bg = "one_bg",
      },

    NvDashButtons = {
      fg = "pink",
      bg = "one_bg",
    },
  },
}

M.mappings = require("custom.mappings")
M.plugins = 'custom.plugins'
return M
