return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require "telescope".load_extension("fzf")
        end
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                layout_config = {
                    preview_cutoff = 1,
                },
                file_ignore_patterns = {
                    "dune"
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = actions.delete_buffer
                        },
                    },
                }
            }
        })
        -- keymaps
        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
        vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
        vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
        -- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>")
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
        vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
        vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>")
        vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
        vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>")
        vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>")
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>")
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
        -- lsp + telescope
        vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>")
        -- vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_workspace_symbols<cr>")
        vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_document_symbols<cr>")
    end
}
