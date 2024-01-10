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

      vim.keymap.set('n', '<A-[>', previous_buffer, { desc = 'Previous buffer' })
      vim.keymap.set('n', '<A-]>', next_buffer, { desc = 'Next buffer' })
      vim.keymap.set('n', '<A-\\>', close_current_buffer, { desc = 'Close buffer' })
      vim.keymap.set('n', '<A-BS>', close_all_buffers, { desc = 'Close all buffers' })
    end
  }
}

