return {
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function(_, opts)
      require('aerial').setup(opts)

      require('which-key').register {
        ['<leader>a'] = { name = '[A]erial', _ = 'which_key_ignore' },
      }
      vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>",
        { desc = '[A]erial [T]oggle' }
      )
    end
  }
}

