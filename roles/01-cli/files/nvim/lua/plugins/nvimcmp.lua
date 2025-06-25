return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'ray-x/cmp-treesitter',
        },
        event = { 'InsertEnter', 'CmdlineEnter' },
        opts = function()
            local cmp = require('cmp')
            local luasnip = require("luasnip")

            return {
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
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                            end
                        else
                            fallback()
                        end
                    end),
                    ['<tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end),
                    ['<s-tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'treesitter' },
                }, {
                    { name = 'buffer' },
                })
            }
        end,
        config = function(_, opts)
            local cmp = require('cmp')
            cmp.setup(opts)
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = 'buffer' } }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    }
}
