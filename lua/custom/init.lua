local theme_cycle = require "custom.theme_cycle"

if vim.lsp and vim.lsp.get_clients and vim.lsp.get_active_clients then
  local original = vim.lsp.get_active_clients
  vim.lsp.get_active_clients = function(opts)
    return vim.lsp.get_clients(opts) or original(opts)
  end
end

if vim.g.dynamic_theme_label then
  local group = vim.api.nvim_create_augroup("CustomDynamicThemeBanner", { clear = true })

  vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    pattern = "NvimTree",
    callback = function(args)
      if vim.api.nvim_buf_get_option(args.buf, "filetype") ~= "NvimTree" then
        return
      end

      local label = " " .. (theme_cycle.label() or "") .. " "
      vim.api.nvim_set_option_value("winbar", label, { scope = "local", win = args.win })
    end,
  })

  vim.api.nvim_create_autocmd("BufWinLeave", {
    group = group,
    pattern = "NvimTree",
    callback = function(args)
      if vim.api.nvim_buf_get_option(args.buf, "filetype") ~= "NvimTree" then
        return
      end

      vim.api.nvim_set_option_value("winbar", "", { scope = "local", win = args.win })
    end,
  })
end
