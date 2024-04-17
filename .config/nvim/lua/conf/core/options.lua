local opt = vim.opt

vim.cmd([[autocmd TermOpen * startinsert]])

opt.guicursor = "n-v-c-i:block"
opt.linebreak = true
opt.scrolloff = 10
opt.relativenumber = true
opt.number = true
opt.swapfile = false
opt.cursorline = true
opt.cursorlineopt = "number,line"

--netrw file explorer
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_banner = 0

--tab & indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--search settings
opt.ignorecase = true
opt.smartcase = true

--apearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

--folding authomatically enabled
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("set nofoldenable")
