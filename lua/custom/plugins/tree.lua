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

      local tree_api = require "nvim-tree.api"
      local tree_view = require "nvim-tree.view"

      require('which-key').register {
        ['<leader>f'] = { name = '[F]ile Tree', _ = 'which_key_ignore' },
      }
      vim.keymap.set('n', '<leader>ft', tree_api.tree.toggle, { desc = '[F]ile Tree [T]oggle' })
      vim.keymap.set('n', '<leader>ff', tree_api.tree.open, { desc = '[F]ile Tree [F]ocus' })
      vim.keymap.set('n', '<leader>fr', tree_api.tree.reload, { desc = '[F]ile Tree [R]efresh' })
      vim.keymap.set('n', '<leader>fb', tree_api.tree.find_file, { desc = '[F]ile Tree At [B]uffer' })
      vim.keymap.set('n', '<leader>fc',
        function ()
          tree_api.tree.collapse_all(false)
        end,
        { desc = '[F]ile Tree [C]ollapse' }
      )
      vim.keymap.set('n', '<leader>fB',
        function ()
          tree_api.tree.collapse_all(false)
          tree_api.tree.find_file({ open = true, focus = true, })
        end,
        { desc = '[F]ile Tree at [B]uffer, Collapse The Rest' }
      )
      vim.keymap.set('n', '<leader>fC',
        function ()
          tree_api.tree.collapse_all(true)
          tree_api.tree.find_file({ open = true })
        end,
        { desc = '[F]ile Tree [C]ollapse Except Buffers' }
      )
      vim.keymap.set('n', '<leader>f+',
        function ()
          tree_view.resize('+5')
        end,
        { desc = '[F]ile Tree [+] Width' }
      )
      vim.keymap.set('n', '<leader>f-',
        function ()
          tree_view.resize('-5')
        end,
        { desc = '[F]ile Tree [-] Width' }
      )
    end,
  },
}

