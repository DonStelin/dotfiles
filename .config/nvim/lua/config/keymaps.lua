local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "{", "{zz", { noremap = true, silent = true })
map("n", "}", "}zz", { noremap = true, silent = true })
map("n", "N", "Nzz", { noremap = true, silent = true })
map("n", "n", "nzz", { noremap = true, silent = true })
map("n", "G", "Gzz", { noremap = true, silent = true })
map("n", "gg", "ggzz", { noremap = true, silent = true })
map("n", "<C-i>", "<C-i>zz", { noremap = true, silent = true })
map("n", "<C-o>", "<C-o>zz", { noremap = true, silent = true })
map("n", "%", "%zz", { noremap = true, silent = true })
map("n", "*", "*zz", { noremap = true, silent = true })
map("n", "#", "#zz", { noremap = true, silent = true })

map({ 'n', 'v' }, '<leader>n', ':norm ')

map("n", "<leader>gtr", "<cmd>GoTestFunc<cr>", { desc = "Go Test Run" })
map("n", "<leader>gtc", "<cmd>GoAddTest<cr>", { desc = "Go Add Test" })

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

map("n", "<leader>tn", toggle_neogit, { noremap = true, silent = true, desc = "Alternar Neogit" })
