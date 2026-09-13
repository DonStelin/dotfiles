-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
--
-- 			styles = {
-- 				-- bold = true,
-- 				-- italic = true,
-- 				transparency = true,
-- 			},
-- 		})
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
--
return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			variant = "muted",
			transparent = true,
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
