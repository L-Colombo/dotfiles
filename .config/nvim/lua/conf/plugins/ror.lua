return {
    "weizheheng/ror.nvim",
    config = function()
        vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })

        vim.keymap.set("n", "<Leader>rtl", ":lua require('ror.test').run('Line')<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rtf", ":lua require('ror.test').run()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rtc", ":lua require('ror.test').clear()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rta", ":lua require('ror.test').attach_terminal()<CR>", { silent = true })

        vim.keymap.set("n", "<Leader>rfm", ":lua require('ror.finders.model').find()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rfc", ":lua require('ror.finders.controller').find()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rfv", ":lua require('ror.finders.view').find()<CR>", { silent = true })

        vim.keymap.set("n", "<leader>rgm", ":lua require('ror.navigations').go_to_model('normal')<CR>", { silent = true })
        vim.keymap.set("n", "<leader>rgc", ":lua require('ror.navigations').go_to_controller('normal')<CR>",
            { silent = true })
        vim.keymap.set("n", "<leader>rgt", ":lua require('ror.navigations').go_to_test('normal')<CR>", { silent = true })
        vim.keymap.set("n", "<leader>rgv", ":lua require('ror.navigations').go_to_view()<CR>", { silent = true })

        vim.keymap.set("n", "<Leader>rfs", ":lua require('ror.coverage').show()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rch", ":lua require('ror.coverage').clear()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>rfs", ":lua require('ror.frozen_string_literal').add()<CR>", { silent = true })
    end
}
