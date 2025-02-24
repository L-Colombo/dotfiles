return {
    "akinsho/org-bullets.nvim",
    config = function()
        require("org-bullets").setup({
            concealcursor = true,
            symbols = {
                headlines = { " " },
                list = "",
            }
        })
    end
}
