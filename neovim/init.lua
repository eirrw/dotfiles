if vim.fn.has 'nvim-0.7' == 0 then
    error("Neovim 0.7+ is required")
    return nil
end

local ucmd = vim.api.nvim_create_user_command
local kset = vim.api.nvim_set_keymap
local kdel = vim.api.nvim_del_keymap
local opt = vim.opt

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

kset('n', '<Space>', '', {desc='unbound leader key'})
vim.g.mapleader = ' '

kset('', '<leader>c', '"+y', {desc='copy to system clipboard'}) -- copy to system clipboard

-- splits
kset('n', '<leader>w', '<C-w>v<C-w>l', {desc='create vertical split'})
kset('n', '<leader>h', '<C-w>h', {desc='focus split on the left'})
kset('n', '<leader>l', '<C-w>l', {desc='focus split on the right'})
kset('n', '<leader>j', '<C-w>j', {desc='focus split on the bottom'})
kset('n', '<leader>k', '<C-w>k', {desc='focus split on the top'})

-- barbar
local opts = { silent = true }
-- move to previous/next
kset('n', '<A-,>', ':BufferPrevious<CR>', {silent=true, desc='switch to previous buffer'})
kset('n', '<A-.>', ':BufferNext<CR>', {silent=true, desc='switch to next buffer'})
-- Re-order to previous/next
kset('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
kset('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
kset('n', '<A-1>', ':BufferGoto 1<CR>', opts)
kset('n', '<A-2>', ':BufferGoto 2<CR>', opts)
kset('n', '<A-3>', ':BufferGoto 3<CR>', opts)
kset('n', '<A-4>', ':BufferGoto 4<CR>', opts)
kset('n', '<A-5>', ':BufferGoto 5<CR>', opts)
kset('n', '<A-6>', ':BufferGoto 6<CR>', opts)
kset('n', '<A-7>', ':BufferGoto 7<CR>', opts)
kset('n', '<A-8>', ':BufferGoto 8<CR>', opts)
kset('n', '<A-9>', ':BufferGoto 9<CR>', opts)
kset('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
kset('n', '<A-c>', ':BufferClose<CR>', opts)

-- nvim-tree
kset('n', '<C-n>', ':NvimTreeToggle<CR>', {desc='open or close nvim-tree'})

-- packer commands
ucmd('PackerInstall', function() require('plugins').install() end, {})
ucmd('PackerUpdate', function() require('plugins').update() end, {})
ucmd('PackerSync', function() require('plugins').sync() end, {})
ucmd('PackerClean', function() require('plugins').clean() end, {})
ucmd('PackerCompile', function() require('plugins').compile() end, {})
