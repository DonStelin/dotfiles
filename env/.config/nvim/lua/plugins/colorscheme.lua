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

		vim.cmd("colorscheme tokyonight-storm")
	end,
}
--
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha",
-- 			transparent_background = true, -- disables setting the background color.
-- 			float = {
-- 				transparent = true, -- enable transparent floating windows
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
--
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			commentStyle = { italic = false },
-- 			keywordStyle = { italic = false },
-- 			statementStyle = { bold = true },
-- 			transparent = true,
-- 		})
-- 		vim.cmd("colorscheme kanagawa-dragon")
-- 	end,
-- }

-- return {
-- 	{
-- 		"rose-pine/neovim",
-- 		name = "rose-pine",
-- 		config = function()
-- 			require("rose-pine").setup({
-- 				styles = {
-- 					bold = true,
-- 					italic = false,
-- 					transparency = true,
-- 				},
-- 			})
--
-- 			vim.cmd("colorscheme rose-pine")
-- 		end,
-- 	},
-- }
