return {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    dependencies = { { "nvim-orgmode/orgmode", tag = "0.3.7", } },
    config = function()
        require("org-roam").setup({
            directory = "~/Documents/OrgFiles/org-roam",
            templates = {
                c = {
                    description = "Concept notes",
                    template = "#+STARTUP: content\n\n* Description\n%?\n\n* Bibliography\n\n* Primary sources",
                    target = "con_%[slug].org"
                },
                l = {
                    description = "Literature notes",
                    template =
                    "#+STARTUP: show2levels\n\n* lit_%^{shortTitle}\nAuthor: %^{Author}\nFull title: %^{FullTitle}\nYear: %^{Year}\nType: %^{Type}\nFull reference: %^{FullReference}\n\n* Notes\n\n%?",
                    target = "lit_%[slug].org"
                },
                p = {
                    description = "Project notes",
                    template =
                    "#+STARTUP: content\n\n* %^{title}\nType: %^{Type}\n\n* Description\n%?\n\n* Structure\n \n\n* Concepts\n",
                    target = "pj_%[slug].org"
                }
            }
        })
    end
}
