return {
    { 
      -- https://github.com/chaoren/vim-wordmotion
      'chaoren/vim-wordmotion',
      event = {"VeryLazy"}
    },
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
        url = 'https://codeberg.org/andyg/leap.nvim',
        version = '*',
        config = function(_, opts)
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
            vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

            local leap = require("leap")

            -- skip preview in whitespace/middle of word
            leap.opts.preview = function (ch0, ch1, ch2)
              return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
              )
            end

            leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

            require('leap.user').set_repeat_keys('<enter>', '<backspace>')
        end,
    },
    {
        -- https://github.com/echasnovski/mini.ai
        'nvim-mini/mini.ai',
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
