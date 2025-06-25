if vim.fn.has 'nvim-0.10' == 0 then
  error("Neovim >= v0.10 is required")
  return nil
end

local kset = vim.keymap.set
local opt = vim.opt

-- set options
opt.cmdheight = 2                    -- extra space for cmds
opt.dir = '/tmp'                     -- swpfiles in /tmp
opt.expandtab = true                 -- use spaces instead of tabs
opt.hidden = true                    -- enable background buffers
opt.ignorecase = true                -- ignore casing in searches
opt.list = true                      -- display hidden characters
opt.mouse = 'a'                      -- mouse in normal and visual modes
opt.number = true                    -- turn on line numbers
opt.relativenumber = true            -- numberlines relative to cursor
opt.sidescrolloff = 8                -- lines of context
opt.shiftround = true                -- round indent to multiple of shiftwidth
opt.shiftwidth = 4                   -- size of indent
opt.smartcase = true                 -- dont ignore case if using uppercase chars
opt.smartindent = true               -- indent automatically
opt.splitbelow = true                -- new windows below current
opt.splitright = true                -- new windows to right of current
opt.tabstop = 4                      -- number of spaces a tab takes up
opt.termguicolors = true             -- True color support
opt.timeoutlen = 1000                -- mapping delay 1000ms
opt.ttimeoutlen = 10                 -- keycode delay 10ms
opt.updatetime = 300                 -- more responsive updates
opt.wildmode = { 'list', 'longest' } -- cmdline completion mode
opt.wrap = false                     -- disable line wrap
opt.exrc = true                      -- run workspace specific config

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- treesitter folding
--opt.foldmethod = 'expr'
--opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- opt.foldenable = false
--opt.foldminlines = 8
--opt.foldnestmax = 5
--opt.foldcolumn = 'auto:5'

-- set leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- copy to system clipboard
kset('', '<leader>c', '"+y', { desc = 'copy to system clipboard' })

-- splits
kset('n', '<leader>h', '<C-w>h', { desc = 'focus split on the left' })
kset('n', '<leader>l', '<C-w>l', { desc = 'focus split on the right' })
kset('n', '<leader>j', '<C-w>j', { desc = 'focus split on the bottom' })
kset('n', '<leader>k', '<C-w>k', { desc = 'focus split on the top' })

-- PLUGINS
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
