local wk = require 'which-key'

wk.setup({
  preset = 'helix',
  win = {
    padding = { 1, 3 },
    wo = {
      winblend = 0,
    },
  }
})

wk.add({
  { "<leader>1",  group = "Yazi" },
  { "<leader>s",  group = "Search / Show" },
  { "<leader>g",  group = "Git" },
  { "<leader>gh", group = "Hunks" },
  { "<leader>w",  group = "Window" },
  { "<leader>b",  group = "Buffers" },
  { "<leader>c",  group = "Code Action" },
  { "<leader>q",  group = "Session" },
  { "<leader>u",  group = "UI" },
})
