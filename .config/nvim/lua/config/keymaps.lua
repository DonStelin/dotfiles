local map = vim.keymap.set
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

--  Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffer navigation
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "{", "{zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "}", "}zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "G", "Gzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gg", "ggzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "%", "%zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", "#zz", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Save buffer
vim.api.nvim_set_keymap("n", "<leader>ww", ":lua SaveBuffer()<CR>", { noremap = true, silent = true })
function SaveBuffer()
	if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
		vim.cmd("silent update")
	end
end

-- oil.nvim
-- quit neovim qa! with qq
map("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })

-- Fixing macro recording notifications
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		local msg = string.format("Register:  %s", vim.fn.reg_recording())
		_MACRO_RECORDING_STATUS = true
		vim.notify(msg, vim.log.levels.INFO, {
			title = "Macro Recording",
			keep = function()
				return _MACRO_RECORDING_STATUS
			end,
		})
	end,
	group = vim.api.nvim_create_augroup("NoiceMacroNotfication", { clear = true }),
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		_MACRO_RECORDING_STATUS = false
		vim.notify("Success!", vim.log.levels.INFO, {
			title = "Macro Recording End",
			timeout = 2000,
		})
	end,
	group = vim.api.nvim_create_augroup("NoiceMacroNotficationDismiss", { clear = true }),
})

-- Toggle Copilot
local copilot_state = true
local function toggle_copilot()
	if copilot_state then
		vim.cmd("Copilot disable")
		copilot_state = false
		print("❌ Copilot disabled")
	else
		vim.cmd("Copilot enable")
		copilot_state = true
		print("✅ Copilot enabled")
	end
end

vim.api.nvim_create_user_command("CopilotToggle", toggle_copilot, {})
vim.keymap.set("n", "<leader>cp", toggle_copilot, { desc = "Toggle Copilot" })

-- Toggle Neogit
local function find_neogit_window_id()
	for _, win_id in ipairs(vim.api.nvim_list_wins()) do
		local buf_id = vim.api.nvim_win_get_buf(win_id)
		if vim.api.nvim_buf_is_valid(buf_id) then
			local filetype = vim.api.nvim_buf_get_option(buf_id, "filetype")
			if filetype and string.match(filetype, "^Neogit") then
				return win_id
			end
		end
	end
	return nil
end

local function toggle_neogit()
	local neogit_win_id = find_neogit_window_id()
	if neogit_win_id then
		vim.api.nvim_win_close(neogit_win_id, false)
	else
		vim.cmd("Neogit")
	end
end

vim.keymap.set("n", "<leader>tn", toggle_neogit, { noremap = true, silent = true, desc = "Alternar Neogit" })
