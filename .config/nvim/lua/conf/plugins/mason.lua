return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  opts = { ui = { border = "rounded" } },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'lua_ls',
        'clangd',
        'intelephense',
      },
    })
  end
}
