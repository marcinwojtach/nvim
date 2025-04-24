local lspconfig = require 'lspconfig'
local servers = require 'lsp.servers'

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}

function M.on_attach(client, bufnr)
  client.inlay_hints = {
    enabled = true,
  }

  if client.name == "angularls" then
    client.server_capabilities.renameProvider = false
  end
end

for _, server in pairs(servers) do
  local server_opts = {
    on_attach = M.on_attach,
  }

  local is_custom_settings, custom_server_settings = pcall(require, 'lsp.settings.' .. server)
  if is_custom_settings then
    server_opts = vim.tbl_deep_extend('force', server_opts, custom_server_settings)
  end

  lspconfig[server].setup(server_opts)
end

vim.api.nvim_create_user_command('LspCheckhealth', function()
  vim.cmd ':silent :vertical checkhealth vim.lsp'
end, {})
