return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
        require("orgmode").setup({
            org_agenda_files = {
                "~/Documents/OrgFiles/capture/agenda.org",
                -- "~/Documents/OrgFiles/capture/todos.org",
            },
            org_capture_templates = {
                a = {
                    description = "Agenda",
                    template = "* %?\n %T \n"
                }
            },
            org_blank_before_new_entry = {
                heading = false,
                plain_list_item = false
            },
            org_adapt_indentation = false,
            org_hide_emphasis_markers = true,
            org_ellipsis = " ",
            org_startup_folded = "content",
            org_startup_indented = true,
        })
    end,
}
