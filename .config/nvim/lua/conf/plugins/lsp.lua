return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.bashls.setup({ -- bash
            capabilities = capabilities
        })
        lspconfig.clangd.setup({ -- c/c++
            capabilities = capabilities
        })
        lspconfig.emmet_language_server.setup({
            capabilities = capabilities
        })
        lspconfig.hls.setup({ -- haskell (*)
            capabilities = capabilities
        })
        lspconfig.html.setup({ -- html
            capabilities = capabilities,
            filetypes = {
                "html",
                "eruby"
            }
        })
        lspconfig.lua_ls.setup({ -- lua
            capabilities = capabilities,
        })
        lspconfig.phpactor.setup({ -- php
            capabilities = capabilities,
            init_options = {
                ["language_server_completion.trim_leading_dollar"] = true,
            }
        })
        lspconfig.pyright.setup({ -- python
            capabilities = capabilities,
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        ignore = { "*" },
                    }
                }
            }
        })
        lspconfig.ruby_lsp.setup({ -- ruby (*)
            capabilities = capabilities,
            init_options = {
                formatter = "standard",
                linters = { "standard" },
            }
        })
        lspconfig.ruff.setup({ -- python (**)
            capabilities = capabilities
        })
        lspconfig.rust_analyzer.setup({ -- rust (*)
            capabilities = capabilities
        })
        lspconfig.tailwindcss.setup({ -- tailwindcss
            capabilities = capabilities
        })
        lspconfig.texlab.setup({ -- LaTeX (**)
            capabilities = capabilities
        })
        lspconfig.ts_ls.setup({ -- typescript/javascript
            capabilities = capabilities
        })
    end
}
-- (*): server installed with the toolchain
-- (**): server installed with OS package manager
