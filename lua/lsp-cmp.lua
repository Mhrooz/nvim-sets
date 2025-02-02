-- 自动补全配置
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- 这里使用 LuaSnip 作为示例代码片段引擎
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),    -- 手动触发补全
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- 选择下一个补全项
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- 选择上一个补全项
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- 来自 LSP 的补全
    { name = 'luasnip' },   -- 来自代码片段
  }, {
    { name = 'buffer' },    -- 来自当前 buffer 的补全
  })
})

