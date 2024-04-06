return {
    "lervag/vimtex",
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_log_ignore = { 'Underfull', 'Overfull', 'specifier changed to', 'Token not allowed in a PDF string', }
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_mappings_enabled = 1
        vim.g.vimtex_indent_enabled = 1
        vim.g.vimtex_syntax_enabled = 1
    end
}
