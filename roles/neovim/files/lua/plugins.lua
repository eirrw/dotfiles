local packer = nil

local function init()
    if packer == nil then
        packer = require("packer")
        packer.init { disable_commands = true }
    end

    local use = packer.use
    packer.reset()

    -- packer
    use 'wbthomason/packer.nvim'

    -- user interface
    use 'nvim-tree/nvim-web-devicons'
    use {
        'romgrk/barbar.nvim',
        requires = 'nvim-web-devicons',
        config = [[require('config.barbar')]]
    }
    use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }
    use { 'nvim-tree/nvim-tree.lua', config = [[require('config.nvim-tree')]] }

    -- motion
    use { 'justinmk/vim-sneak' }
    use { 'chaoren/vim-wordmotion' }

    -- utility
    use {
        'johmsalas/text-case.nvim',
         config = function() require('textcase').setup {} end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[require('config.nvim-treesitter')]],
        run = ':TSUpdate'
    }

    -- colourschemes
    use 'EdenEast/nightfox.nvim'
    use { 'ThemerCorp/themer.lua', config = [[require('config.themer')]] }

    -- dependancy management
    use {
        "williamboman/mason.nvim",
        run = ':MasonUpdate',
        config = function ()
            require("mason").setup()
        end
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        after = 'mason.nvim',
        config = [[require('config.mason-lspconfig')]],
    }

    -- lsp
    use { 'neovim/nvim-lspconfig', config = [[require("config.nvim-lspconfig")]] }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- search
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim',
                'telescope-fzf-native.nvim',
            },
            wants = {
                'popup.nvim',
                'plenary.nvim',
                'telescope-fzf-native.nvim',
            },
            setup = [[require('config.telescope_setup')]],
            config = [[require('config.telescope')]],
            cmd = 'Telescope',
            module = 'telescope',
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
        },
    }

    -- completions
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'ray-x/cmp-treesitter', after = 'nvim-cmp' }
        },
        config = [[require("config.nvim-cmp")]]
    }

    -- notes
    use {
        "nvim-neorg/neorg",
        tag = "*",
        ft = "norg",
        after = "nvim-treesitter", -- You may want to specify Telescope here as well
        config = [[require("config.neorg")]]
    }

    -- snippets
    use { 'rafamadriz/friendly-snippets' }

    -- languages
    use { 'crispgm/nvim-go', config = [[require("config.nvim-go")]] }
    use { 'jakewvincent/mkdnflow.nvim', config = [[require("config.mkdnflow")]] }

    -- syntax
    use 'mboughaba/i3config.vim'
    use 'rpdelaney/vim-sourcecfg'
    use 'fladson/vim-kitty'
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins
