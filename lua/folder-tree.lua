-- 基本配置示例
require("nvim-tree").setup {
  view = {
    width = 30,  -- 文件树窗口宽度
    side = "left",  -- 文件树显示在左侧
  },
  filters = {
    dotfiles = false,  -- 是否隐藏点文件
  },
}

-- 建议设置快捷键来快速打开/关闭 nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

