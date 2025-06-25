local agrp = vim.api.nvim_create_augroup
local au   = vim.api.nvim_create_autocmd

-- change numbering on focus/insert
local numberGroup = agrp("numbertoggle", {clear = true})
au({'BufEnter', 'FocusGained', 'InsertLeave'}, {
    group = numberGroup,
    callback = function(data)
        vim.wo.relativenumber = true
    end,
})
au({'BufLeave', 'FocusLost', 'InsertEnter'}, {
    group = numberGroup,
    callback = function(data)
        -- no number in file tree
        if not string.find(data.file, 'NvimTree_' .. vim.api.nvim_tabpage_get_number(0)) then
            vim.wo.relativenumber = false
        end
    end,
})

-- windows to close with 'q'
local closeGrp = agrp('closeOnQ', {})
au('FileType', {
    group = closeGrp,
    pattern = {'help', 'startuptime', 'qf', 'lspinfo'},
    callback = function(data)
        print(buf)
        vim.api.nvim_buf_set_keymap(data.buf, 'n', 'q', ':close<CR>', {noremap = true, silent = true})
    end,
})

-- autoclose nvim-tree
-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({'BufEnter', 'QuitPre'}, {
  nested = false,
  callback = function(e)
    local tree = require('nvim-tree.api').tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _,winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == 'QuitPre' and winCount == 2 then
      vim.api.nvim_cmd({cmd = 'qall'}, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == 'BufEnter' and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle({find_file = true, focus = true})
        -- re-open nivm-tree
        tree.toggle({find_file = true, focus = false})
      end, 10)
    end
  end
})

-- 
local lsp = agrp('lspAutoGroup', {})
au({ 'CursorHold', 'CursorHoldI' }, {
    group = lsp,
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

local folding = agrp('foldingAutoGroup', {})
au({'BufReadPost', 'FileReadPost'}, {
    group = folding,
    callback = function ()
        vim.cmd.normal('zR')
    end,
})
