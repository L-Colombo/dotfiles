local enable = vim.lsp.enable
local config = vim.lsp.config

enable({
    "hls",
    "rust_analyzer",
    "bashls",
    "clangd",
    "gopls",
    "jdtls",
    "jsonls",
    "lua_ls",
    "ocamllsp",
    "phpactor",
    "pyright",
    "ruff",
    "texlab",
    "tinymist",
    "tombi",
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
