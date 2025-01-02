return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      term_colors = true,
      transparent_background = false,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = true,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        styles = {
          transparency = false,
        },
      })
    end,
  },
  { "EdenEast/nightfox.nvim", name = "nightfox", lazy = true, priority = 1000 },
}
