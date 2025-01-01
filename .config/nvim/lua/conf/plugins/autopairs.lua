return {
    "windwp/nvim-autopairs",
    event = { "insertEnter" },
    config = function()
        local autopairs = require("nvim-autopairs")
        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        })
    end
}
