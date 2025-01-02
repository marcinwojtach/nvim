return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        pyright = {},
        ts_ls = {
          filetypes = { "javascript" },
        },
        angularls = {},
        intelephense = {},
        html = { filetypes = { "html", "twig", "hbs" } },
        emmet_language_server = {},
        css_variables = {},
        eslint = {},
        lua_ls = {},
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
