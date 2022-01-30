local cmp = require('cmp')
local luasnip = require("luasnip")

local function check_backspace()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local feedkeys = vim.fn.feedkeys
local replace_termcodes = vim.api.nvim_replace_termcodes
local backspace_keys = replace_termcodes('<tab>', true, true, true)
local snippet_next_keys = replace_termcodes('<plug>luasnip-expand-or-jump', true, true, true)
local snippet_prev_keys = replace_termcodes('<plug>luasnip-jump-prev', true, true, true)

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                feedkeys(snippet_next_keys, '')
            elseif check_backspace() then
                feedkeys(backspace_keys, 'n')
            else
                fallback()
            end
        end,
        ['<s-tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                feedkeys(snippet_prev_keys, '')
            else
                fallback()
            end
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help'},
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' }
    })
})
