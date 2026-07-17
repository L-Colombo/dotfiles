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
                "gopls",
                "html",
                "jdtls",
                "jsonls",
                "lua_ls",
                "phpactor",
                "pyright",
                "ruff",
                "tailwindcss",
                "texlab",
                "tinymist",
                "ts_ls",
                "zls",
            },
        })
    end
}
