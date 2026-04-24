return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
			c = { "clang-format" },
			css = { "prettierd" },
			go = { "goimports", "gofumpt" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			rust = { "rustfmt" },
			scss = { "prettierd" },
			sh = { "shfmt" },
			svelte = { "prettier" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			yaml = { "prettierd" },
		},
		formatters = {
			prettierd = {
				prefer_local = "node_modules/.bin",
			},
		},
	},
}
