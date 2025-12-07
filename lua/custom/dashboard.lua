local theme_cycle = require "custom.theme_cycle"
local info = theme_cycle.ensure()

local footer = { "", info.label, "Powered by Neovim" }

if info.secondary and info.secondary ~= info.primary then
  table.insert(footer, 3, "Toggle → " .. info.secondary)
end

vim.g.dashboard_custom_footer = footer
