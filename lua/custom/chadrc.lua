---@type ChadrcConfig

local M = {}

local ascii_art_1 = {
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


M.ui = {
  nvdash = {
    load_on_startup = true,
    header = ascii_art_1,
  },
}

M.plugins = 'custom.plugins'
return M
