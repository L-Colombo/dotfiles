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
    end
}
