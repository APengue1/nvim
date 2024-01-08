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
    end
  }
}
