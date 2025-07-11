return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			opts = {
				ensured_installed = {
					"clangd",
					"volar",
					"lua_ls",
					"gopls",
					"golangci-lint",
					"revive",
					"goimports",
				},
			},
			auto_install = true,
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			-- inlay_hints = {
			-- 	enabled = true,
			-- },
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
							doc = {
								privateName = { "^_" },
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},
				clangd = {
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
					},
				},
				-- gopls = {
				-- 	settings = {
				-- 		gopls = {
				-- 			gofumpt = true,
				-- 			codelenses = {
				-- 				gc_details = false,
				-- 				generate = true,
				-- 				regenerate_cgo = true,
				-- 				run_govulncheck = true,
				-- 				test = true,
				-- 				tidy = true,
				-- 				upgrade_dependency = true,
				-- 				vendor = true,
				-- 			},
				-- 			-- hints = {
				-- 			-- 	assignVariableTypes = true,
				-- 			-- 	compositeLiteralFields = true,
				-- 			-- 	compositeLiteralTypes = true,
				-- 			-- 	constantValues = true,
				-- 			-- 	functionTypeParameters = true,
				-- 			-- 	parameterNames = true,
				-- 			-- 	rangeVariableTypes = true,
				-- 			-- },
				-- 			analyses = {
				-- 				nilness = true,
				-- 				unusedparams = true,
				-- 				unusedwrite = true,
				-- 				useany = true,
				-- 			},
				-- 			usePlaceholders = true,
				-- 			completeUnimported = true,
				-- 			staticcheck = true,
				-- 			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
				-- 			semanticTokens = true,
				-- 		},
				-- 	},
				-- },

				-- ts_ls = {},
				markdown_oxide = {},
				html = {},
				rust_analyzer = {},
				tailwindcss = {},
				bashls = {},
				tinymist = {
					settings = {
						formatterMode = "typstyle",
					},
				},
				volar = {
					init_options = {
						vue = {
							-- disable hybrid mode
							hybridMode = false,
						},
					},
				},
			},
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")

			for server, server_opts in pairs(opts.servers) do
				server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
				lspconfig[server].setup(server_opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local buf = event.buf
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = buf, desc = "LSP: " .. desc })
					end

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})
		end,
	},
}
