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

    -- utility
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- user interface
    use 'romgrk/barbar.nvim'
    use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }
    use { 'kyazdani42/nvim-tree.lua', config = [[require('config.nvim-tree')]] }

    use { 'nvim-treesitter/nvim-treesitter', config = [[require('config.nvim-treesitter')]] }

    -- colourschemes
    use 'EdenEast/nightfox.nvim'
    use { 'ThemerCorp/themer.lua', config = [[require('config.themer')]] }

    -- lsp
    use { 'neovim/nvim-lspconfig', config = [[require("config.nvim-lspconfig")]] }

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
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }
        },
        config = [[require("config.nvim-cmp")]]
    }

    -- snippets
    use { 'rafamadriz/friendly-snippets' }

    -- languages
    use { 'crispgm/nvim-go', config = [[require("config.nvim-go")]] }

    -- syntax
    use 'mboughaba/i3config.vim'
    use 'rpdelaney/vim-sourcecfg'
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins
