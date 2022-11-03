local saga = require("lspsaga")

saga.init_lsp_saga(
    {
        border_style = "bold",
        -- show_diagnostic_source = true,
        -- diagnostic_header = {" ", " ", " ", "ﴞ "},
        -- diagnostic_header = {" ", " ", " ", " "},

        max_preview_lines = 20,
        code_action_icon = " ",
        code_action_lightbulb = {
            enable = true,
            sign = false,
            -- sign_priority = 20,
            virtual_text = true
        },
        finder_action_keys = {
            open = "<CR>",
            quit = "<ESC>"
            -- quit can be a table
        },
        code_action_keys = {
            quit = "<ESC>"
        },
        rename_action_quit = "<ESC>"
    }
)
