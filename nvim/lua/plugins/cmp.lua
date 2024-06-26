return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictogramso
    "zbirenbaum/copilot-cmp",
    "zbirenbaum/copilot.lua",
  },
  config = function()
    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    local lspkind = require("lspkind")
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })

    require("copilot_cmp").setup()

    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = lspkind.cmp_format({
          mode = "symbol",
          preset = "codicons",
          symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "﬌",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Copilot = "",
          },
          before = function(entry, item)
            local short_name = {
              nvim_lsp = "LSP",
              nvim_lua = "nvim",
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format("[%s]", menu_name)
            return item
          end,
        }),
      },
      snippet = {
        expand = function(args)
          -- You must install `vim-vsnip` if you use the following as-is.
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      -- You must set mapping if you want.
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
      },
      -- You should specify your *installed* sources.
      sources = {
        {
          name = "copilot",
          max_item_count = 5,
        },
        {
          name = "nvim_lsp",
          max_item_count = 10,
        },
        {
          name = "buffer",
          max_item_count = 5,
        },
        {
          name = "path",
          max_item_count = 5,
        },
        {
          name = "vsnip",
          max_item_count = 10,
        },
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
