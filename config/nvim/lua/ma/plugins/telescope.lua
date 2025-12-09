local builtin

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'mollerhoj/telescope-recent-files.nvim', 
    },
    keys = {
        { "<C-p>", function()
            require('telescope').extensions['recent-files'].recent_files({})
        end, desc = 'Telescope Recent Files' },
        { "<leader>b", function() builtin.buffers() end, desc = 'Telescope Buffers' },
        { "<leader>:", function() builtin.command_history() end, desc = 'Telescope Command History' },
        { "<leader>/", function() builtin.search_history() end, desc = 'Telescope Search History' },
        { "<leader>man", function() builtin.man_pages() end, desc = 'Telescope Man Pages' },
        { "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, desc = 'Telescope Grep String' },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = 'vertical',
                layout_config = {
                    prompt_position = "top",
                    preview_height = 0.75,
                    mirror = true,
                },
                file_ignore_patterns = {
                    'node_modules',
                    'vendor',
                    'static/lib',
                    '.DS_Store',
                    '.git/',
                },
            },
        }
        telescope.load_extension("recent-files")
        builtin = require('telescope.builtin')
    end,
}
