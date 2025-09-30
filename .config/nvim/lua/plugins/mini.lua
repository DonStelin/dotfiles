return {
	{ "echasnovski/mini.ai", version = false, config = true },
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
}
