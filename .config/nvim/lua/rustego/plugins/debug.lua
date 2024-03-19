--NVIM-DAP
vim.keymap.set('n', '<leader>db', ':lua require("dap").continue()<cr>')
vim.keymap.set('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<cr>')
vim.keymap.set('n', '<leader>in', ':lua require("dap").step_into()<cr>')

vim.fn.sign_define('DapBreakpoint', {
    text = '🔴',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})
