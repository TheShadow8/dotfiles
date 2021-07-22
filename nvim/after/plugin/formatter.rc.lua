require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
       function()
          return {
            exe = "eslint_d",
            args = { "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), '--fix-to-stdout'},
            stdin = true
          }
        end
    },

   typescript = {
       function()
          return {
            exe = "eslint_d",
            args = { "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), '--fix-to-stdout'},
            stdin = true
          }
        end
    },
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua,*.go FormatWrite
augroup END
]], true)

