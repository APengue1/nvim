return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
        local harpoon = require("harpoon")
        harpoon:setup(opts)

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        require('which-key').register {
            ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
        }

        vim.keymap.set("n", "<leader>sx", function()
                toggle_telescope(harpoon:list())
            end,
            { desc = "Open harpoon window" }
        )

        vim.keymap.set("n", "<leader>hx", function()
            harpoon:list():append()
            end,
            { desc = "Harpoon the buffer" }
        )
        vim.keymap.set("n", "<leader>ht", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            { desc = "Harpoon toggle window" }
        )

        vim.keymap.set("n", "<leader>hh", function()
            harpoon:list():select(1)
            end,
            { desc = "Harpoon select 1st window" }
        )
        vim.keymap.set("n", "<leader>hj", function()
            harpoon:list():select(2)
            end,
            { desc = "Harpoon select 2nd window" }
        )
        vim.keymap.set("n", "<leader>hk", function()
            harpoon:list():select(3)
            end,
            { desc = "Harpoon select 3rd window" }
        )
        vim.keymap.set("n", "<leader>hl", function()
            harpoon:list():select(4)
            end,
            { desc = "Harpoon select 4th window" }
        )

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "H", function()
            harpoon:list():prev()
            end,
            { desc = "Harpoon previous window" }
        )
        vim.keymap.set("n", "L", function()
            harpoon:list():next()
            end,
            { desc = "Harpoon next window" }
        )
    end,
}

