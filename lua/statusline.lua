--[[ :h "statusline'
This is default statusline value:

```lua
vim.o.statusline = "%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
```

See `:h "statusline'` for more information about statusline.
]]

local devicons = require "nvim-web-devicons"

local h_groups = {
  color_error = "DiagnosticError",
  color_warning = "DiagnosticWarn",
  color_info = "DiagnosticInfo",
  color_hint = "DiagnosticHint",
}

---@return string
local function highlight(group)
  return "%#" .. group .. "#"
end

--- @return string
local function git_branch()
  local branch = vim.b.gitsigns_head

  if branch == '' or branch == nil then
    return ''
  end

  local icon, color = devicons.get_icon_color("git", "git")
  vim.api.nvim_set_hl(0, 'MyGitIcon', { fg = color })
  local git_icon = icon or ""

  return "%#MyGitIcon#" .. git_icon .. " " .. string.format('%%#StatusLineMedium#%s%%*', branch)
end

---@return string
local function lsp_diagnostics_status()
  local all_diagnostics = vim.diagnostic.get(0)

  if (not all_diagnostics or #all_diagnostics == 0) then
    return ""
  end

  local issues = {
    [vim.diagnostic.severity.ERROR] = 0,
    [vim.diagnostic.severity.WARN] = 0,
    [vim.diagnostic.severity.HINT] = 0,
    [vim.diagnostic.severity.INFO] = 0
  }
  local color_groups = {
    [vim.diagnostic.severity.ERROR] = h_groups.color_error,
    [vim.diagnostic.severity.WARN] = h_groups.color_warning,
    [vim.diagnostic.severity.HINT] = h_groups.color_hint,
    [vim.diagnostic.severity.INFO] = h_groups.color_info,
  }

  local status = { "" }

  for _, diagnostic in ipairs(all_diagnostics) do
    issues[diagnostic.severity] = issues[diagnostic.severity] + 1
  end

  for diag, count in ipairs(issues) do
    if count > 0 then
      table.insert(status, highlight(color_groups[diag]) .. "[" .. count .. "]")
    end
  end

  return table.concat(status, " ") .. "%#Statusline#"
end

function _G.statusline()
  return table.concat({
    "%#Statusline#",
    lsp_diagnostics_status(),
    "%=",
    git_branch(),
    "%=",
    "%l,%c",
    "%P",
    " ",
  }, " ")
end

vim.o.statusline = "%{%v:lua._G.statusline()%}"

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  pattern = "*",
  callback = lsp_diagnostics_status,
})
