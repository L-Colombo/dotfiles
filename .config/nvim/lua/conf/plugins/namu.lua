return {
    "bassamsdata/namu.nvim",
    config = function()
        require("namu").setup({
            namu_symbols = {
                enable = true,
                options = {},
            },
            colorscheme = {
                enable = true,
                options = {
                    persist = true,
                    write_shada = false,
                },
            },
            ui_select = { enable = true },
        })
        -- === Suggested Keymaps: ===
        local namu = require("namu.namu_symbols")
        local colorscheme = require("namu.colorscheme")
        vim.keymap.set("n", "<leader>ls", namu.show, {
            desc = "Jump to LSP symbol",
            silent = true,
        })
        vim.keymap.set("n", "<leader>fc", colorscheme.show, {
            desc = "Colorscheme Picker",
            silent = true,
        })
    end,
}
