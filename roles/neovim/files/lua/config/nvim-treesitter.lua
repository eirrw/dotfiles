local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = {
        'bash',
        'c',
        'fish',
        'go',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'python',
        'rasi',
        'rust',
        'toml',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = {enable = true}
}
