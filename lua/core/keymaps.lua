-- core.keymaps.lua

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable spacebar default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- Save and quit
vim.keymap.set('n', '<C-s>', '<cmd>write<CR>', opts)
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd write<CR>', opts)
vim.keymap.set('n', '<C-q>', '<cmd>quit<CR>', opts)

-- Delete single char without copying to register
vim.keymap.set('n', 'x', '"_x', opts)

-- Scroll and center cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center search results
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize splits with arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- vertical split
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- horizontal split
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- equalize splits
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close split

-- Navigate between splits with Ctrl + h/j/k/l
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', opts)

-- Toggle line wrap
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode when indenting visual selections
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked text after pasting in visual mode
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
