local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/Luasnip'
  -- indentation lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- bar/tabs
  use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }
  --  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
  -- autoformat on save
  use 'lukas-reineke/lsp-format.nvim'
  -- git-sign
  use 'lewis6991/gitsigns.nvim'
  -- diff-view
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- startup dashboard
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup { filetype_exclude = { "dashboard" }
      }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
