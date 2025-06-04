return {
    'nvim-lualine/lualine.nvim',
    config = function()
        -- Helper: only show component if window width is above threshold
        local hide_in_width = function()
            return vim.fn.winwidth(0) > 100
        end

        -- Dynamic theme: use current colorscheme if available, fallback to 'auto'
        local theme = vim.g.colors_name or 'auto'

        local mode = {
            'mode',
            fmt = function(str)
                -- Display full mode name prefixed with 
                return ' ' .. str
                -- Uncomment below line for just first letter mode
                -- return ' ' .. str:sub(1, 1)
            end,
        }

        local filename = {
            'filename',
            file_status = true, -- readonly, modified status
            path = 0,     -- 0 = filename only, 1 = relative, 2 = absolute
        }

        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            symbols = { error = ' ', warn = ' ' },
            colored = false,
            update_in_insert = false,
            always_visible = false,
            cond = hide_in_width,
        }

        local diff = {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            cond = hide_in_width,
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = theme,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'neo-tree' },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { { 'branch', icon = '' } },
                lualine_c = { filename },
                lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { { 'location', padding = 0 } },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
        }
    end,
}
