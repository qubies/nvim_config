-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself
  use {
  'wbthomason/packer.nvim',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tommcdo/vim-exchange',
  
  'Matt-A-Bennett/vim-surround-funk',

  -- lsp support
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  -- and autocomplete....
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippets plugin
  'jupyter-vim/jupyter-vim', -- jupyter
  'hkupty/iron.nvim', -- repl
  'ray-x/lsp_signature.nvim',

  'mhartington/formatter.nvim',
  'lervag/vimtex',
  }
  use {'RRethy/vim-hexokinase', run = 'make hexokinase'}
  
  require "lsp_signature".setup()
  local lsp_installer = require("nvim-lsp-installer")

  use({
	"catppuccin/nvim",
	as = "catppuccin"
})

use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  -- tag = 'release' -- To use the latest release
}

require('gitsigns').setup()

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
  require('formatter').setup({
  filetype = {
    python = {
      -- Configuration for psf/black
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    },
    sh = {
        -- Shell Script Formatter
       function()
         return {
           exe = "shfmt",
           args = { "-i", 2 },
           stdin = true,
         }
       end,
   },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
  }
})


vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.js,*.rs FormatWrite
augroup END
]], true)



  -- Auto pairs, but less agressive, only on enter.
  -- use 'jiangmiao/auto-pairs'

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
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        'nvim-treesitter/nvim-treesitter-textobjects'
      }

  -- statusline 
  use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- file finder and preview
  use {
          'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' },
  }

  -- colorsssssss
  use {
  	'cocopon/iceberg.vim'
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
  	-- 'machakann/vim-sandwich',
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

          use {
  'ggandor/lightspeed.nvim', -- jumper
  }
end)
