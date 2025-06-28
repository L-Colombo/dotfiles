-- NB: All the plugins that have their own config file
-- have their keymaps defined there

local map = vim.keymap.set

-- general keymaps
map({ "i", "v", "s" }, "jk", "<esc>")
map("t", "jk", "<C-\\><C-n>")
map("n", "<leader>nh", ":nohls<CR>")
map({ "n", "v" }, "x", '"_x')
map("n", "<leader>ww", "<cmd>set wrap!<cr>")
map("n", "<leader>ss", "<cmd>set spell!<cr>")
map({ "n", "v" }, "<Tab>", "==")
map("n", "<leader>L", "<cmd>Lazy<cr>")
map("n", "<leader>tr", "<cmd>hi Normal guibg=None<cr>")

-- moving and motion
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("v", "<up>", "gk")
map("v", "<down>", "gj")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- center screen afer search and pgUp/pgDown and paragraph moving
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", ")", ")zz")
map("n", "(", "(zz")
map("n", "}", "}zz")
map("n", "{", "{zz")

-- buffer related
map("n", "<leader>x", ":bd!<cr>")
map("n", "<leader>tt", ":terminal<cr>")

-- split windows
map("n", "<C-x>0", ":close<CR>")
map("n", "<C-x>1", "<C-w>o")
map("n", "<C-x>2", "<C-w>s")
map("n", "<C-x>3", "<C-w>v")

-- moving across split windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- tab commands
map("n", "<leader>to", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- diagnostic
map("n", "gf", vim.diagnostic.open_float)

-- Easy register yank
map("v", "<leader>1", '"1y')
map("v", "<leader>2", '"2y')
map("v", "<leader>3", '"3y')
map("v", "<leader>4", '"4y')
map("v", "<leader>5", '"5y')
map("v", "<leader>6", '"6y')
map("v", "<leader>7", '"7y')
map("v", "<leader>8", '"8y')
map("v", "<leader>9", '"9y')

-- Easy register put
map("n", "<leader>p1", '"1p')
map("n", "<leader>p2", '"2p')
map("n", "<leader>p3", '"3p')
map("n", "<leader>p4", '"4p')
map("n", "<leader>p5", '"5p')
map("n", "<leader>p6", '"6p')
map("n", "<leader>p7", '"7p')
map("n", "<leader>p8", '"8p')
map("n", "<leader>p9", '"9p')
