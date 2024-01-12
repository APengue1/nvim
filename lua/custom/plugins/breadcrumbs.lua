return {
  {
    "SmiteshP/nvim-navic",
    opts = {
      lsp = {
        auto_attach = true,
      },
    },
    config = function(_, opts)
      -- Not sure why we have to explicitly call setup on this function.
      require("nvim-navic").setup(opts)
    end,
  },
  {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
        {"SmiteshP/nvim-navic"},
    },
    config = function()
      -- Not sure why we have to explicitly call setup on this function.
      -- It also does not take an opts parameter.
      require("breadcrumbs").setup()
    end,
  },
}

