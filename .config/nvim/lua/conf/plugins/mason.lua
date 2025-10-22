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
                "clojure_lsp",
                "cssls",
                "expert",
                "emmet_language_server",
                "erlangls",
                "gopls",
                "html",
                "jdtls",
                "lua_ls",
                "phpactor",
                "pyright",
                "ruby_lsp",
                "ruff",
                "tailwindcss",
                "ts_ls",
                "tinymist",
            },
        })
    end
}
