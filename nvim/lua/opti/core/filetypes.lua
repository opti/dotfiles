-- Set syntax for *.avsc files
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  pattern = '*.avsc',
  command = 'set syntax=jsonc'
})
