return {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
        require("crates").setup({
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true
            },
            completion = {
                crates = {
                    enabled = true,
                    max_results = 8,
                    min_chars = 2
                }
            }
        })
    end
}
