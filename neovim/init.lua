local cmd = vim.cmd
local opt = vim.opt
local u = require('utils')
local map = u.map

opt.cmdheight = 2                   -- extra space for cmds
opt.dir = '/tmp'                    -- swpfiles in /tmp
opt.expandtab = true                -- use spaces instead of tabs
opt.hidden = true                   -- enable background buffers
opt.ignorecase = true               -- ignore casing in searches
opt.list = true                     -- display hidden characters
opt.mouse = 'nv'                    -- mouse in normal and visual modes
opt.number = true                   -- turn on line numbers
opt.relativenumber = true           -- numberlines relative to cursor
opt.sidescrolloff = 8               -- lines of context
opt.shiftround = true               -- round indent to multiple of shiftwidth
opt.shiftwidth = 4                  -- size of indent
opt.smartcase = true                -- dont ignore case if using uppercase chars
opt.smartindent = true              -- indent automatically
opt.splitbelow = true               -- new windows below current
opt.splitright = true               -- new windows to right of current
opt.tabstop = 4                     -- number of spaces a tab takes up
opt.termguicolors = true            -- True color support
opt.timeoutlen = 1000               -- mapping delay 1000ms
opt.ttimeoutlen = 10                -- keycode delay 10ms
opt.updatetime = 300                -- more responsive updates
opt.wildmode = {'list', 'longest'}  -- cmdline completion mode
opt.wrap = false                    -- disable line wrap

map('n', '<Space>', '')
vim.g.mapleader = ' '

map('', '<leader>c', '"+y') -- copy to system clipboard

-- splits
map('n', '<leader>w', '<C-w>v<C-w>l')
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')

-- barbar
local opts = { silent = true }
-- move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)

-- change numbering on focus/insert
u.create_augroup({
    { 'BufEnter,FocusGained,InsertLeave', '!NvimTree', 'set relativenumber'},
    { 'BufLeave,FocusLost,InsertEnter', '*', 'set norelativenumber'},
}, 'numbertoggle')

-- packer commands
cmd [[command! PackerInstall lua require('plugins').install()]]
cmd [[command! PackerUpdate lua require('plugins').update()]]
cmd [[command! PackerSync lua require('plugins').sync()]]
cmd [[command! PackerClean lua require('plugins').clean()]]
cmd [[command! PackerCompile lua require('plugins').compile()]]
