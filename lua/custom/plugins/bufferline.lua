return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'ordinal',
        offsets = {
          {
              filetype = "NvimTree",
              text = "File Tree",
              text_align = "center",
              separator = true
          }
        },
      },
    },
    config = function(_, opts)
      vim.opt.termguicolors = true
      require("bufferline").setup(opts)

      local next_buffer = function()
        vim.cmd(':bnext')
      end

      local previous_buffer = function()
        vim.cmd(':bprev')
      end

      local close_current_buffer = function()
        vim.cmd(':bdelete')
        vim.cmd(':bfirst')
      end

      local close_all_buffers = function()
        vim.cmd(':BufferLineCloseOthers')
        vim.cmd(':bdelete')
      end

      require('which-key').register {
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      }

      vim.keymap.set('n', '[b', previous_buffer, { desc = 'Previous buffer' })
      vim.keymap.set('n', ']b', next_buffer, { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>bd', close_current_buffer, { desc = '[B]uffer [D]elete' })
      vim.keymap.set('n', '<leader>bD', close_all_buffers, { desc = '[B]uffer [D]elete All' })
    end
  }
}

