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
        "c",
        "cpp",
    },
    command = "setlocal shiftwidth=2 tabstop=2"
})

-- set indent highlight as block in python files
autocmd("Filetype", {
    group = augroup("python indent highlight", { clear = true }),
    pattern = { "python" },
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


-- COMMANDS

-- generate ctags in current directory
command("MakeTags", function()
    os.execute("ctags -R .")
end, {})

-- format with confort with range (optional)
command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
