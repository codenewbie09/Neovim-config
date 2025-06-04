return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'
        local themes = require 'telescope.themes'
        local builtin = require 'telescope.builtin'

        telescope.setup {
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                path_display = { 'smart' },
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = { width = 0.9, preview_cutoff = 120 },
                },
                sorting_strategy = 'ascending',
                winblend = 6,
                border = true,
                borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-l>'] = actions.select_default,
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                },
                live_grep = {
                    file_ignore_patterns = { 'node_modules', '.git', '.venv' },
                    additional_args = function()
                        return { '--hidden' }
                    end,
                },
                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                    theme = 'dropdown',
                },
            },
            extensions = {
                ['ui-select'] = themes.get_dropdown {},
            },
        }

        -- Load extensions
        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')

        -- Keymaps
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        map('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
        map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
        map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })

        -- Live grep in open buffers
        map('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Buffers',
            }
        end, { desc = '[S]earch [/] Open Buffers' })

        -- Fuzzy find in current buffer
        map('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown {
                previewer = false,
            })
        end, { desc = '[/] Fuzzy Find in Buffer' })
    end,
}
