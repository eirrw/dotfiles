local opt = vim.opt
local cmd = vim.cmd

cmd 'colorscheme themer_onedark'

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

local u = require('utils')

-- change numbering on focus/insert
u.create_augroup({
    { 'BufEnter,FocusGained,InsertLeave', '*', 'set relativenumber'},
    { 'BufLeave,FocusLost,InsertEnter', '*', 'set norelativenumber'},
}, 'numbertoggle')

