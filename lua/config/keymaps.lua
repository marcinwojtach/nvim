-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- delete single char without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", vim.tbl_extend("force", opts, { desc = "Replace word under the cursor" }))

-- press jk fast to exit insert mode
-- vim.keymap.set("i", "jk", "<ESC>", opts)
-- vim.keymap.set("i", "kj", "<ESC>", opts)

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)

-- resize windows
vim.keymap.set("n", "<Up>", ":resize +20<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize -20<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +20<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -20<CR>", opts)

-- commenting
vim.keymap.set("n", "gcd", "yygccp", { remap = true, silent = true, desc = "Duplicate line and comment out the first" })
