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
                -- "elixirls",
                "emmet_language_server",
                -- "erlangls",
                "gopls",
                "html",
                "jdtls",
                "jsonls",
                "lua_ls",
                "phpactor",
                "pyright",
                -- "ruby_lsp",
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
