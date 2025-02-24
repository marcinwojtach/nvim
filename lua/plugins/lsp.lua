return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = { filetypes = { "html", "twig", "hbs" } },
        emmet_language_server = {},
        css_variables = {},
        vtsls = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "project-relative",
                importModuleSpecifierPreference = "relative",
                importModuleSpecifierEnding = "minimal",
              },
            },
          },
        },
        -- angularls = {
        --   filetypes = { "typescript", "html", "angular" },
        --   root_dir = function(fname)
        --     return require("lspconfig.util").root_pattern(
        --       "angular.json",
        --       "workspace.json",
        --       "nx.json",
        --       "package.json",
        --       "tsconfig.base.json"
        --     )(fname)
        --   end,
        --   on_new_config = function(new_config, new_root_dir)
        --     new_config.cmd = {
        --       "ngserver",
        --       "--stdio",
        --       "--tsProbeLocations",
        --       new_root_dir,
        --       "--ngProbeLocations",
        --       new_root_dir,
        --     }
        --   end,
        -- },
      },
    },
  },
}
