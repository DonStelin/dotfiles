return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local filetypes = {
				"bash",
				"c",
				"diff",
				"go",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"svelte",
				"css",
				"javascript",
				"latex",
				"scss",
				"svelte",
				"tsx",
				"typst",
				"vue",
				"vimdoc",
			}

			require("nvim-treesitter").install(filetypes)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			-- put your config here
		end,
	},
}
