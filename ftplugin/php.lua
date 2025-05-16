local treesitter_config = require "plugins.treesitter"

require 'nvim-treesitter.configs'.setup(
  vim.tbl_deep_extend('force', { indent = { enable = true } }, treesitter_config)
)
