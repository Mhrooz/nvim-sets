vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.bean*",
  callback = function()
    -- 设置主文件路径
    vim.g.beancount_main_file = "/Users/hanzhangma/beancount/main.beancount"
    vim.b.beancount_root = "/Users/hanzhangma/beancount/main.beancount"
    -- 你也可以在这里执行相关配置，比如引用账户定义
  end
})

vim.api.nvim_set_keymap('i', '<C-Space>', '<C-X><C-O>', { noremap = true, silent = true })
