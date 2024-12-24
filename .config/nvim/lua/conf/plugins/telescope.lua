return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    opts = {
        defaults = {
            layout_config = {
                preview_cutoff = 1,
            },
        },

    },
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require "telescope".load_extension("fzf")
        end
    }
}
