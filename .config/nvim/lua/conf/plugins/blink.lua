return {
    "saghen/blink.cmp",
    version = "*",
    -- dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        keymap = {
            preset = "default",
            ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
            ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
            ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
            ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
            ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
            ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
            ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
            ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
            ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
            ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },

            -- custom
            ["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<c-j>"] = { "snippet_forward", "fallback" },
            ["<c-k>"] = { "snippet_backward", "fallback" },
            ["<Tab>"] = {},
            ["<S-Tab>"] = {},
            ["<C-space>"] = {},
        },
        completion = {
            documentation = {
                window = {
                    border = "single",
                },
            },
            menu = {
                auto_show = function(ctx)
                    return ctx.mode ~= "cmdline"
                end,
                border = "single",
                draw = {
                    columns = {
                        { "item_idx" },
                        { "kind_icon" },
                        { "label",    "label_description", gap = 1 },
                    },
                    components = {
                        item_idx = {
                            text = function(ctx)
                                return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                            end,
                            highlight = "BlinkCmpItemIdx",
                        }
                    },
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "single",
            },
        },
        sources = {
            default = { "lsp", "snippets", "path", "buffer" },
        },
    },
    opts_extend = { "sources.default" }
}
