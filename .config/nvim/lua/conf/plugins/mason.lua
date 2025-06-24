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
                "elixirls",
                "emmet_language_server",
                "gopls",
                "html",
                "lua_ls",
                "phpactor",
                "pyright",
                "ruff",
                "tailwindcss",
                "texlab",
                "ts_ls",
                "tinymist",
            },
        })
    end
}
