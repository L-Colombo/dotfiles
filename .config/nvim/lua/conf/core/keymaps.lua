local map = vim.keymap.set

--general keymaps
map({ "i", "v", "s" }, "jk", "<esc>")
map("t", "jk", "<C-\\><C-n>")
map("n", "<leader>nh", ":nohls<CR>")
map("n", "x", '"_x')
map("n", "<leader>ww", "<cmd>set wrap!<cr>")
map("n", "<leader>ss", "<cmd>set spell!<cr>")

-- make
map("n", "<leader>mm", ":make<cr>")
map("n", "<leader>mr", ":make run<cr>")

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
map("n", "]b", ":bn<cr>")
map("n", "[b", ":bp<cr>")
map("n", "<leader>x", ":bd!<cr>")
map("n", "<leader>tt", ":terminal<cr>") -- open terminal buffer

-- split windows
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sx", ":close<CR>")

-- tab commands
map("n", "<leader>to", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- toggle explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
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

-- undotree
map("n", "<leader>ut", ":UndotreeToggle <bar> :UndotreeFocus<cr>")

-- transparency toggle
map("n", "<leader>tr", ":TransparentToggle<cr>")

-- luasnip
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
key("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("s", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
key("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
key("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- neogit/gitsigns
map("n", "<leader>ng", "<cmd>Neogit<cr>")
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>")
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<cr>")
map("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>")
map("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>")

-- lsp
map("n", "gF", vim.lsp.buf.format, {})
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "gD", vim.lsp.buf.declaration, {})
map("n", "gr", vim.lsp.buf.references, {})
map("n", "go", vim.lsp.buf.type_definition, {})
map("n", "gf", vim.diagnostic.open_float, {})
map("n", "cA", vim.lsp.buf.code_action, {})
map("n", "rn", vim.lsp.buf.rename, {})

-- scissors
map("n", "<leader>se", function() require("scissors").editSnippet() end)
map({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)
