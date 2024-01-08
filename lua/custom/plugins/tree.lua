return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      end
    },
    config = function(_, opts)
      -- Required for nvim-tree
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true

      require("nvim-tree").setup(opts)
      local nvim_tree_api = require "nvim-tree.api"
      vim.keymap.set('n', '<leader>f', nvim_tree_api.tree.toggle, { desc = '[F]ile Tree Toggle' })
    end,
  },
}

