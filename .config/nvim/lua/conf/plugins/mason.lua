return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = { ui = { border = "rounded" } },
    config = function()
        local lsp = require('lsp-zero').preset({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'tsserver',
                'volar',
                'solargraph',
                'jdtls',
                'eslint',
                'pyright',
                'html',
                'cssls',
                'lua_ls',
                'texlab',
                'clangd',
                'intelephense',
            },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
                end,
            }
        })
    end
}
