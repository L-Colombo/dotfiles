local map = vim.keymap.set

--general keymaps
map({ "i", "v", "s" }, "jk", "<esc>")
map("t", "jk", "<C-\\><C-n>")
map("n", "<leader>nh", ":nohls<CR>")
map("n", "x", '"_x')
map("n", "<leader>ww", "<cmd>set wrap!<cr>")
map("n", "<leader>ss", "<cmd>set spell!<cr>")

-- insert mode moving left & right
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

-- make
map("n", "<leader>mm", ":make<cr>")
map("n", "<leader>mr", ":make run<cr>")

-- moving across split panes
map("n", "<C-h>", ":wincmd h<cr>")
map("n", "<C-j>", ":wincmd j<cr>")
map("n", "<C-k>", ":wincmd k<cr>")
map("n", "<C-l>", ":wincmd l<cr>")

-- moving and motion
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("v", "<up>", "gk")
map("v", "<down>", "gj")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

--center screen afer search and pgUp/pgDown
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--buffer related
map("n", "<S-l>", ":bn<cr>")
map("n", "<S-h>", ":bp<cr>")
map("n", "<leader>x", ":bd!<cr>")
map("n", "<leader>tt", ":terminal<cr>") --open terminal buffer

--split windows
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sx", ":close<CR>")

--tab commands
map("n", "<leader>to", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- Toggle Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>")

--telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
map("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
map("n", "<leader>fr", "<cmd>Telescope registers<cr>")
map("n", "<leader>fm", "<cmd>Telescope marks<cr>")
map("n", "<leader>fj", "<cmd>Telescope jumplist<cr>")
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>")

--VimTex
map("n", "<leader>c", ":VimtexCompileSS<CR>")

--UndoTree
map("n", "<leader>ut", ":UndotreeToggle <bar> :UndotreeFocus<cr>")

--Transparency Toggle
map("n", "<leader>tr", ":TransparentToggle<cr>")

-- LuaSnip
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
key("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
key("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- Neogit/Gitsigns
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
map("n", "<leader>ng", "<cmd>Neogit<cr>")

-- LSP
map("n", "<leader>li", "<cmd>lua vim.lsp.buf.hover()<cr>")
map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>")
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
map("n", "<leader>lf", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- Scissors
map("n", "<leader>se", function() require("scissors").editSnippet() end)
map({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

-- dbee
map("n", "<leader>dt", "<cmd>Dbee toggle<cr>")
