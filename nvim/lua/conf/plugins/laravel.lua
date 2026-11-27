return {
    "adalessa/laravel.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-neotest/nvim-nio",
    },
    ft = { "php", "blade" },
    event = { "BufEnter composer.json" },
    keys = {
        { "<leader>ll", function() Laravel.pickers.laravel() end,              desc = "Laravel: Picker" },
        { "<leader>la", function() Laravel.pickers.artisan() end,              desc = "Laravel: Artisan Picker" },
        { "<leader>lr", function() Laravel.pickers.routes() end,               desc = "Laravel: Routes Picker" },
        { "<leader>lm", function() Laravel.pickers.make() end,                 desc = "Laravel: Make Picker" },
        { "<leader>lc", function() Laravel.pickers.commands() end,             desc = "Laravel: Custom Commands Picker" },
        { "<leader>lR", function() Laravel.pickers.resources() end,            desc = "Laravel: Resources Picker" },
        { "<leader>ld", function() Laravel.run("artisan docs") end,            desc = "Laravel: Documentation" },
        { "<leader>lA", function() Laravel.commands.run("actions") end,        desc = "Laravel: Code Actions" },
        { "<leader>lh", function() Laravel.commands.run("hub") end,            desc = "Laravel: Artisan Hub" },
        { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Command Center" },
        -- { "<c-g>",      function() Laravel.commands.run("view:finder") end,    desc = "Laravel: View Finder" },
        {
            "<leader>lg",
            function()
                if Laravel.app("gf").cursorOnResource() then
                    return "<cmd>lua Laravel.commands.run('gf')<cr>"
                end
                return "gf"
            end,
            expr = true,
            noremap = true,
            desc = "Laravel: Go to resource",
        },
    },
    opts = {
        features = {
            pickers = {
                provider = "telescope", -- telescope | fzf-lua | snacks | ui.select
            },
        },
    },
}
