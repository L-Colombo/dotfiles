return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                eruby = { "erb_format" },
                haskell = { "hindent" },
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
                ocaml = {
                    "ocamlformat"
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

        vim.keymap.set("n", "g=", "<cmd>Format<cr>")
    end
}
