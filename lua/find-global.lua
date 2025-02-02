-- 例如映射 <leader>ff 查找文件，<leader>fg 进行全文搜索
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

