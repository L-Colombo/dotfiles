return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
        snippetDir = "~/.config/nvim/snippets",
        editSnippetPopup = {
            keymaps = {
                deleteSnippet = "X"
            }
        }
    },
}
