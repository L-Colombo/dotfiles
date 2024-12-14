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

-- set indent guides color
autocmd("BufEnter", {
  desc = "Set the right indent guides colors",
  group = augroup("Visual", { clear = true }),
  callback = function()
    vim.cmd.highlight("IndentLine guifg=#666666")
    vim.cmd.highlight("IndentLineCurrent guifg=#666666")
  end
})

-- format on save
autocmd("BufWritePre", {
  desc = "Format code on save",
  group = augroup("Formatting", { clear = true }),
  callback = function()
    local bufnr = vim.fn.winbufnr(0)
    if vim.lsp.buf_is_attached(bufnr) then
      vim.lsp.buf.format()
    end
  end
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
