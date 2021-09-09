require "nvim-treesitter.configs".setup {
    context_commentstring = {
        enable = true
    },
    -- matchup = {
    --     enable = true,
    --     disable = {}
    -- },
    highlight = {
        enable = true,
        disable = {
            "html"
        }
    },
    indent = {
        enable = false,
        disable = {}
    },
    autotag = {
        enable = true
    },
    ensure_installed = {
        "tsx",
        "toml",
        "graphql",
        "json",
        "yaml",
        "html",
        "scss",
        "go",
        "javascript",
        "typescript"
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
