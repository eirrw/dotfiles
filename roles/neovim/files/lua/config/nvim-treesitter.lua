local ts = require('nvim-treesitter.configs')
ts.setup {
    ensure_installed = { 'lua', 'python', 'bash', 'toml', 'yaml', 'json', 'vim', 'html', 'go', 'make', 'c' },
    highlight = {enable = true}
}
