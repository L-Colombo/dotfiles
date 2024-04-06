return {
    { "mfussenegger/nvim-dap", dependencies = "theHamsta/nvim-dap-virtual-text", lazy = true },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio" },
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
    }
}
