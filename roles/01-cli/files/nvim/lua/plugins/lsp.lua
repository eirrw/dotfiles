return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", opt = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "cmp-nvim-lsp",
            "snacks.nvim",
        },
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            diagnostics = {
                virtual_text = true
            },
            servers = {
                bashls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            diagnostics = { globals = { 'vim ' } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file('', true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        }
                    }
                },
            },
            on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                local function map(lhs, rhs, desc)
                    bufopts['desc'] = desc
                    vim.keymap.set('n', lhs, rhs, bufopts)
                end

                map('K', vim.lsp.buf.hover, "show hover info")
                map('<C-k>', vim.lsp.buf.signature_help, "show signature help")

                map('gd', function () Snacks.picker.lsp_definitions() end, "go to definition")
                map('gr', function () Snacks.picker.lsp_references() end, "get references")
                map('gi', function () Snacks.picker.lsp_implementations() end, "go to implementation")
                map('gy', function () Snacks.picker.lsp_type_definitions() end, "go to typedef")

                map('<space>wa', vim.lsp.buf.add_workspace_folder, "add directory to workspace")
                map('<space>wr', vim.lsp.buf.remove_workspace_folder, "remove directory from workspace")
                map('<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "list workspace directories")

                map('<space>rn', vim.lsp.buf.rename, "rename symbol")
                map('<space>ca', vim.lsp.buf.code_action, "perform code action")
                map('<space><c-f>', function() vim.lsp.buf.format { async = true } end, "format buffer")
            end,
            setup = {},
        },
        config = function(_, opts)
            -- use neoconf for machine local lsp configs
            if require("utils").plugin("neoconf.nvim") then
                local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
                require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
            end

            local servers = opts.servers

            -- set up lsp completion
            local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend("force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                has_cmp and cmp_nvim_lsp.default_capabilities() or {},
                opts.capabilities or {}
            )

            -- default lsp setup handler
            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force",
                    { capabilities = vim.deepcopy(capabilities), },
                    { on_attach = opts.on_attach },
                    servers[server] or {}
                )

                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup["*"] then
                    if opts.setup["*"](server, server_opts) then
                        return
                    end
                end
                require("lspconfig")[server].setup(server_opts)
            end

            -- get all the servers that are available through mason-lspconfig
            local have_mason, mlsp = pcall(require, "mason-lspconfig")
            local all_mlsp_servers = {}
            if have_mason then
                all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
            end

            -- install and setup default servers
            local ensure_installed = {} ---@type string[]
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            if have_mason then
                mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
            end
        end
    }
}
