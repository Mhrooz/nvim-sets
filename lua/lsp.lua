-- LSP 配置
local nvim_lsp = require('lspconfig')

-- 定义 on_attach 函数，在 LSP 客户端 attach 到 buffer 后绑定快捷键
local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end

  -- 快捷键示例：
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')      -- 跳转到定义
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')            -- 查看文档
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')  -- 查看实现
  bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')    -- 重命名
  -- 你可以根据需要添加更多映射
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "CMakeLists.txt",
  callback = function()
    vim.bo.filetype = "cmake"
  end,
})

nvim_lsp.cmake.setup{
  on_attach = function(client, bufnr)
    local bufmap = function(mode, lhs, rhs)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
    end
    -- 示例快捷键映射（可根据需要修改）
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end,
  -- 可选：指定支持的文件类型，确保包括 CMakeLists.txt 文件
  filetypes = { "cmake", "CMakeLists.txt" },
  flags = {
    debounce_text_changes = 150,
  }
}

-- C/C++ 配置（以 clangd 为例）
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  cmd = { "clangd", "--compile-commands-dir=build", "--query-driver=/home/iicd/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-g++"},
}

-- Python 配置（以 pyright 为例）
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
}

-- Shell 配置（以 bash-language-server 为例）
nvim_lsp.bashls.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
}

-- P4 配置：如果你安装了合适的 P4 语言服务器，可类似配置
-- 例如，假设存在名为 "p4ls" 的语言服务器：
-- nvim_lsp.p4ls.setup {
--   on_attach = on_attach,
--   flags = { debounce_text_changes = 150 },
-- }

