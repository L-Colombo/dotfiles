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
        lspconfig.gopls.setup({ -- go (**)
            capabilities = capabilities
        })
        lspconfig.hls.setup({ -- haskell (*)
            capabilities = capabilities
        })
        lspconfig.html.setup({ -- html
            capabilities = capabilities
        })
        lspconfig.intelephense.setup({ -- php
            capabilities = capabilities
        })
        lspconfig.lua_ls.setup({ -- lua
            capabilities = capabilities,
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
        lspconfig.ruff.setup({ -- python
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
-- (**): server installed with package manager
