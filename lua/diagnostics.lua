local lsp_util = require "utils.lsp"

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
    severity = {
      min = vim.diagnostic.severity.WARN
    }
  },
  signs = {
    text = lsp_util.signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    focus = false,
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
})
