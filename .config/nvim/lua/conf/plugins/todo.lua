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
}
