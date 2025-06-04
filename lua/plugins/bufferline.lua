return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'moll/vim-bbye',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local function get_hl(group)
            local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
            if not ok then
                return {}
            end
            return {
                fg = hl.foreground and string.format('#%06x', hl.foreground) or nil,
                bg = hl.background and string.format('#%06x', hl.background) or nil,
                bold = hl.bold or false,
                italic = hl.italic or false,
                underline = hl.underline or false,
                undercurl = hl.undercurl or false,
            }
        end

        local normal = get_hl 'Normal'
        local statusline = get_hl 'StatusLine'
        local cursorline = get_hl 'CursorLine'
        local diff_add = get_hl 'DiffAdd'
        local diff_delete = get_hl 'DiffDelete'
        local diff_change = get_hl 'DiffChange'
        local diagnostic_error = get_hl 'DiagnosticError'
        local diagnostic_warn = get_hl 'DiagnosticWarn'
        local diagnostic_info = get_hl 'DiagnosticInfo'
        local diagnostic_hint = get_hl 'DiagnosticHint'

        require('bufferline').setup {
            options = {
                mode = 'buffers',      -- set to "tabs" to only show tabpages instead
                themable = true,       -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = 'none',      -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
                buffer_close_icon = '✗',
                close_icon = '✗',
                path_components = 1, -- Show only the file name without the directory
                modified_icon = '●',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                tab_size = 21,
                diagnostics = false,
                diagnostics_update_in_insert = false,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                show_tab_indicators = false,
                indicator = {
                    style = 'none', -- Options: 'icon', 'underline', 'none'
                },
                icon_pinned = '󰐃',
                minimum_padding = 1,
                maximum_padding = 5,
                maximum_length = 15,
                sort_by = 'insert_at_end',
            },
            highlights = {
                fill = {
                    bg = normal.bg,
                },
                background = {
                    fg = normal.fg,
                    bg = normal.bg,
                },
                buffer_visible = {
                    fg = statusline.fg,
                    bg = normal.bg,
                },
                buffer_selected = {
                    fg = cursorline.fg,
                    bg = cursorline.bg,
                    bold = true,
                },
                close_button = {
                    fg = statusline.fg,
                    bg = normal.bg,
                },
                close_button_visible = {
                    fg = statusline.fg,
                    bg = normal.bg,
                },
                close_button_selected = {
                    fg = diagnostic_error.fg,
                    bg = cursorline.bg,
                    bold = true,
                },
                tab_selected = {
                    fg = cursorline.fg,
                    bg = cursorline.bg,
                    bold = true,
                },
                tab = {
                    fg = statusline.fg,
                    bg = normal.bg,
                },
                tab_close = {
                    fg = diagnostic_error.fg,
                    bg = normal.bg,
                },
                indicator_selected = {
                    fg = diagnostic_info.fg,
                    bg = cursorline.bg,
                },
                modified = {
                    fg = diff_add.fg or '#00ff00',
                    bg = normal.bg,
                },
                modified_visible = {
                    fg = diff_change.fg or '#ffff00',
                    bg = normal.bg,
                },
                modified_selected = {
                    fg = diff_add.fg or '#00ff00',
                    bg = cursorline.bg,
                },
                separator = {
                    fg = statusline.bg,
                    bg = normal.bg,
                },
                separator_selected = {
                    fg = cursorline.bg,
                    bg = cursorline.bg,
                },
            },
        }
    end,
}
