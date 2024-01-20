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

