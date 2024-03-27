local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({

        "nvim-lua/plenary.nvim", -- essentials
        "tpope/vim-surround",
        "mbbill/undotree",
        {
            "NeogitOrg/neogit",
            lazy = true,
            event = "insertEnter",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim"
            },
            config = true
        },
        {
            "tpope/vim-dadbod",
            lazy = true,
        },
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            config = function()
                require("nvim-tree").setup({ view = { relativenumber = true } })
            end
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
            lazy = true,
            event = "insertEnter"
        },
        {
            "kyazdani42/nvim-web-devicons",
            opts = {
                override_by_extension = {
                    ["tex"] = {
                        icon = " ",
                        color = "#106612",
                        name = "tex"
                    },
                    ["cpp"] = {
                        icon = "",
                        color = "#3fc8eb",
                        name = "cpp"
                    },
                    ["php"] = {
                        icon = "󰌟 ",
                        color = "#6c3e82",
                        name = "php"
                    }
                }
            }
        },
        {
            "lewis6991/gitsigns.nvim",
            opts = {
                signs = {
                    add          = { text = '+' },
                    change       = { text = '~' },
                    changedelete = { text = '%' },
                }
            },
            config = true
        },
        {
            "windwp/nvim-autopairs",
            event = { "insertEnter" },
            dependencies = {
                "hrsh7th/nvim-cmp",
            },
            config = function()
                local autopairs = require("nvim-autopairs")
                autopairs.setup({
                    check_ts = true,
                    ts_config = {
                        lua = { "string" },
                        javascript = { "template_string" },
                        java = false,
                    },
                })
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp = require("cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        },
        {
            'numToStr/Comment.nvim',
            opts = {},
            lazy = false,
        },
        {
            "nvim-lualine/lualine.nvim",
            priority = 1000,
            opts = {
                options = {
                    theme = 'solarized_light',
                    section_separators = '',
                    component_separators = '',
                },
                sections = {
                    lualine_b = { {
                        'branch'
                    } },
                    lualine_c = {
                        {
                            'buffers',
                            hide_filename_extension = true,
                            mode = 4,
                            symbols = {
                                modified = ' ',
                                alternate_file = '',
                            }
                        }
                    },
                    lualine_x = {
                        {
                            'diagnostics'
                        }
                    }
                }
            }
        },
        {
            "nvim-telescope/telescope.nvim",
            branch = "0.1.x",
            opts = {
                defaults = {
                    layout_config = {
                        preview_cutoff = 1,
                    },
                },

            },
            dependencies = {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require "telescope".load_extension("fzf")
                end
            }
        },

        { "VonHeikemen/lsp-zero.nvim", branch = "v3.x", },
        { "williamboman/mason.nvim",   opts = { ui = { border = "rounded" } } },
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",

        "hrsh7th/nvim-cmp", -- Autocompletion engine and snippet sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",


        "lervag/vimtex",
        {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup({
                    filetypes = {
                        "html",
                        "twig",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "jsx",
                        "tsx",
                        "vue"
                    },
                })
            end
        },

        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            opts = {},
            lazy = true,
            event = { "insertEnter" },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
            config = function()
                require 'nvim-treesitter.configs'.setup {
                    ensure_installed = {
                        'javascript',
                        'php',
                        'typescript',
                        'html',
                        'css',
                        'python',
                        'lua',
                        'latex',
                        'json'
                    },
                    sync_install = false,
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true }
                }
            end
        },

        --colorschemes
        {
            "JasonBoyett/Goethe.nvim",
            opts = {
                default_theme = "habamax",
                auto_persist = true,
            }
        },
        "rktjmp/lush.nvim",
        "xiyaowong/transparent.nvim",
        {
            "blazkowolf/gruber-darker.nvim",
            opts = { italic = { strings = false } }
        },
        {
            "ellisonleao/gruvbox.nvim",
            opts = { italic = { strings = false }, contrast = "hard" }
        },
        "axvr/photon.vim",
        "widatama/vim-phoenix",
        "dikiaap//minimalist",
        "sfi0zy/atlantic-dark.vim",
        "ribru17/bamboo.nvim",

        --debugger
        { "mfussenegger/nvim-dap", dependencies = "theHamsta/nvim-dap-virtual-text", lazy = true },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = "mfussenegger/nvim-dap",
            config = function()
                require("dapui").setup()
            end,
            keys = vim.keymap.set('n', '<leader>ui', ':lua require("dapui").toggle()<cr>'),
            lazy = true
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup()
            end,
            lazy = true
        },
        {
            "folke/neodev.nvim",
            opts = { library = { plugins = { "nvim-dap-ui" }, types = true }, }
        },
        --debug, language specific extensions
        {
            "mfussenegger/nvim-dap-python",
            ft = "python",
            config = function()
                require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
            end
        },
        {
            "mxsdev/nvim-dap-vscode-js",
            dependencies = "mfussenegger/nvim-dap",
            ft = "javascript",
            config = function()
                require("dap-vscode-js").setup({
                    debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug",
                    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                })
                for _, language in ipairs({ "typescript", "javascript" }) do
                    require("dap").configurations[language] = {

                        {
                            type = "pwa-node",
                            request = "launch",
                            name = "Launch file",
                            program = "${file}",
                            cwd = "${workspaceFolder}",
                        },
                        {
                            type = "pwa-node",
                            request = "attach",
                            name = "Attach",
                            processId = require 'dap.utils'.pick_process,
                            cwd = "${workspaceFolder}",
                        }

                    }
                end
            end
        },
        {
            "microsoft/vscode-js-debug",
            ft = "javascript",
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        },
    },
    { ui = { border = "rounded" } }
)
