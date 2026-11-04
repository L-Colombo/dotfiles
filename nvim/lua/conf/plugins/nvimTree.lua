return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            view = {
                relativenumber = true,
                side = "right"
            },
            renderer = {
                indent_markers = {
                    enable = true
                }
            }
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>")
    end
}
