-- function format_prettier()
--    return {
--      exe = "prettier",
--      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
--      stdin = true
--    }
-- end

-- function format_eslint()
--    return {
--     exe = "eslint_d",
--     args = { "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), '--fix-to-stdout'},
--     stdin = true
--    }
-- end

-- require('formatter').setup({
--   logging = false,


--   filetype = {
--     javascript = { format_eslint },
--     javascriptreact = { format_eslint },

--     typescript = { format_eslint },
--     typescriptreact = { format_eslint },
--   }
-- })

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua,*.go FormatWrite
-- augroup END
-- ]], true)
