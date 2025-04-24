return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local home = os.getenv("HOME")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.golangci_lint.with({
					extra_args = { "-c", home .. "/.config/golangci/config.yml" },
				}),
			},
		})
	end,
}
