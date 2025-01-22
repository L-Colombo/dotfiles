return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { "~/.config/nvim/snippets" }
        })
        local key = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        key("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        key("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        key("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
        key("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
    end
}
