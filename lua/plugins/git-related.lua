local changed_icon = "󰑶"
-- local changed_icon = "|"
local delete_icon = ""
-- local topdelete_icon = "󰘣"

return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				-- See `:help gitsigns.txt`
				signs = {
					add = { text = "+" },
					change = { text = changed_icon },
					delete = { text = delete_icon },
					topdelete = { text = changed_icon },
					changedelete = { text = changed_icon },
				},
				signs_staged = {
					add = { text = "+" },
					change = { text = changed_icon },
					delete = { text = delete_icon },
					topdelete = { text = changed_icon },
					changedelete = { text = changed_icon },
				},
				current_line_blame = true,
			})

			vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns <CR>", opts)
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
		end,
	},
}
