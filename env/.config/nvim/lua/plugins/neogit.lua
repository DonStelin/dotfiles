return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"sindrets/diffview.nvim",
		"m00qek/baleia.nvim",
		"folke/snacks.nvim",
	},
	cmd = "Neogit",
	keys = {
		{
			"<leader>ng",
			function()
				local closed = false
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.bo[buf].filetype == "NeogitStatus" then
						for _, win in ipairs(vim.fn.win_findbuf(buf)) do
							vim.api.nvim_win_close(win, true)
							closed = true
						end
					end
				end
				if not closed then
					vim.cmd("Neogit")
				end
			end,
			desc = "Toggle Neogit UI",
		},
	},
}
