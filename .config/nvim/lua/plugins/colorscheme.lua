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
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		vim.cmd("colorscheme tokyonight")
	end,
}

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		name = "catppuccin",
-- 		priority = 1000,
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				flavour = "mocha",
-- 				transparent_background = true,
-- 				blink_cmp = true,
-- 			})
-- 			vim.cmd.colorscheme("catppuccin")
-- 		end,
-- 	},
-- }
