require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.themes.catppuccin"),
	require("plugins.whichkey"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.autoformat"),
	require("plugins.autocompletion"),
	require("plugins.lazygit"),
	require("plugins.gitsigns"),
	require("plugins.plugins"),
	require("plugins.rainbow-delimiters"),
	require("plugins.hover"),
	require("plugins.lsp.lsp"),
	require("plugins.lsp.typescript-tools"),
	require("plugins.higlight-colors"),
	require("plugins.noice-cmdline"),
	require("plugins.move"),
	require("plugins.smear"),
})
