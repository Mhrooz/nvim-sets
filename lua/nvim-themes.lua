-- 可选：配置 tokyo‑night 参数，详细配置参考插件文档
require("tokyonight").setup({
  style = "night",        -- 可选项："night", "storm", "day"
  transparent = false,    -- 是否启用透明背景
  terminal_colors = true, -- 是否设置终端颜色
  -- 更多配置选项请查阅插件文档
})

-- 启用主题
vim.cmd("colorscheme tokyonight")

