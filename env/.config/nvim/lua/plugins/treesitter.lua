return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
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
				"tsx",
				"typst",
				"vue",
				"vimdoc",
			}

			require("nvim-treesitter").install(filetypes)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
				end,
			})
		end,
	},
}
