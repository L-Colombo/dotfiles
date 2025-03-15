return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            endwise = {
                enable = true
            },
            sync_install = false,
            auto_install = false,
            highlight = { enable = true },
            indent = {
                enable = true,
                disable = { "ocaml" }
            },
        }
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade"
        }
    end
}
