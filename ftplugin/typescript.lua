vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename(nil, { name = "vtsls" }) end,
  { noremap = true, desc = "Rename" })
