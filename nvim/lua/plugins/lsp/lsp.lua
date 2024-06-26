return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
  },
  config = function()
    local nvim_lsp = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }

    local function lsp_highlight_document(client)
      -- Set autocommands conditional on server_capabilities
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_exec(
          [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
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
      buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      buf_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      buf_set_keymap("n", "<space>la", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
      buf_set_keymap("n", "<space>lr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
      buf_set_keymap("n", "<space>ll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
      buf_set_keymap("n", "<space>ld", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      buf_set_keymap("n", "<space>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      buf_set_keymap("n", "<space>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
      --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      -- buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap("n", "<space>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
      buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

      -- formatting
      -- if client.server_capabilities.documentFormattingProvider then
      --     vim.api.nvim_command [[augroup Format]]
      --     vim.api.nvim_command [[autocmd! * <buffer>]]
      --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      --     vim.api.nvim_command [[augroup END]]
      -- end

      lsp_highlight_document(client)
    end

    local signs = { Error = "❌", Warn = "⚠️", Hint = "💬", Information = "🔎" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Set which codelens text levels to show
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
    })

    -- icon
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = {
        priority = 99,
      },
      -- update_in_insert = true
      -- This sets the spacing and the prefix, obviously.
    })

    nvim_lsp.flow.setup({
      on_attach = on_attach,
    })

    nvim_lsp.gopls.setup({})

    nvim_lsp.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    nvim_lsp.tsserver.setup({
      on_attach = on_attach,
      -- handlers = {
      --     ["textDocument/publishDiagnostics"] = function()
      --     end
      -- }
    })

    -- local prettier = {
    --   formatCommand = "prettier --find-config-path --stdin-filepath ${INPUT}",
    --   formatStdin = true
    -- }

    local eslint = {
      lintCommand = "eslint_d --stdin --stdin-filename ${INPUT} -f unix",
      lintStdin = true,
      lintIgnoreExitCode = true,
    }

    -- local luafmt = {
    --     formatCommand = "luafmt --stdin",
    --     formatStdin = true
    -- }

    -- local goimports = {
    -- 	formatCommand = "goimports",
    -- 	formatStdin = true,
    -- }

    -- local gofumpt = {
    -- 	formatCommand = "gofumpt -extra",
    -- 	formatStdin = true,
    -- }

    local efm_log_dir = "/tmp/"
    local efm_root_markers = { "package.json", ".git", ".zshrc", ".gomod", ".bashrc" }
    local efm_languages = {
      javascript = { eslint },
      javascriptreact = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
      -- go = { gofumpt, goimports },
      -- lua = {luafmt}
    }

    nvim_lsp.efm.setup({
      cmd = {
        "efm-langserver",
        "-logfile",
        efm_log_dir .. "efm.log",
      },
      filetype = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      on_attach = on_attach,
      root_dir = nvim_lsp.util.root_pattern(unpack(efm_root_markers)),
      -- init_options = {
      -- 	documentFormatting = true,
      -- },
      settings = {
        rootMarkers = efm_root_markers,
        languages = efm_languages,
      },
    })
  end,
}
