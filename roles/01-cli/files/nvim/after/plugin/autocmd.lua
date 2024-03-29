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
local nvimTreeGrp = agrp('closeNvimTree', {})
au('BufEnter', {
    group = nvimTreeGrp,
    callback = function(data)
        if table.getn(vim.api.nvim_tabpage_list_wins(0)) == 1 
            and string.find(data.match, 'NvimTree_' .. vim.api.nvim_tabpage_get_number(0))
        then
            -- check for unsaved buffers
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_get_option(buf, 'modified') then
                    vim.api.nvim_win_set_buf(0, buf)
                    return 'Unsaved buffers'
                end
            end

            vim.api.nvim_command('quit')
        end
    end,
    nested = true
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
