local servers = require 'lsp.servers'
local mason_installer = require "mason-tool-installer"

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true

mason_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local is_custom_settings, custom_server_settings = pcall(require, 'lsp.settings.' .. server)
  if is_custom_settings then
    vim.lsp.config(server, custom_server_settings)
  end
  vim.lsp.enable(server)
end

vim.api.nvim_create_user_command('LspCheckhealth', function()
  vim.cmd ':silent :vertical checkhealth vim.lsp'
end, {})

vim.lsp.inlay_hint.enable(true);
