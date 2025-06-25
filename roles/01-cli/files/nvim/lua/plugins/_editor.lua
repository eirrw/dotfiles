return {
    -- https://github.com/chaoren/vim-wordmotion
    { 'chaoren/vim-wordmotion', event = {"VeryLazy"} },
    {
        -- https://github.com/johmsalas/text-case.nvim
        'johmsalas/text-case.nvim',
        config = true,
        keys = {
            "ga"
        },
        cmd = {
            "Subs",
            "TextCaseOpenTelescope",
            "TextCaseOpenTelescopeQuickChange",
            "TextCaseOpenTelescopeLSPChange",
            "TextCaseStartReplacingCommand",
        }
    },
    {
        -- https://github.com/ggandor/leap.nvim
        'ggandor/leap.nvim',
        version = '*',
        event = {"VeryLazy"},
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    {
        -- https://github.com/echasnovski/mini.ai
        'echasnovski/mini.ai',
        version = '*',
        event = {"VeryLazy"},
        opts = function()
            local ai = require('mini.ai')
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- functionNode
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                }
            }
        end
    },
}
