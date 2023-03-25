local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require('lspconfig')

vim.diagnostic.config({ virtual_text = true })

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

lsp.pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.tailwindcss.setup {
    capabilities = capabilities,
    on_attach = on_attach
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
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.texlab.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lsp.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
