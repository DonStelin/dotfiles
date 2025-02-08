return {
	{
		"m4xshen/autoclose.nvim",
		opts = {
			options = {
				disabled_filetypes = { "text" },
				pair_spaces = true,
			},
			keys = {
				["'"] = {
					escape = true,
					close = true,
					pair = "''",
					disabled_filetypes = { "markdown" },
				},
				["`"] = { escape = false, close = true, pair = "``" },
				[">"] = { escape = false, close = false, pair = "><" },
			},
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
}
