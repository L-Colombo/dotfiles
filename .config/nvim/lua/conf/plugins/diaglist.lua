return {
    "onsails/diaglist.nvim",
    config = function()
        local diaglist = require("diaglist")
        diaglist.init({
            debug = false,
            debounce_ms = 150
        })
        vim.keymap.set("n", "<leader>dw", diaglist.open_all_diagnostics)
        vim.keymap.set("n", "<leader>db", diaglist.open_buffer_diagnostics)
    end
}
