local nvim_lsp = require("lspconfig")
require("lsp/lsp-saga")
require("lsp/lsp-colors")

require("nvim-lsp-installer").setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end

---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  lsp_highlight_document(client)
end

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Set which codelens text levels to show
vim.diagnostic.config(
  {
  virtual_text = {
    prefix = ""
  }
}
)

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
  signs = {
    priority = 99
  },
  update_in_insert = true
  -- This sets the spacing and the prefix, obviously.
}
)

nvim_lsp.flow.setup {
  on_attach = on_attach
}

nvim_lsp.golangci_lint_ls.setup {}
nvim_lsp.gopls.setup {
  on_attach = on_attach
}

require("rust-tools").setup(
  {
  tools = {
    -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = ""
    }
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  }
}
)

-- nvim_lsp.solang.setup(
--   {
--   cmd = {
--     "solang",
--     "--language-server",
--     "--target",
--     "ewasm",
--     "--importmap=@openzeppelin=node_modules/@openzeppelin",
--     "--importmap=@chainlink=node_modules/@chainlink"
--   }
-- }
-- )

nvim_lsp.solc.setup(
  {
  cmd = {
    "solc",
    "--lsp",
    "@openzeppelin/=$(pwd)/node_modules/@openzeppelin/",
    "contracts/**/*.sol"
  }
}
)

-- nvim_lsp.rust_analyzer.setup {}

nvim_lsp.sumneko_lua.setup(
  {
  settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  },
  on_attach = on_attach
}
)

nvim_lsp.tsserver.setup(
  {
  on_attach = on_attach
  -- handlers = {
  --     ["textDocument/publishDiagnostics"] = function()
  --     end
  -- }
}
)

local prettier = {
  formatCommand = "prettier --find-config-path --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint = {
  lintCommand = "eslint_d --stdin --stdin-filename ${INPUT} -f unix",
  lintStdin = true,
  lintIgnoreExitCode = true
}

local luafmt = {
  formatCommand = "luafmt --stdin",
  formatStdin = true
}

local goimports = {
  formatCommand = "goimports",
  formatStdin = true
}

local gofumpt = {
  formatCommand = "gofumpt -extra",
  formatStdin = true
}

local efm_log_dir = "/tmp/"
local efm_root_markers = { "package.json", ".git", ".zshrc", ".gomod", ".bashrc" }
local efm_languages = {
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
  javascript = { eslint, prettier },
  javascriptreact = { eslint, prettier },
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  less = { prettier },
  graphql = { prettier },
  vue = { prettier },
  html = { prettier },
  go = { gofumpt, goimports },
  lua = { luafmt }
}

nvim_lsp.efm.setup(
  {
  cmd = {
    "efm-langserver",
    "-logfile",
    efm_log_dir .. "efm.log"
  },
  filetype = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "go",
    "lua"
  },
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern(unpack(efm_root_markers)),
  init_options = {
    documentFormatting = true
  },
  settings = {
    rootMarkers = efm_root_markers,
    languages = efm_languages
  }
}
)
