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
local ascii_art_suka = {
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠖⠶⠶⣤⣄⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠛⠉⠉⠉⠉⠉⠙⠛⢶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠁⠀⠀⠀⠀⠀⠉⢻⡄⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⠋⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠈⢻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⣴⣟⡉⠉⣉⣉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⣼⡏⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄       ",
  "       ⠀⠀⠀⠀⠀⠀⢀⣿⠓⠒⠒⠒⠒⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇       ",
  "       ⠀⠀⠀⠀⠀⠀⠸⣿⠒⠒⠒⠒⠒⠀⠀⠴⣶⣶⠖⠒⠒⠀⠰⣶⣶⣶⠒⢺⣧⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⢀⡴⡶⣦⡆⣠⣾⠀⠀⠀⢸⡇       ",
  "       ⠀⠀⠀⠀⠀⠀⢀⣿⣤⡤⠤⣤⡄⠀⠸⡏⠉⠿⡏⣹⠃⢠⢾⠋⢿⠉⣿⢺⣿⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⣿⡣⣢⣿⡿⢿⣄⠀⠀⠀⢸⡇       ",
  "       ⠀⠀⠀⠀⠀⠀⣾⢷⣶⠿⡶⠆⠀⠀⠀⠉⠒⠒⠛⠁⠀⢸⡈⠓⠒⠚⠁⢸⣿⠀⠀⠀⠀⠀⣶⣟⠀⠀⠀⠉⠋⠉⠀⠃⠀⠈⠁⠀⠀⢸⡇       ",
  "       ⠀⠀⠀⠀⠀⠀⣷⠿⢾⡶⠶⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣧⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃       ",
  "       ⠀⠀⠀⠀⠀⠀⢿⡶⢾⡷⠶⠶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠰⠾⠃⠀⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠘⢿⣞⢛⣖⠒⠚⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⢻⡛⠛⠛⠀⠀⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣟⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣄⡀⠀⠀⠀⠀⣠⡼⠋⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⣖⡓⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠓⠛⠋⠉⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠚⠛⠷⠶⣦⣤⣤⡤⠾⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⡾⢿⠾⠶⠀⠀⠀⠀⠀⠀⢸⡏⠛⣟⠻⣶⣤⣀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⠀⠀⢀⣀⣠⣾⣛⣙⣿⣻⣿⣛⠀⠀⠀⠀⠀⠀⢸⣿⣄⠈⢧⣹⣌⡇⠉⡻⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⠀⣤⣾⣛⣿⣤⣈⣷⣼⣿⣄⣿⣳⢦⣄⣀⣀⣀⣀⣠⠞⠛⢦⡈⢿⣿⣿⣿⠃⢠⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⠀⣸⣿⣷⣤⣀⣀⣹⣿⣿⣿⣇⣿⣀⡀⠀⠈⣿⣷⣿⣧⠀⢀⡼⠛⠮⠽⠭⠥⠞⠋⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⠀⢠⣿⣁⣀⣀⡉⠛⠿⠿⠿⠿⠍⠈⠙⠷⠤⣤⣼⣌⣁⢻⣾⠋⠀⠀⠀⠀⠀⠀⢠⡆⠘⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠀⢠⣿⣿⢤⣤⣿⡥⠀⠀⢸⣦⡤⠄⠀⠀⠀⠀⢽⡿⣬⣡⠼⢻⡇⠀⠀⠀⠀⠀⠀⡞⡇⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⢠⣿⢷⡷⠤⢵⣾⠀⠀⠀⢸⡿⡶⡄⠀⠀⠀⠀⢸⡇⢸⣿⡇⢸⡇⠀⠀⠀⠀⠀⢸⡟⠀⠀⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "       ⠾⠓⠺⠗⠚⠛⠛⠀⠀⠀⠸⠿⠟⠛⠋⠀⠀⠀⠸⠇⠸⠿⠇⠸⠇⠀⠀⠀⠀⠀⠼⠅⠀⠀⠼⠿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ",
  "                                                                 ",
  "                       Powered By eovim                       ",
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
local ascii_art_727wysi = {
  "  ⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣤⣤⣤⣶⠀⠀⠀⠀⢀⣴⣾⣿⣿⣷⣦⡀⠀⠀⠀⣀⣀⣀⣤⣤⣤⣤⣤⣤⣆       ",
  "  ⠀⠀⠀⠀⠀⠈⠿⠿⠿⠿⠿⠿⠿⣿⣿⠇⠀⠀⢠⣿⠿⠉⠀⠀⠙⣿⣿⡄⠀⠀⠹⠿⠿⠿⠿⠿⠿⢿⣿⣿       ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⠟        ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠏         ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⣼⣿⡟          ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿           ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇           ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣶⣶⣶⣿⣿⣿⣿⠀⠀⠀⠀⢰⣿⣿⠁           ",
  "  ⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⠇⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠘⠛⠿            ",
  "                                                 ",
  "  ⢲⣿⣿⡀⠀⠀⠀⣰⣦⣤⠀⠀⠀⠀⣿⣿⣶⢶⣿⣿⠀⠀⠀⠀⠀⠀⣼⣶⠀⠀⠀⣠⣶⣿⣿⣿⣶⣦⣀⠀⠀⠀⢸⣿⣶  ",
  "  ⠈⣿⣿⣧⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⣿⣿⠇⠀⣿⣿⣷⠀⠀⠀⠀⣼⣿⠏⠀⠀⣾⣿⡟⠁⠀⠀⠙⣿⣿⠇⠀⠀⢸⣿⣿  ",
  "  ⠀⢻⣿⣿⠀⠀⢠⣿⣿⣿⡇⠀⠀⣸⣿⣿⠀⠀⠈⣿⣿⡆⠀⠀⣼⣿⡟⠀⠀⠀⣿⣿⡀⠀⠀⠀⠀⠈⣿⠀⠀⠀⢸⣿⣿  ",
  "  ⠀⠈⣿⣿⡆⠀⣼⣿⡏⣿⣿⠀⠀⣿⣿⠇⠀⠀⠀⠘⣿⣿⡀⣼⣿⡿⠀⠀⠀⠀⢿⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⢸⣿⣿  ",
  "  ⠀⠀⢻⣿⣿⠀⣿⣿⠀⢸⣿⡇⢀⣿⣿⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣦⠀⠀⠀⢸⣿⣿  ",
  "  ⠀⠀⠀⣿⣿⣰⣿⠇⠀⠀⣿⣿⣸⣿⠃⠀⠀⠀⠀⠀⠀⢹⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣿⣧⠀⠀⢸⣿⣿  ",
  "  ⠀⠀⠀⢻⣿⣿⣿⠀⠀⠀⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢠⣶⠀⠀⠀⠀⠀⠀⣸⣿⣿⠀⠀⢸⣿⣿  ",
  "  ⠀⠀⠀⠀⣿⣿⡃⠀⠀⠀⠸⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⢿⣿⣦⣄⣀⣀⣴⣿⣿⠁⠀⠀⢸⣿⣿  ",
  "  ⠀⠀⠀⠀⠻⠛⠁⠀⠀⠀⠀⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠸⠛⠛⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⠛⠋⠀⠀⠀⠀⠸⠛⠛  ",
  "  ⠀⠀⠀                                            ",
  "               Powered By eovim               ",
}

M.ui = {
  nvdash = {
    load_on_startup = true,
    header = ascii_art_flower,
  },
}

M.plugins = 'custom.plugins'
return M
