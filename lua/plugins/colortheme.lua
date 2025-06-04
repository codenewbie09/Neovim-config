return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        -- Optional settings
        require('tokyonight').setup {
            style = 'night', -- or "storm", "moon", "day"
            transparent = true,
        }

        -- Load the colorscheme
        vim.cmd 'colorscheme tokyonight-night'
    end,
}
