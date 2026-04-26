local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local command = vim.api.nvim_create_user_command

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
        "gleam",
        "haskell",
        "javascript",
        "javascriptreact",
        "ocaml",
        "typescript",
        "typescriptreact"
    },
    command = "setlocal shiftwidth=2 tabstop=2"
})
--
-- set indentation to 2 for specific filetypes
autocmd("Filetype", {
    group = augroup("setMkprg", { clear = true }),
    pattern = {
        "rust"
    },
    command = "set makeprg=make"
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
        "gitcommit",
        "markdown",
        "org",
        "tex",
    },
    command = "set spell"
})

-- set conceallevel only on org files
autocmd("Filetype", {
    group = augroup("conceal", { clear = true }),
    pattern = { "org" },
    callback = function()
        vim.opt.conceallevel = 2
        vim.opt.concealcursor = "nc"
    end
})

-- remove double window border in Telescope
autocmd("User", {
    pattern = "TelescopeFindPre",
    callback = function()
        vim.opt_local.winborder = "none"
        autocmd("WinLeave", {
            once = true,
            callback = function()
                vim.opt_local.winborder = "rounded"
            end,
        })
    end,
})

-- Format with lsp
command("Format",
    function()
        vim.lsp.buf.format()
    end, {})

vim.keymap.set("n", "g=", "<cmd>Format<cr>")

autocmd("BufWritePre", {
    group = augroup("fmtOnSave", { clear = true }),
    command = "Format"
})
