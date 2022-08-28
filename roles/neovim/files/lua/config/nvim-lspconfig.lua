local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require('lspconfig')

vim.diagnostic.config({ virtual_text = true })

local servers = {
    pylsp = {},
    gopls = {},
    tailwindcss = {},
    html = {},
}


lsp.pylsp.setup {
    capabilities = capabilities
}

lsp.tailwindcss.setup {
    capabilities = capabilities
}

lsp.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    capabilities = capabilities
}

lsp.html.setup {
    capabilities = capabilities
}