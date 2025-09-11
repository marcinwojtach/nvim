local ok, util = pcall(require, 'lspconfig.util')
if not ok then
  vim.notify 'lspconfig.util could not be loaded'
  return
end

local function get_probe_dir(root_dir)
  local project_root = vim.fs.dirname(vim.fs.find('node_modules', { path = root_dir, upward = true })[1])

  return project_root and (project_root .. '/node_modules') or ''
end

local config = {
  on_new_config = function(new_config, new_root_dir)
    local probe_dir= get_probe_dir(new_root_dir)
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      probe_dir,
      "--ngProbeLocations",
      probe_dir,
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
