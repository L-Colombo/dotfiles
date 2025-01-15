return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add          = { text = '+' },
            change       = { text = '~' },
            changedelete = { text = '%' },
        }

    },
    config = function()
        require('gitsigns').setup {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map('n', '<leader>gs', gitsigns.stage_hunk)
                map('n', '<leader>gr', gitsigns.reset_hunk)
                map('n', '<leader>gu', gitsigns.undo_stage_hunk)
                map('n', '<leader>gh', gitsigns.preview_hunk)
                map('n', '<leader>gp', gitsigns.prev_hunk)
                map('n', '<leader>gn', gitsigns.next_hunk)
            end
        }
    end

}
