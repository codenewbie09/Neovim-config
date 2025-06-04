return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        -- Languages to install
        ensure_installed = {
            'bash',
            'cmake',
            'css',
            'dockerfile',
            'gitignore',
            'go',
            'graphql',
            'groovy',
            'html',
            'java',
            'javascript',
            'json',
            'lua',
            'make',
            'markdown',
            'markdown_inline',
            'python',
            'regex',
            'sql',
            'tsx',
            'typescript',
            'toml',
            'vim',
            'vimdoc',
            'yaml',
        },

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' }, -- keep ruby regex for indent issues
            disable = {},                             -- you can disable some languages here if needed
        },

        indent = {
            enable = true,
            disable = { 'ruby' }, -- disable indent for ruby due to issues
        },

        -- Incremental selection (optional, but very useful)
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                node_incremental = '<CR>',
                scope_incremental = '<TAB>',
                node_decremental = '<S-TAB>',
            },
        },

        -- Additional modules (optional)
        -- textobjects example:
        -- textobjects = {
        --   enable = true,
        --   select = {
        --     enable = true,
        --     keymaps = {
        --       ['af'] = '@function.outer',
        --       ['if'] = '@function.inner',
        --       ['ac'] = '@class.outer',
        --       ['ic'] = '@class.inner',
        --     },
        --   },
        -- },
    },
}
