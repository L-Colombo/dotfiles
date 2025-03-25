local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- AUTOCOMMANDS

-- highlight on yank
autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- set indentation to 2 for specific filetypes
autocmd("Filetype", {
    group = augroup("setIndent", { clear = true }),
    pattern = {
        "c",
        "cpp",
        "haskell",
        "ocaml",
    },
    command = "setlocal shiftwidth=2 tabstop=2"
})

-- set indent highlight as block in python and haskell files
autocmd("Filetype", {
    group = augroup("python and haskell indent highlight", { clear = true }),
    pattern = {
        "python",
        "ocaml"
    },
    callback = function()
        local highlight = {
            "CursorColumn",
            "Whitespace",
        }
        require("ibl").setup {
            indent = { highlight = highlight, char = "" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
        }
    end
})

-- set filetype for blade files
vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

-- activate spell check in LaTex and Org-mode files
autocmd("Filetype", {
    group = augroup("setSpell", { clear = true }),
    pattern = {
        "tex",
        "org",
        "gitcommit"
    },
    command = "set spell"
})
