vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>", { buffer = true, desc = "Run current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { buffer = true, desc = "Run selection" })
