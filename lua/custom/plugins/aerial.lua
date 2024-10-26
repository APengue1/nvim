return {
  {
    'stevearc/aerial.nvim',
    opts = {
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "[a", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = 'Next Aerial' })
        vim.keymap.set("n", "]a", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = 'Previous Aerial' })
      end,
    },
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

      vim.keymap.set("n", "<leader>an", "<cmd>AerialNavToggle<CR>",
        { desc = '[A]erial [N]av Toggle' }
      )

      vim.keymap.set("n", "<leader>ag", "<cmd>AerialGo<CR>",
        { desc = '[A]erial [G]o' }
      )
    end
  }
}

