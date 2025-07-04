-- core.options.lua

-- Window-local options
vim.wo.number = true -- Show absolute line numbers
vim.wo.signcolumn = 'yes' -- Always show the sign column

-- Global options
local o = vim.o
local opt = vim.opt

o.relativenumber = true -- Relative line numbers
opt.clipboard = '' -- Use system clipboard
o.wrap = false -- Disable line wrap
o.linebreak = true -- Do not split words when wrapping (if wrap enabled)
o.mouse = 'a' -- Enable mouse in all modes

o.autoindent = true -- Copy indent from current line
o.smartindent = true -- Smart indentation

o.ignorecase = true -- Case-insensitive search...
o.smartcase = true -- ...unless uppercase letter in query

o.shiftwidth = 4 -- Indentation amount for '>'
o.tabstop = 4 -- Number of spaces per Tab
o.softtabstop = 4 -- Number of spaces for Tab while editing
o.expandtab = true -- Convert tabs to spaces

o.scrolloff = 4 -- Keep 4 lines above/below cursor
o.sidescrolloff = 8 -- Keep 8 columns to sides when scrolling horizontally

o.cursorline = false -- Highlight current line (can toggle later if desired)

o.splitbelow = true -- Horizontal splits open below
o.splitright = true -- Vertical splits open right

o.hlsearch = false -- Disable persistent search highlight
o.showmode = false -- Don't show mode (e.g. -- INSERT --)

opt.termguicolors = true -- Enable 24-bit RGB colors

o.whichwrap = 'bs<>[]hl' -- Allow cursor keys to wrap lines

o.numberwidth = 4 -- Width of number column

o.swapfile = false -- Disable swapfile

o.showtabline = 2 -- Always show tabline

o.backspace = 'indent,eol,start' -- Allow backspacing over everything

o.pumheight = 10 -- Pop-up menu height for completions

o.conceallevel = 0 -- Show concealed text (like backticks in markdown)

o.fileencoding = 'utf-8' -- Default file encoding

o.cmdheight = 1 -- Height of command line

o.breakindent = true -- Enable break indent

o.updatetime = 250 -- Faster update for CursorHold, completions

o.timeoutlen = 300 -- Faster mapping timeout

o.backup = false -- Disable backup files
o.writebackup = false -- Disable write backup files

o.undofile = true -- Enable persistent undo

o.completeopt = 'menuone,noselect' -- Better completion options

-- Append to shortmess to avoid extra messages during completion
opt.shortmess:append 'c'

-- Consider hyphenated words as a single word
opt.iskeyword:append '-'

-- Remove auto comment insert on newline or 'o'/'O' commands
opt.formatoptions:remove { 'c', 'r', 'o' }

-- Remove Vim runtime path to separate from Neovim plugins (if Vim also installed)
opt.runtimepath:remove '/usr/share/vim/vimfiles'
