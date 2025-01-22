return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = { ui = { border = "rounded" } },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "clangd",
                "cssls",
                "emmet_language_server",
                "html",
                "lua_ls",
                "phpactor",
                "pyright",
                "tailwindcss",
                "ts_ls",
            },
        })
    end
}
