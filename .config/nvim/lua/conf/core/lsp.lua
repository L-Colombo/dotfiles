local enable = vim.lsp.enable
local config = vim.lsp.config

enable({
    -- Installed with language toolchain/system package manager
    "hls",
    "rust_analyzer",

    -- Installed with Mason
    "bashls",
    "clangd",
    "cssls",
    "emmet_language_server",
    "gopls",
    "harper_ls",
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
