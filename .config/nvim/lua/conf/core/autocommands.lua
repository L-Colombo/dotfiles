-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- active buffer highlight in lualine
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.cmd.highlight('lualine_c_buffers_active guifg=#3e8fb0')
  end
})
