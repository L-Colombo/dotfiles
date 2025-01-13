return {
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup({
            filetypes = {
                "html",
                "eruby",
                "twig",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "jsx",
                "tsx",
                "vue"
            },
        })
    end
}
