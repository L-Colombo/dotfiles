local keymap = vim.keymap

--general keymaps
keymap.set("i", "jk", "<esc>")
keymap.set('v', 'jk', '<esc>')
keymap.set('s', 'jk', '<esc>')
keymap.set('t', 'jk', '<C-\\><C-n>')
keymap.set("n", "<leader>nh", ":nohls<CR>")
keymap.set("n", "x", '"_x')
keymap.set('i', '<C-f>', '<Right>')
keymap.set('i', '<C-b>', '<Left>')
keymap.set('n', '<leader>y', '^y$')

-- make
keymap.set('n', '<leader>mm', ':make<cr>')
keymap.set('n', '<leader>mr', ':make run<cr>')

keymap.set("n", "<C-h>", ":wincmd h<cr>") -- moving across split panes
keymap.set("n", "<C-j>", ":wincmd j<cr>")
keymap.set("n", "<C-k>", ":wincmd k<cr>")
keymap.set("n", "<C-l>", ":wincmd l<cr>")

-- moving e motion
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set('v', "<up>", "gk")
keymap.set('v', "<down>", "gj")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set('n', 'n', 'nzz') --center screen afer search and pgUp/pgDown
keymap.set('n', 'N', 'Nzz')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

keymap.set('n', '<S-l>', ':bn<cr>') --buffer related
keymap.set('n', '<S-h>', ':bp<cr>')
keymap.set('n', '<leader>x', ':bd!<cr>')
keymap.set('n', '<leader>tt', ':terminal<cr>') --open terminal buffer

--split windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

--tab commands
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Toggle Explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>")
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>")
keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>")
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")

--VimTex
keymap.set('n', '<leader>c', ':VimtexCompileSS<CR>')

--UndoTree
keymap.set('n', '<leader>ut', ":UndotreeToggle <bar> :UndotreeFocus<cr>")

--Transparency Toggle
keymap.set('n', '<leader>tr', ':TransparentToggle<cr>')

-- LuaSnip
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
key("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
key("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
