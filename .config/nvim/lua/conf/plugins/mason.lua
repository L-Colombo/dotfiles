return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  opts = { ui = { border = "rounded" } },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "html",
        "intelephense",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "solargraph",
        "tailwindcss",
        "ts_ls",
      },
    })
  end
}
