return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			transparent_mode = true,
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_enable_italic = true
	--
	-- 		vim.g.gruvbox_material_transparent_background = 2
	--
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },

	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd([[colorscheme tokyodark]])
		end,
	},
	-- {
	-- 	"dgox16/oldworld.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("oldworld")
	-- 	end,
	-- },
	--
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	lazy = false,
	-- 	priority = 10000,
	-- },

	--  {
	--  	"AetherSyscall/AetherAmethyst.nvim",
	--  	priority = 1000,
	--  	config = function()
	--  		require("aetheramethyst").setup({
	--  			transparent = true, -- Enable transparent background
	--  			styles = {
	--  				comments = { italic = true },
	--  				keywords = { italic = true },
	--  				functions = { bold = true },
	--  				variables = {},
	--  			},
	--  		})
	-- --
	--  		-- Load the variant: 'eclipse' (dark) or 'bliss' (light)
	--  		vim.cmd("colorscheme aetheramethyst-eclipse")
	--  	end,
	--  }
}
