return {
  --[[ {
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = 'dark',
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      vim.cmd.colorscheme 'onedark'
    end,
  }, ]]
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night"
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight'
    end,
  }
}

