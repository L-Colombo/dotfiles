local opt = vim.opt

vim.cmd([[autocmd TermOpen * startinsert]])

-- opt.guicursor = "n-v-c-i:block"
opt.linebreak = true
opt.relativenumber = true
opt.number = true
opt.swapfile = false
opt.cursorline = true
opt.cursorlineopt = "number"

-- netrw file explorer
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_banner = 0

-- tab & indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- apearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- scrolloff
opt.scrolloff = 2

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- folding authomatically enabled
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

-- diagnostic
vim.diagnostic.config({
    virtual_text = true
})

-- window border
vim.o.winborder = "rounded"
