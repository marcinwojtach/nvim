require "conform".setup({
  notify_no_formatters = true,
  notify_on_error = true,
  formatters_by_ft = {
    markdown = { "markdownlint" },
    json = { "jsonlint", "prettierd" },
    dockerfile = { "hadolint" },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    go = { "gofmt", "golines", "goimports", "golangci", "golangci_lint_ls", "golangci-lint" },
    html = { "htmlbeautifier", "htmlhint" },
    templ = { "templ" },
    php = { "pint", "php_cs_fixer" },
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    ["_"] = { "trim_whitespace" },
  },
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_format = "fallback",
  -- },
})
