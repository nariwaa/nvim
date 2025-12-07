local M = {}

local state

local function list_available_themes()
  local themes = {}
  local base46_dir = vim.fn.stdpath "data" .. "/lazy/base46/lua/base46/themes"
  local handle = vim.loop.fs_scandir(base46_dir)

  if handle then
    while true do
      local name = vim.loop.fs_scandir_next(handle)
      if not name then
        break
      end

      if name:sub(-4) == ".lua" then
        local theme = name:sub(1, -5)
        if theme ~= "init" then
          themes[#themes + 1] = theme
        end
      end
    end
  end

  table.sort(themes)

  if #themes == 0 then
    themes = { "onedark" }
  end

  return themes
end

local function copy_list(list)
  local result = {}
  for _, value in ipairs(list) do
    result[#result + 1] = value
  end
  return result
end

local function split_themes()
  local available = list_available_themes()
  local day, night = {}, {}

  local light_markers = { "light", "day", "latte", "dawn", "morning", "lotus", "sunrise" }

  for _, theme in ipairs(available) do
    local lower = theme:lower()
    local is_day = false

    for _, marker in ipairs(light_markers) do
      if lower:find(marker, 1, true) then
        is_day = true
        break
      end
    end

    if is_day then
      day[#day + 1] = theme
    else
      night[#night + 1] = theme
    end
  end

  if #day == 0 then
    day = copy_list(available)
  end

  if #night == 0 then
    night = copy_list(available)
  end

  return day, night
end

local function deterministic_index(pool, phase)
  if #pool == 0 then
    return 1
  end

  local date_key = os.date("%Y-%m-%d") .. ":" .. phase
  local hash = vim.fn.sha256(date_key)
  local num = tonumber(hash:sub(1, 12), 16) or 0

  return (num % #pool) + 1
end

local function current_phase()
  local hour = tonumber(os.date "%H") or 12
  return (hour >= 7 and hour < 19) and "day" or "night"
end

local function compute()
  local phase = current_phase()
  local day_themes, night_themes = split_themes()
  local main_pool = phase == "day" and day_themes or night_themes
  local secondary_pool = phase == "day" and night_themes or day_themes

  local primary_idx = deterministic_index(main_pool, phase)
  local secondary_phase = phase == "day" and "night" or "day"
  local secondary_idx = deterministic_index(secondary_pool, secondary_phase)

  local primary = main_pool[primary_idx]
  local secondary = secondary_pool[secondary_idx]

  if primary == secondary and #secondary_pool > 1 then
    secondary_idx = (secondary_idx % #secondary_pool) + 1
    secondary = secondary_pool[secondary_idx]
  end

  vim.o.background = phase == "day" and "light" or "dark"

  state = {
    primary = primary,
    secondary = secondary,
    phase = phase,
    label = string.format(" %s (%s)", primary, phase),
  }

  vim.g.dynamic_theme_phase = state.phase
  vim.g.dynamic_theme_primary = state.primary
  vim.g.dynamic_theme_secondary = state.secondary
  vim.g.dynamic_theme_label = state.label

  return state
end

function M.ensure()
  if not state then
    compute()
  end
  return state
end

function M.setup()
  local info = compute()
  return info.primary, info.secondary
end

function M.label()
  return M.ensure().label
end

function M.secondary()
  return M.ensure().secondary
end

function M.phase()
  return M.ensure().phase
end

return M
