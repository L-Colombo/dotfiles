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

-- set indent highlight as block in python files
autocmd("Filetype", {
  group = augroup("python indent highlight", { clear = true }),
  pattern = { "python" },
  callback = function()
    local highlight = {
      "CursorColumn",
      "Whitespace",
    }
    require("ibl").setup {
      indent = { highlight = highlight, char = "" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    }
  end
})
