local Lazy = {}

function Lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      path,
    })
  end
end

function Lazy.load(p)
  local plugins = p or {}
  Lazy.install(Lazy.path)
  vim.opt.rtp:prepend(Lazy.path)
  require("lazy").setup(plugins, Lazy.opts)
end

Lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
Lazy.opts = {}

Lazy.load({
  -- BASE
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  -- LSP
  "neovim/nvim-lspconfig",
  -- FORMATTERS
  "stevearc/conform.nvim",
  -- FZF
  "ibhagwan/fzf-lua",
  -- TREESITTER
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  -- AUTOCOMPLETE
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  -- OIL
  "stevearc/oil.nvim",
  -- YAZI
  "mikavilpas/yazi.nvim",
  -- GIT
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    }
  },
  "lewis6991/gitsigns.nvim",
  -- UI
  "folke/which-key.nvim",
  "goolord/alpha-nvim",
  "lukas-reineke/indent-blankline.nvim",
  -- MISC
  "windwp/nvim-autopairs",
  "folke/todo-comments.nvim",
  "RRethy/vim-illuminate",
  "ggandor/leap.nvim",
  "folke/persistence.nvim",
  -- THEME
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "skardyy/makurai-nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  }
})

require "plugins.which-key"
require "plugins.treesitter"
require "plugins.cmp"
require "plugins.conform"
require "plugins.devicons"
require "plugins.alpha"
require "plugins.fzf"

-- quick setup
require "gitsigns".setup()
require "nvim-autopairs".setup()
require "oil".setup()
require "leap".create_default_mappings()
require "yazi".setup({
  floating_window_scaling_factor = 1
})
require "illuminate".configure()
require "todo-comments".setup()
require "makurai".setup()
require "persistence".setup()
require "ibl".setup()

-- local
require "plugins.switchfiles"
