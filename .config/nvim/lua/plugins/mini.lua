return {
	{ "echasnovski/mini.ai", version = false, config = true },
	{
		"nvim-mini/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
}
