return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                eruby = { "erb_format" },
                haskell = { "fourmolu" },
                javascript = {
                    "prettierd",
                    "prettier",
                    command = "npx prettier . --write",
                    stop_after_first = true
                },
                javascriptreact = {
                    "prettierd",
                    "prettier",
                    command = "npx prettier . --write",
                    stop_after_first = true
                },
                python = { "ruff" },
                php = { "pint", lsp_format = "fallback" },
                rust = { "rustfmt", lsp_format = "fallback" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback"
            }
        })
    end
}
