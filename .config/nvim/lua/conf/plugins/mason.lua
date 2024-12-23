return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  opts = { ui = { border = "rounded" } },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "html",
        "intelephense",
        "lua_ls",
        "pyright",
        "ruff",
        "tailwindcss",
        "ts_ls",
      },
    })
  end
}
