return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add          = { text = '+' },
            change       = { text = '~' },
            changedelete = { text = '%' },
        }
    },
    config = function()
        vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
        vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
        vim.keymap.set("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<cr>")
        vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>")
        vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>")
    end
}
