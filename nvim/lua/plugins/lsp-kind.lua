require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    -- with_text = false,

    mode = 'symbol_text',
    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    --

  --protocol.SymbolKind = { }
    -- protocol.CompletionItemKind = {
    --     "", -- Struct
    -- },

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
      Reference =  "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter =  ""
    },
})

