return {
  "hrsh7th/nvim-cmp", -- Autocompletion engine and snippet sources
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp") --autocompletion
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" }) -- load custom snippets
    -- uncomment to have blade snippets in Laravel projects
    -- require("luasnip").filetype_extend("php", { "blade" })
    -- uncomment to have html snippets in React projects
    -- require("luasnip").filetype_extend("typescriptreact", { "html" })
    -- require("luasnip").filetype_extend("javascriptreact", { "html" })
    cmp.setup({
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          -- maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
          before = function(entry, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
            return vim_item
          end
        })
      },
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      }
    })
  end
}
