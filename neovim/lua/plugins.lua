local PKGS = {
    "savq/paq-nvim";
    "kyazdani42/nvim-web-devicons";
    "kyazdani42/nvim-tree.lua";
    "nvim-lualine/lualine.nvim";
    "nvim-treesitter/nvim-treesitter";
    "romgrk/barbar.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-lua/popup.nvim";

    -- colourschemes
    "EdenEast/nightfox.nvim";
    {"ThemerCorp/themer.lua", branch="dev"};

    -- lsp
    "neovim/nvim-lspconfig";

    -- completions
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-cmdline";
    "hrsh7th/nvim-cmp";

    -- snippets
    "hrsh7th/cmp-vsnip";
    "hrsh7th/vim-vsnip";
    "hrsh7th/vim-vsnip-integ";
    "rafamadriz/friendly-snippets";

    -- languages
    "crispgm/nvim-go"
}

local paq = require('paq')

paq(PKGS)

