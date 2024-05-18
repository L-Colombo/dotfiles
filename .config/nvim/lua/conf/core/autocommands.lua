local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


-- highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- set indentation to 2 for specific filetypes
autocmd("Filetype", {
  group = augroup("setIndent", { clear = true }),
  pattern = {
    "javascript",
    "typescript",
    "lua",
    "jsx",
    "tsx",
    "typescriptreact",
    "javascriptreact"
  },
  command = "setlocal shiftwidth=2 tabstop=2"
})
