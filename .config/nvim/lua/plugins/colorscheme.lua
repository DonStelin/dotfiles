return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},

	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
