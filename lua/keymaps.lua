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

-- local telescope = require "telescope.builtin"
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

kset("n", "<leader>cf", function() vim.lsp.buf.format() end, opts({ desc = "Format file" }))

kset("n", "<Down>", function() Switchfiles.select() end, opts({ desc = "Select similar file" }))
kset("n", "<Up", function() Switchfiles.switch() end, opts({ desc = "Switch to similar file" }))

kset("n", "<leader>e", "<cmd>copen<CR>", opts({ desc = "Quickfix list" }))

-- OIL
kset("n", "-", "<CMD>Oil<CR>", opts({ desc = "Open parent directory" }))

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
kset("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts({ desc = "Goto References" }))
kset("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts({ desc = "Goto Definitions" }))
kset("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts({ desc = "Goto Declarations" }))
kset("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts({ desc = "Goto Type Definitions" }))
kset("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts({ desc = "Goto Implementations" }))
kset("n", "go", "<cmd>FzfLua lsp_outgoing_calls<CR>", opts({ desc = "Show Outgoing calls" }))
kset("n", "gO", "<cmd>FzfLua lsp_incoming_calls<CR>", opts({ desc = "Show Incoming calls" }))
kset("n", "gf", "<cmd>FzfLua lsp_finder<CR>", opts({ desc = "Show LSP Locations" }))

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
