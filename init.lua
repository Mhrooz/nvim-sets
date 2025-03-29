vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.cursorline=true

vim.o.number = true
vim.o.relativenumber = true
-- 自动安装 packer.nvim（可选）
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 使用 packer.nvim 管理插件
require('packer').startup(function(use)
  -- Packer 自身
  use 'wbthomason/packer.nvim'

  -- LSP 配置
  use 'neovim/nvim-lspconfig'
  use '/Users/hanzhangma/.config/nvim/plugin/vim-p4-syntax'

  -- 自动补全引擎及相关插件
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- 代码片段插件及补全源（可选）
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'folke/tokyonight.nvim'

  -- nvim tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- find globally
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-lua/plenary.nvim'}

  -- support beancount
  use 'nathangrigg/vim-beancount'

  -- Treesitter 语法高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'akinsho/toggleterm.nvim'


  -- ALE 异步检查及实时编译
  use 'dense-analysis/ale'

  use 'andweeb/presence.nvim'

  -- 如果需要调试支持，后续可以考虑使用 nvim-dap
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/nvim-dap-ui'

  -- 自动同步（如果是第一次安装 packer）
  if packer_bootstrap then
    require('packer').sync()
  end
end)
require("lsp")
require("nvim-themes")
require("lsp-cmp")
require("folder-tree")
require("find-global")
require("bcount")
require("togglet")



