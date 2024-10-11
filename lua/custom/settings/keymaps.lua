-- Move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move cursor when doing J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor middle of screen when scrolling up or down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Keep cursor middle of screen when searching next or previous
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep clipboard buffer untouched when pasting
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Keep clipboard when [P]asting" })

-- Use system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })

vim.keymap.set("n", "Q", "<nop>")

-- Make current file executable
vim.keymap.set(
	"n", "<leader>x", "<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "Chmod +[x] current file" }
)

-- Replace word behind cursor
vim.keymap.set(
	"n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>",
	{ desc = "[R]eplace" }
)

local git_repo_base_url = function()
	local http_remote_url = vim.fn.system("git remote get-url origin 2>/dev/null | sed 's/\\.git//'")

	-- if ssh
	if (http_remote_url:find("@")) then
		http_remote_url = http_remote_url:gsub([[git@]], ""):gsub(":", "/")
	end

	local head_commit = vim.fn.system('git rev-parse HEAD 2>/dev/null')
	local base_url = http_remote_url..'/blob/'..head_commit

	-- remove any whitespace from url
	base_url = base_url:gsub("%s+", "")

	vim.fn.setreg('+', base_url)
	return base_url
end

local git_repo_file_url = function()
	local base_url = git_repo_base_url()

	local buffer_relative_path = vim.fn.expand('%')
	local git_relative_path = vim.fn.system("git ls-files "..buffer_relative_path)
	local url_with_file = base_url..'/'..git_relative_path

	vim.fn.setreg('+', url_with_file)
	return url_with_file
end

local git_repo_file_url_range = function()
	local url_with_file = git_repo_file_url()
	local range_start = vim.fn.line('v')
	local range_end = vim.fn.line('.')

	local url_with_file_range = url_with_file..'#L'..range_start..'-L'..range_end

	vim.fn.setreg('+', url_with_file_range)
	vim.api.nvim_input('<Esc>')
end

vim.keymap.set("n", "<leader>gk", git_repo_file_url, { desc = "git url file" })
vim.keymap.set("n", "<leader>gK", git_repo_base_url, { desc = "git url base" })
vim.keymap.set("v", "<leader>gk", git_repo_file_url_range, { desc = "git url selection" })
