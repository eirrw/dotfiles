return {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    'romgrk/barbar.nvim',
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            sections = {
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond=require("lazy.status").has_updates,
                        color= { fg = "#ff9e64" },
                    }
                }
            }
        }
    },
    {
        'nvim-tree/nvim-tree.lua',
        opts = {
            view = {
                relativenumber = true,
                width = 40,
            }
        }
    },
}
