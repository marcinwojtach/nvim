local function filterDuplicates(array)
  local uniqueArray = {}
  for _, tableA in ipairs(array) do
    local isDuplicate = false
    for _, tableB in ipairs(uniqueArray) do
      if vim.deep_equal(tableA, tableB) then
        isDuplicate = true
        break
      end
    end
    if not isDuplicate then
      table.insert(uniqueArray, tableA)
    end
  end
  return uniqueArray
end

local function on_list(options)
  options.items = filterDuplicates(options.items)
  vim.fn.setqflist({}, ' ', options)
  vim.cmd('botright copen')
end

local telescope = require "telescope.builtin"
local wk = require("which-key")
local gitsigns = require "gitsigns"

local default_opts = { noremap = true, silent = true }
local kset = vim.keymap.set

local function opts(extends)
  local tbl = extends or {}
  return vim.tbl_deep_extend('force', tbl, default_opts)
end

kset("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts({ desc = "Save without formatting" }))

kset("n", "x", '"_x', default_opts)

kset("v", "<", "<gv", default_opts)
kset("v", ">", ">gv", default_opts)

kset("n", "<C-d>", "<C-d>zz", opts({ desc = "Scroll down and center" }))
kset("n", "<C-u>", "<C-u>zz", opts({ desc = "Scroll up and center" }))

kset("n", "n", "nzzzv", opts({ desc = "Find next and center" }))
kset("n", "N", "Nzzzv", opts({ desc = "Find previous and center" }))

kset("n", "<Left>", ":vertical resize -15<CR>", opts({ desc = "Decrease window width" }))
kset("n", "<Right>", ":vertical resize +15<CR>", opts({ desc = "Increase window width" }))

kset("n", "<Tab>", ":bnext<CR>", opts({ desc = "Next buffer" }))
kset("n", "<S-Tab>", ":bprevious<CR>", opts({ desc = "Previous buffer" }))
kset("n", "<leader>bd", ":bdelete<CR>", opts({ desc = "Delete buffer" }))
kset("n", "<leader>bo", ":%bd|e#<CR>", opts({ desc = "Delete other buffers" }))

kset("v", "p", '"_dP', opts({ desc = "Keep last yanked when pasting" }))

kset("n", "<S-A-j>", "<cmd>execute 'move .+' . v:count1<CR>==", opts({ desc = "Move Down" }))
kset("n", "<S-A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", opts({ desc = "Move Up" }))
kset("i", "<S-A-j>", "<esc><cmd>m .+1<CR>==gi", opts({ desc = "Move Down" }))
kset("i", "<S-A-k>", "<esc><cmd>m .-2<CR>==gi", opts({ desc = "Move Up" }))
kset("v", "<S-A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", opts({ desc = "Move Down" }))
kset("v", "<S-A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", opts({ desc = "Move Up" }))

kset("n", "<leader>n", "<cmd>messages<CR>", opts({ desc = "Show messages" }))

kset("n", "<leader>cf", function() vim.lsp.buf.format() end, opts({ desc = "Format file" }))

kset("n", "<Down>", function() Switchfiles.select() end, opts({ desc = "Select similar file" }))
kset("n", "<Up", function() Switchfiles.switch() end, opts({ desc = "Switch to similar file" }))

kset("n", "<leader>e", "<cmd>copen<CR>", opts({ desc = "Quickfix list" }))

-- OIL
kset("n", "-", "<CMD>Oil<CR>", opts({ desc = "Open parent directory" }))

-- TELESCOPE
kset("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts({ desc = "Find files" }))
kset("n", "<leader><leader>", "<cmd>Telescope live_grep<CR>", opts({ desc = "Live grep" }))
kset("n", "<leader>,", "<cmd>Telescope buffers<CR>", opts({ desc = "Buffers" }))
kset("n", "<leader>gf", "<cmd>Telescope git_files<CR>", opts({ desc = "Find Files (git-files)" }))
kset("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts({ desc = "Git commits" }))
kset("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", opts({ desc = "Keymaps" }))
kset("n", "<leader>sR", "<cmd>Telescope registers<CR>", opts({ desc = "Registers" }))
kset("n", "<leader>sm", "<cmd>Telescope marks<CR>", opts({ desc = "Marks" }))
kset("n", "<leader>ss", function() telescope.lsp_document_symbols() end,
  opts({ desc = "Goto Symbol" }))
kset("n", "<leader>sr", "<cmd>Telescope resume<CR>", opts({ desc = "Resume previous search" }))
kset("n", "<leader>sj", "<cmd>Telescope jumplist<CR>", opts({ desc = "Jumplist" }))
kset("n", "<leader>sfp", function() vim.notify(vim.fn.expand("%:p")) end, opts({ desc = "Show full file path" }))

-- LSP
kset("n", "gd", function() telescope.lsp_definitions() end, opts({ desc = "Goto Definition" }))
kset("n", "gr", function() telescope.lsp_references(nil, { on_list = on_list, include_declaration = false }) end,
  opts({ desc = "Goto References" }))
kset("n", "gI", function() telescope.lsp_implementations({ reuse_win = true }) end,
  opts({ desc = "Goto Implementation" }))
kset("n", "gD", vim.lsp.buf.declaration, opts({ desc = "Goto Declaration" }))
kset("n", "K", function() return vim.lsp.buf.hover() end, opts({ desc = "Hover" }))
kset("n", "gS", function() return vim.lsp.buf.signature_help() end, opts({ desc = "Goto Signature help" }))

-- Code action
kset("n", "<leader>ca", vim.lsp.buf.code_action, opts({ desc = "Code Action" }))
kset("n", "<leader>cr", vim.lsp.buf.rename, opts({ desc = "Rename" }))
kset("n", "<leader>co",
  function()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" }, diagnostics = {} },
      apply = true,
    })
    vim.wait(100)
  end,
  opts({ desc = "Organize Imports" })
)
kset("n", "<leader>cd", vim.diagnostic.open_float, opts({ desc = "Show Line Diagnostics" }))
kset("n", "<leader>cD", function() telescope.diagnostics({ bufnr = 0 }) end, opts({ desc = "Show Buffer Diagnostics" }))

-- GIT
kset("n", "<leader>gg", "<cmd>LazyGit<CR>", opts({ desc = "LazyGit" }))
kset("n", "<leader>ghs", gitsigns.stage_hunk, opts({ desc = "Stage hunk" }))
kset("n", "<leader>ghr", gitsigns.reset_hunk, opts({ desc = "Reset hunk" }))
kset("n", "<leader>ghp", gitsigns.preview_hunk, opts({ desc = "Preview hunk" }))
kset("n", "<leader>ghi", gitsigns.preview_hunk_inline, opts({ desc = "Preview hunk inline" }))
kset("n", "<leader>ghb", gitsigns.blame_line, opts({ desc = "Blame line" }))
kset("n", "<leader>ght", gitsigns.toggle_current_line_blame, opts({ desc = "Toggle line blame" }))

-- YAZI
kset("n", "<leader>1", "<cmd>Yazi<CR>", opts({ desc = "Yazi - current file" }))
kset("n", "<leader>2", "<cmd>Yazi cwd<CR>", opts({ desc = "Yazi - nvim working directory" }))
kset("n", "<leader>3", "<cmd>Yazi toggle<CR>", opts({ desc = "Yazi - resume" }))

-- PERSISTENCE
kset("n", "<leader>qs", function() require("persistence").load() end,
  opts({ desc = "Load session for current directory" }))
kset("n", "<leader>qS", function() require("persistence").select() end, opts({ desc = "Select a session to load" }))
kset("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
  opts({ desc = "Load the last session" }))


wk.add({
  { "<leader>1",  group = "Yazi" },
  { "<leader>s",  group = "Search / Show" },
  { "<leader>g",  group = "Git" },
  { "<leader>gh", group = "Hunks" },
  { "<leader>w",  group = "Window" },
  { "<leader>b",  group = "Buffers" },
  { "<leader>c",  group = "Code Action" },
  { "<leader>q",  group = "Session" },
})
