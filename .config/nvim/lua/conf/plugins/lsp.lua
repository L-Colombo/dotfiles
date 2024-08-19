return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({  -- clangd
      capabilities = capabilities
    })
    lspconfig.html.setup({  -- html
      capabilities = capabilities
    })
    lspconfig.intelephense.setup({  -- intelephense
      capabilities = capabilities
    })
    lspconfig.jdtls.setup({  -- jdtls
      capabilities = capabilities
    })
    lspconfig.lua_ls.setup({  -- lua_ls
      capabilities = capabilities
    })
    lspconfig.pyright.setup({
      capabilities = capabilities
    })
    lspconfig.solargraph.setup({  -- solargraph
      capabilities = capabilities
    })
    lspconfig.tailwindcss.setup({  -- tailwindcss
      capabilities = capabilities
    })
    lspconfig.tsserver.setup({  -- tsserver
      capabilities = capabilities
    })
  end
}
