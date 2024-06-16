return {
  {
    "Pocco81/true-zen.nvim",
    opts = {
      integrations = {
        tmux = true,
      },
    },

    config = function(_, opts)
      require("true-zen").setup(opts)

      vim.api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
      vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
    end
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = false },
      },
    },

    config = function(_, opts)
      require("zen-mode").setup(opts)

      vim.api.nvim_set_keymap("n", "<leader>zz", ":ZenMode<CR>", {})
    end
  },
}
