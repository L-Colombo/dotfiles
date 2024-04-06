return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)
        lsp.format_on_save({
            format_opts = {
                async = false,
                timeout_ms = 10000,
            },

            servers = {
                ['lua_ls'] = { 'lua' },
                ['pyright'] = { 'python' },
                ['unocss'] = { 'css' },
                ['html'] = { 'html' },
                ['jsonls'] = { 'JSON' },
                ['clangd'] = { 'c', 'cpp' },
                ['bashls'] = { 'bash' },
                ['intelephense'] = { 'php' },
                ['volar'] = { 'vue' },
                ['tsserver'] = {
                    'javascript',
                    'typescript',
                    'javascriptreact',
                    'typescriptreact'
                },
            }
        })

        require("lspconfig").intelephense.setup({})
        require("lspconfig").clangd.setup({})
        require("lspconfig").tailwindcss.setup({})
        require("lspconfig").solargraph.setup({})
        require("lspconfig").jdtls.setup({})
        require("lspconfig").volar.setup({})


        lsp.setup()
    end
}
