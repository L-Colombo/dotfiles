return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            haskell = { "hlint" }
        }
    end
}
