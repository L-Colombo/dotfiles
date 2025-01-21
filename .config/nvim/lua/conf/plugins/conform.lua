return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                eruby = { "erb_format" },
                haskell = { "ormolu" },
                python = { "ruff" },
                rust = { "rustfmt", lsp_format = "fallback" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback"
            }
        })
    end
}
