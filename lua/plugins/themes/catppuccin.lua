return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local opts = { noremap = true, silent = true }
		local config = {
			flavour = "Macchiato",
			transparent_background = true,
		}
		local theme = require("catppuccin")
		local toggle_theme = function()
			config.transparent_background = not config.transparent_background
			theme.setup(config)
			vim.cmd.colorscheme("catppuccin")
		end

		theme.setup(config)

		vim.keymap.set("n", "<leader>bg", toggle_theme, opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
