--[[ :h "statusline'
This is default statusline value:

```lua
vim.o.statusline = "%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
```

See `:h "statusline'` for more information about statusline.
]]

local devicons = require "nvim-web-devicons"

local h_groups = {
  color_error = "ErrorMsg",
  color_warning = "WarningMsg",
  color_accent = "MoreMsg",
}

local function highlight(group)
  return "%#" .. group .. "#"
end

---@return string
local function lsp_attached()
  local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #attached_clients == 0 then
    return "no lsp attached"
  end
  local names = vim.iter(attached_clients)
      :map(function(client)
        local name = client.name:gsub("language.server", "ls")
        return name
      end)
      :totable()
  return table.concat(names, ", ")
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
    [vim.diagnostic.severity.HINT] = h_groups.color_accent,
    [vim.diagnostic.severity.INFO] = h_groups.color_accent,
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

  return table.concat(status, " ")
end

---@return string
local function file_route()
  local file_name = vim.fn.expand("%:t")
  local work_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t');
  local icon, color = devicons.get_icon_color(file_name, vim.bo.filetype)
  local file_icon = icon or ""
  if file_name ~= "" then
    return work_dir ..
        "%#Statusline# / .. / " ..
        file_name .. " " .. file_icon .. "%#Statusline#"
  end

  return work_dir
end


function _G.statusline()
  return table.concat({
    "%#Statusline#",
    lsp_diagnostics_status(),
    "%=",
    file_route(),
    "%h%w%m%r",
    "%=",
    lsp_attached(),
    " ",
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
