return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                'javascript',
                'php',
                'typescript',
                'html',
                'css',
                'python',
                'lua',
                'latex',
                'json'
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        }
    end
}
