return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	priority = 900,
	config = function()
		-- Filetypes to skip treesitter
		local skip_ft = { "oil", "neo-tree", "lazy", "mason", "help", "qf", "kanban", "" }

		-- Enable highlighting on supported filetypes
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ft = vim.bo.filetype
				-- Skip special filetypes
				for _, skip in ipairs(skip_ft) do
					if ft == skip then
						return
					end
				end
				-- Try to start treesitter
				local lang = vim.treesitter.language.get_lang(ft) or ft
				local ok = pcall(vim.treesitter.language.add, lang)
				if ok then
					pcall(vim.treesitter.start)
				end
			end,
		})
	end,
}
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	lazy = false,
-- 	branch = "main",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local ts = require("nvim-treesitter")
--
-- 		ts.install({
-- 			"bash",
-- 			"c",
-- 			"html",
-- 			"lua",
-- 			"markdown",
-- 			"vim",
-- 			"vimdoc",
-- 			"go",
-- 			"gomod",
-- 			"gosum",
-- 			"gowork",
-- 			"javascript",
-- 			"typescript",
-- 			"tsx",
-- 			"jsdoc",
-- 			"typst",
-- 			"svelte",
-- 		})
--
-- 		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
--
-- 		local ignore_filetypes = {
-- 			"checkhealth",
-- 			"lazy",
-- 			"mason",
-- 			"snacks_dashboard",
-- 			"snacks_notif",
-- 			"snacks_win",
-- 		}
--
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			group = group,
-- 			desc = "Enable treesitter highlighting and indentation",
-- 			callback = function(event)
-- 				if vim.tbl_contains(ignore_filetypes, event.match) then
-- 					return
-- 				end
--
-- 				local lang = vim.treesitter.language.get_lang(event.match) or event.match
-- 				local buf = event.buf
--
-- 				pcall(vim.treesitter.start, buf, lang)
--
-- 				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--
-- 				ts.install({ lang })
-- 			end,
-- 		})
-- 	end,
-- }
