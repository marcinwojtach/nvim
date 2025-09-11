require "conform".setup({
  format_on_save = function(bufnr)
    return;
    -- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    --   return
    -- end
    -- return {
    --   timeout_ms = 500,
    --   lsp_format = "fallback",
    -- }
  end,
  notify_no_formatters = true,
  notify_on_error = true,
  formatters_by_ft = {
    markdown = { "markdownlint" },
    json = { "jsonlint", "prettierd" },
    dockerfile = { "hadolint" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    go = { "gofmt", "golines", "goimports", "golangci", "golangci_lint_ls", "golangci-lint" },
    html = { "htmlbeautifier", "htmlhint" },
    templ = { "templ" },
    php = { "pint", "php_cs_fixer" }
  },
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true }),
--   pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
--   command = "silent! EslintFixAll",
-- })
