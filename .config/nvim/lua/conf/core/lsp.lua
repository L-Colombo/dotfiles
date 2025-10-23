local enable = vim.lsp.enable
local config = vim.lsp.config

enable({
    -- Installed with language toolchain
    "gleam",
    "hls",
    "ocamllsp",
    "racket_langserver",
    "rust_analyzer",

    -- Installed with Mason
    "bashls",
    "clangd",
    "clojure_lsp",
    "cssls",
    "elixirls",
    "emmet_language_server",
    "erlangls",
    "gopls",
    "harper_ls",
    "html",
    "jdtls",
    "lua_ls",
    "phpactor",
    "pyright",
    "ruby_lsp",
    "ruff",
    "tailwindcss",
    "texlab",
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

config("harper_ls", {
    filetypes = {
        "markdown",
        "org",
        "tex",
        "typst"
    },
    settings = {
        ["harper-ls"] = {
            linters = {
                SpellCheck = false
            }
        }
    }
})
