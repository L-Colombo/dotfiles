return {
    "bassamsdata/namu.nvim",
    config = function()
        require("namu").setup({
            namu_symbols = {
                enable = true,
                options = {
                    movement = {
                        close = {
                            "<C-c>"
                        }
                    }
                },
            },
            colorscheme = {
                enable = true,
                options = {
                    persist = false,
                    write_shada = false,
                    movement = {
                        close = {
                            "<C-c>"
                        }
                    }
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
