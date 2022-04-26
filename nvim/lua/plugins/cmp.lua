local cmp = require("cmp")
local lspkind = require("lspkind")

local check_back_space = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            -- You must install `vim-vsnip` if you use the following as-is.
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    -- You must set mapping if you want.
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm(
            {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            }
        ),
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-n>"), "n")
            elseif vim.fn["vsnip#available"]() == 1 then
                vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
            elseif check_back_space() then
                vim.fn.feedkeys(t("<Tab>"), "n")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-p>"), "n")
            elseif vim.fn["vsnip#available"]() == -1 then
                vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
            else
                fallback()
            end
        end
    },
    -- You should specify your *installed* sources.
    sources = {
        {
            name = "nvim_lsp",
            max_item_count = 20
        },
        {
            name = "buffer",
            max_item_count = 5
        },
        {
            name = "path",
            max_item_count = 5
        },
        {
            name = "vsnip",
            max_item_count = 10
        }
    }
}

require("nvim-autopairs.completion.cmp").setup(
    {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true -- it will auto insert `(` after select function or method item
    }
)