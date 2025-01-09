return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = { filetypes = { "html", "twig", "hbs" } },
        emmet_language_server = {},
        -- emmet_ls = {},
        css_variables = {},
      },
    },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
}
