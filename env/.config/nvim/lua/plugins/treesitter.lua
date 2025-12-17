return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"bash",
			"c",
			"html",
			"lua",
			"markdown",
			"vim",
			"vimdoc",
			"go",
			"gomod",
			"gosum",
			"gowork",
			"javascript",
			"typescript",
			"tsx",
			"jsdoc",
			"typst",
		})

		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

		local ignore_filetypes = {
			"checkhealth",
			"lazy",
			"mason",
			"snacks_dashboard",
			"snacks_notif",
			"snacks_win",
		}

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting and indentation",
			callback = function(event)
				if vim.tbl_contains(ignore_filetypes, event.match) then
					return
				end

				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				pcall(vim.treesitter.start, buf, lang)

				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				ts.install({ lang })
			end,
		})
	end,
}
