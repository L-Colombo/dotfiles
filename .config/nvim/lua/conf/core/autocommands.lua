local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- set right color
autocmd("BufEnter", {
  desc = "Set the right indent guides colors",
  group = augroup("Visual", { clear = true }),
  callback = function ()
      vim.cmd.highlight("IndentLine guifg=#666666")
      vim.cmd.highlight("IndentLineCurrent guifg=#666666")
    end
})

-- set indentation to 2 for specific filetypes
autocmd("Filetype", {
  group = augroup("setIndent", { clear = true }),
  pattern = {
    "c",
    "javascript",
    "typescript",
    "haskell",
    "lua",
    "jsx",
    "tsx",
    "typescriptreact",
    "javascriptreact"
  },
  command = "setlocal shiftwidth=2 tabstop=2"
})
