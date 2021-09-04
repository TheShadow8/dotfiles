local nvim_lsp = require("lspconfig")
require("lsp/lsp-saga")
require("lsp/lsp-colors")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

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
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
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
end

nvim_lsp.flow.setup {
    on_attach = on_attach
}

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end,
    filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
    capabilities = capabilities
}

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

local efm_config = os.getenv("HOME") .. "/.config/efm-langserver/config.yaml"
local efm_log_dir = "/tmp/"
local efm_root_markers = {"package.json", ".git", ".zshrc", ".gomod"}
local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint, prettier},
    javascriptreact = {eslint, prettier},
    typescript = {eslint, prettier},
    typescriptreact = {eslint, prettier},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    go = {goimports, gofumpt},
    lua = {luafmt}
}

nvim_lsp.efm.setup(
    {
        cmd = {
            "efm-langserver",
            "-c",
            efm_config,
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

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        update_in_insert = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = {
            spacing = 4,
            prefix = ""
        }
    }
)

-- require'lspinstall'.setup() -- important
--
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end

-- config that activates keymaps and enables snippet support

-- Configure lua language server for neovim development
local lua_settings = {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = "LuaJIT",
            path = vim.split(package.path, ";")
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim"}
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
            }
        }
    }
}

local function make_config()
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach
    }
end

-- lsp-install
local function setup_servers()
    require "lspinstall".setup()

    -- get all installed servers
    local servers = require "lspinstall".installed_servers()
    -- ... and add manually installed servers

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then
            config.settings = lua_settings
        end

        require "lspconfig"[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
