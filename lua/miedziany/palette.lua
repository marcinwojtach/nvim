---@class Miedziany.Palette
---@field bg string
---@field fg string
---@field surface string
---@field surface_alt string
---@field comment string
---@field selection string
---@field border string
---@field line string
---@field guide string
---@field error string
---@field warning string
---@field normal string
---@field insert string
---@field visual string
---@field miedziany string

local M = {}

---@type Miedziany.Palette
M.p = {
  bg = "#15161B",
  fg = "#F7F7F7",
  surface = "#15161B",
  surface_alt = "#1B1C21",
  comment = "#5C6773",
  selection = "#264F78",
  border = "#A6ACCD",
  line = "#25282E",
  guide = "#2D3640",
  error = "#FF5555",
  warning = "#FF7733",
  normal = "#82AAFF",
  insert = "#95FB79",
  visual = "#FFEE99",
  miedziany = "#A56040",
}

return M
