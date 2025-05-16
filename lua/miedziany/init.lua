local M = {}
local theme = require "miedziany.theme"

M.setup = function()
  vim.cmd('hi clear')


  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'miedziany'

  theme.load()
end

return M
