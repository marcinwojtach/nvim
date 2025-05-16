local gitsigns = require "gitsigns"
local lsp_utils = require "utils.lsp"
local qf_util = require "utils.quickfix"

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

kset("n", "<Down>", ":horizontal resize -15<CR>", opts({ desc = "Decrease window height" }))
kset("n", "<Up>", ":horizontal resize +15<CR>", opts({ desc = "Increase window height" }))
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

kset("n", "<leader>cf", function() vim.lsp.buf.format() end, opts({ desc = "Format file" }))

-- kset("n", "<Down>", function() Switchfiles.select() end, opts({ desc = "Select similar file" }))
-- kset("n", "<Up", function() Switchfiles.switch() end, opts({ desc = "Switch to similar file" }))

kset("n", "<leader>e", qf_util.toggle_qf, opts({ desc = "Quickfix list" }))

-- OIL
kset("n", "-", "<CMD>Oil<CR>", opts({ desc = "Open parent directory" }))

-- Code action
kset("n", "<leader>ca", vim.lsp.buf.code_action, opts({ desc = "Code Action" }))
kset("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
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

-- File navigation
kset("n", "<leader>f", "<cmd>FzfLua files<CR>", opts({ desc = "Find files" }))
kset("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", opts({ desc = "Grep files" }))
kset("n", "<leader>,", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>", opts({ desc = "Buffers" }))
kset("n", "<leader>m", "<cmd>FzfLua marks<CR>", opts({ desc = "Marks" }))

-- Search
kset("n", "<leader>sj", "<cmd>FzfLua jumps<CR>", opts({ desc = "Jumps" }))
kset("n", "<leader>sr", function() FzfLua.resume() end, opts({ desc = "Resume search" }))
kset("n", "<leader>sR", "<cmd>FzfLua registers<CR>", opts({ desc = "Registers" }))
kset("n", "<leader>sv", "<cmd>FzfLua grep_visual<CR>", opts({ desc = "Grep visual selection" }))
kset("n", "<leader>sw", "<cmd>FzfLua grep_cword<CR>", opts({ desc = "Grep word under cursor" }))
kset("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", opts({ desc = "Document symbols" }))
kset("n", "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts({ desc = "Workspace symbols" }))
kset("n", "<leader>sd", "<cmd>FzfLua lsp_document_diagnostics<CR>", opts({ desc = "Document diagnostics" }))
kset("n", "<leader>sD", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", opts({ desc = "Workspace diagnostics" }))

-- Go to
kset("n", "gr", function() vim.lsp.buf.references(nil, { on_list = lsp_utils.on_list }) end,
  opts({ desc = "Goto References", nowait = true }))
kset("n", "gd", vim.lsp.buf.definition, opts({ desc = "Goto Definition", nowait = true }))
kset("n", "gD", vim.lsp.buf.declaration, opts({ desc = "Goto Declarations", nowait = true }))
kset("n", "gt", vim.lsp.buf.type_definition, opts({ desc = "Goto Type Definitions", nowait = true }))
kset("n", "gi", vim.lsp.buf.implementation, ({ desc = "Goto Implementations", nowait = true }))
kset("n", "go", vim.lsp.buf.outgoing_calls, opts({ desc = "Show Outgoing calls", nowait = true }))
kset("n", "gO", vim.lsp.buf.incoming_calls, opts({ desc = "Show Incoming calls", nowait = true }))
kset("n", "gf", function() vim.lsp.buf.get_locations(nil, { on_list = lsp_utils.on_list }) end,
  opts({ desc = "Show LSP Locations", nowait = true }))

-- GIT
kset("n", "<leader>gg", "<cmd>LazyGit<CR>", opts({ desc = "LazyGit" }))
kset("n", "<leader>ghs", gitsigns.stage_hunk, opts({ desc = "Stage hunk" }))
kset("n", "<leader>ghr", gitsigns.reset_hunk, opts({ desc = "Reset hunk" }))
kset("n", "<leader>ghp", gitsigns.preview_hunk, opts({ desc = "Preview hunk" }))
kset("n", "<leader>ghi", gitsigns.preview_hunk_inline, opts({ desc = "Preview hunk inline" }))
kset("n", "<leader>ghb", gitsigns.blame_line, opts({ desc = "Blame line" }))
kset("n", "<leader>ght", gitsigns.toggle_current_line_blame, opts({ desc = "Toggle line blame" }))
kset("n", "<leader>gc", "<cmd>FzfLua git_bcommits<CR>", opts({ desc = "Git buffer commits" }))
kset("n", "<leader>gs", "<cmd>FzfLua git_stash<CR>", opts({ desc = "Git stash" }))

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

-- UI
kset("n", "<leader>uc", "<cmd>FzfLua colorschemes<CR>", opts({ desc = "Show colorschemes" }))
kset("n", "<leader>uC", "<cmd>FzfLua awesome_colorschemes<CR>", opts({ desc = "Show awesome colorschemes" }))
kset("n", "<leader>uf", function()
  vim.miedziany.statusline.show_full_path = not vim.miedziany.statusline.show_full_path
end, opts({ desc = "Toggle show full path in statusline" }))
