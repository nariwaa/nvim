---@type ChadrcConfig

local M = {}
local theme_cycle = require "custom.theme_cycle"

local primary_theme, secondary_theme = theme_cycle.setup()

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
  theme = primary_theme,
  theme_toggle = { primary_theme, secondary_theme },
  nvdash = {
    load_on_startup = true,
    header = ascii_art_flower,
    buttons = (function()
      local info = theme_cycle.ensure()
      local icon_main = ""
      local icon_secondary = ""
      local buttons = {
        { string.format("%s  Main: %s (%s)", icon_main, info.primary, info.phase), "", "Telescope themes" },
      }

      local secondary = info.secondary
      if secondary and secondary ~= primary_theme then
        table.insert(buttons, { string.format("%s  Secondary: %s", icon_secondary, secondary), "", "Telescope themes" })
      end

      table.insert(buttons, { "  Find File", "Spc f f", "Telescope find_files" })
      table.insert(buttons, { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" })
      table.insert(buttons, { "󰈭  Find Word", "Spc f w", "Telescope live_grep" })
      table.insert(buttons, { "  Bookmarks", "Spc m a", "Telescope marks" })
      table.insert(buttons, { "  Themes", "Spc t h", "Telescope themes" })
      table.insert(buttons, { "  Mappings", "Spc c h", "NvCheatsheet" })

      return buttons
    end)(),
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
