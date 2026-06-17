vim.pack.add({
  -- BASE
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  -- LSP
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  -- FORMATTERS
  "https://github.com/stevearc/conform.nvim",
  -- FZF
  "https://github.com/ibhagwan/fzf-lua",
  -- QUICKFIX
  "https://github.com/kevinhwang91/nvim-bqf",
  -- AUTOCOMPLETE
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/mikavilpas/yazi.nvim",
  -- GIT
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  -- UI
  "https://github.com/folke/which-key.nvim",
  "https://github.com/goolord/alpha-nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  -- MISC
  "https://github.com/karb94/neoscroll.nvim",
  "https://github.com/tris203/precognition.nvim",
  "https://github.com/echasnovski/mini.snippets",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/RRethy/vim-illuminate",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/catgoose/nvim-colorizer.lua",
  "https://github.com/EvWilson/spelunk.nvim",
  "https://github.com/smoka7/hop.nvim",
  "https://github.com/kungfusheep/mfd.nvim",
  "https://github.com/oneslash/helix-nvim",
  "https://github.com/savq/melange-nvim",
  "https://github.com/Shatur/neovim-ayu",
  "https://github.com/RRethy/base16-nvim",
  "https://github.com/zenbones-theme/zenbones.nvim",
  "https://github.com/skardyy/makurai-nvim",
  -- AI
  "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require "plugins.which-key"
require "plugins.cmp"
require "plugins.conform"
require "plugins.devicons"
require "plugins.alpha"
require "plugins.fzf"
require "plugins.bqf"
require "plugins.ai"

-- quick setup
require "gitsigns".setup({
  current_line_blame = true,
})
require "nvim-autopairs".setup()
require "oil".setup()
require "yazi".setup({
  floating_window_scaling_factor = 1
})
require "illuminate".configure()
require "todo-comments".setup()
require "persistence".setup()
require "ibl".setup()
require "colorizer".setup()
require "mason".setup()
require "spelunk".setup({
  enable_persist = true
})
require "hop".setup { keys = "etovxqpdygfblzhckisuran" }

-- local
require "plugins.switchfiles"
