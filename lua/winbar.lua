local devicons = require "nvim-web-devicons"

local exclude_filetypes = {
  "oil",
  ""
}

local function is_winbar_excluded()
  if vim.tbl_contains(exclude_filetypes, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  return false
end

---@return string
local function list_lsps()
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
local function workspace()
  local file_name = vim.fn.expand("%:t")
  local file_path = vim.fn.expand("%:f")
  local icon, color = devicons.get_icon_color(file_name, vim.bo.filetype)
  vim.api.nvim_set_hl(0, 'MyFileColor', { fg = color })
  local file_icon = icon or ""
  return "%#MyFileColor#" .. file_icon .. " %#WinBar#" .. file_path
end


local function winbar()
  return table.concat({
    " ",
    workspace(),
    "%h%w%m%r",
    " %=",
    " %=",
    list_lsps(),
    " "
  }, "")
end

local function draw_winbar()
  if is_winbar_excluded() then
    return
  end

  vim.opt_local.winbar = winbar()
end

vim.api.nvim_create_autocmd({
  'BufWinEnter',
  'BufFilePost',
  'BufWritePost'
}, {
  group = vim.api.nvim_create_augroup('my_winbar', { clear = true }),
  callback = function()
    local status_ok, _ =
        pcall(vim.api.nvim_buf_get_var, 0, 'lsp_floating_window')
    if not status_ok then
      draw_winbar()
    end
  end,
})
