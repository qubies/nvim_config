-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lsp support
  use 'neovim/nvim-lspconfig'
  -- and autocomplete....
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'jupyter-vim/jupyter-vim' -- jupyter
  use 'hkupty/iron.nvim' -- repl


  -- Auto pairs, but less agressive, only on enter.
  use 'jiangmiao/auto-pairs'

  -- This changes % matcher to work with if else and wile
  use {'andymass/vim-matchup', event = 'VimEnter'}

  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- a linter ale.
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        'nvim-treesitter/nvim-treesitter-textobjects'
      }

  -- statusline 
  use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {'dracula/vim', as = 'dracula'}

  -- file finder and preview
  use {
          'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' },
  }

  -- colorsssssss
  use {
  	'cocopon/iceberg.vim'
  }
  vim.cmd 'colorscheme iceberg'

  use {
  	'machakann/vim-sandwich',
	'terrortylor/nvim-comment'
  	  }
	  require('nvim_comment').setup(
{
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- Hook function to call before commenting takes place
  hook = nil
}
	  )

end)
