local mason = vim.fn.stdpath("data") .. "/mason"
local ngserver = mason .. "/bin/ngserver"
local project_node_modules = vim.fn.getcwd() .. "/node_modules"
local ngls_node_modules = mason .. "/packages/angular-language-server/node_modules"

local ngserver_cmd = {
  ngserver,
  "--stdio",
  "--tsProbeLocations", project_node_modules, ngls_node_modules,
  "--ngProbeLocations", project_node_modules, ngls_node_modules,
}

return {
  cmd = ngserver_cmd,
  filetypes = { 'typescript', 'html', 'htmlangular', 'typescriptreact' },
  root_markers = { 'angular.json', 'project.json', 'package.json', 'nx.json' },
  on_new_config = function(new_config, new_root_dir)
    local local_node = new_root_dir .. "/node_modules"
    if vim.fn.isdirectory(local_node) == 1 then
      new_config.cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations", local_node,
        "--ngProbeLocations", local_node
      }
    end
  end,
  capabilities = {
    textDocument = {
      rename = vim.NIL
    }
  }
}
