require "conform".setup({
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
