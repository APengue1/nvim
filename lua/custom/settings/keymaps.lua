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
	local remote_url = vim.fn.system("git remote get-url origin 2>/dev/null | sed 's/\\.git//'")

	-- if ssh
	if remote_url:find("@") then
		remote_url = remote_url:gsub([[git@]], ""):gsub(":", "/")
	end

	local head = vim.fn.system('git rev-parse HEAD 2>/dev/null')
	local base_url = remote_url..'/blob/'..head

	-- remove any whitespace from url
	return base_url:gsub("%s+", "")
end

local git_yank_url = function(type)
	return function()
		local url = git_repo_base_url()

		if type == 'file' then
			url = url.."/"..vim.fn.system("git ls-files "..vim.fn.expand("%"))
		end

		if vim.api.nvim_get_mode().mode == 'V' then
			url = url.."#L"..vim.fn.line('v').."-L"..vim.fn.line('.')
		end

		vim.fn.setreg('+', url)
		vim.api.nvim_echo({{url}}, false, {})
		vim.api.nvim_input('<Esc>')
	end
end

vim.keymap.set({'n', 'v'}, "<leader>gk", git_yank_url('file'), { desc = "git yank url/filepath#range" })
vim.keymap.set("n", "<leader>gK", git_yank_url(), { desc = "git yank url" })
