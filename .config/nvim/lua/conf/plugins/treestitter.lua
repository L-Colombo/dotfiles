return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            endwise = {
                enable = true
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "+",
                    node_incremental = "+",
                    scope_incremental = "+",
                    node_decremental = "-"
                }
            }
        }
    end
}
