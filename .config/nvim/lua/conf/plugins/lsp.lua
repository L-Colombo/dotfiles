return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({ -- c/c++
      capabilities = capabilities
    })
    lspconfig.html.setup({ -- html
      capabilities = capabilities
    })
    lspconfig.intelephense.setup({ -- php
      capabilities = capabilities
    })
    lspconfig.jdtls.setup({ -- java
      capabilities = capabilities
    })
    lspconfig.lua_ls.setup({  -- lua
      capabilities = capabilities
    })
    lspconfig.pyright.setup({ -- python
      capabilities = capabilities
    })
    lspconfig.solargraph.setup({ -- ruby
      capabilities = capabilities
    })
    lspconfig.rust_analyzer.setup({ -- rust
      capabilities = capabilities
    })
    lspconfig.tailwindcss.setup({ -- tailwindcss
      capabilities = capabilities
    })
    lspconfig.ts_ls.setup({ -- typescript/javascript
      capabilities = capabilities
    })
  end
}
