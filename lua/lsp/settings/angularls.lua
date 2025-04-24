local ok, util = pcall(require, 'lspconfig.util')
if not ok then
  vim.notify 'lspconfig.util could not be loaded'
  return
end

local config = {
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      new_root_dir,
      "--ngProbeLocations",
      new_root_dir,
    }
  end,
  root_dir = function(fname)
    return util.root_pattern(
      "angular.json",
      "workspace.json",
      "nx.json",
      "package.json",
      "tsconfig.base.json"
    )(fname)
  end,
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
}

return config
