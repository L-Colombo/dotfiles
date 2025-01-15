return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
        snippetDir = "~/.config/nvim/snippets"
    },
    config = function()
        -- scissors
        vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
        vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)
    end
}
