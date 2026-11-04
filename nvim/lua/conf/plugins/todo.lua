return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
        keywords = {
            FIX = { color = "#dd0000" },
            HACK = { color = "#e5fb02" },
            NOTE = { color = "#666666" },
        }
    },
    lazy = true,
    event = { "BufEnter" },
    vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev({
            keywords = {
                "BUG",
                "ERROR",
                "FIX",
                "HACK",
                "NOTE",
                "PERF",
                "TODO",
                "WARNING"
            }
        })
    end),

    vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next({
            keywords = {
                "BUG",
                "ERROR",
                "FIX",
                "HACK",
                "NOTE",
                "PERF",
                "TODO",
                "WARNING"
            }
        })
    end)
}
