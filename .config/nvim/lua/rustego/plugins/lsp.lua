local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'volar',
        'solargraph',
        'jdtls',
        'eslint',
        'pyright',
        'html',
        'cssls',
        'lua_ls',
        'texlab',
        'clangd',
        'intelephense',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },

    servers = {
        ['lua_ls'] = { 'lua' },
        ['pyright'] = { 'python' },
        ['unocss'] = { 'css' },
        ['html'] = { 'html' },
        ['jsonls'] = { 'JSON' },
        ['clangd'] = { 'c', 'cpp' },
        ['bashls'] = { 'bash' },
        ['intelephense'] = { 'php' },
        ['volar'] = { 'vue' },
        ['tsserver'] = {
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact'
        },
    }
})

require("lspconfig").intelephense.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").solargraph.setup({})
require("lspconfig").jdtls.setup({})
require("lspconfig").volar.setup({})


lsp.setup()


local cmp = require('cmp') --autocompletion

require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup({
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-g>"] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            return vim_item
        end
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    }
})
