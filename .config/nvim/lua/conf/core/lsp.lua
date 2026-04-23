local enable = vim.lsp.enable
local config = vim.lsp.config

enable({
    -- Installed with language toolchain/system package manager
    "clojure_lsp",
    "gleam",
    "hls",
    "ocamllsp",
    "racket_langserver",
    "rust_analyzer",
    "texlab",
    "zls",

    -- Installed with Mason
    "bashls",
    "clangd",
    "cssls",
    -- "elixirls",
    "emmet_language_server",
    "erlangls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    "lua_ls",
    "phpactor",
    "pyright",
    "racket_langserver",
    "ruby_lsp",
    "ruff",
    "tailwindcss",
    "ts_ls",
    "tinymist",
})

config("pyright", {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" }
            }
        }
    }
})
