-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
        -- Packer can manage itself
        use({
                "wbthomason/packer.nvim",
                "tpope/vim-repeat",
                "tpope/vim-surround",
                "tommcdo/vim-exchange",

                "Matt-A-Bennett/vim-surround-funk",

                -- lsp support
		"williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig",
                
		-- and autocomplete....
                "hrsh7th/nvim-cmp", -- Autocompletion plugin
                "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
                "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
                "L3MON4D3/LuaSnip", -- Snippets plugin
                "ray-x/lsp_signature.nvim",

                "lervag/vimtex",
		
                "lewis6991/gitsigns.nvim",

		--colors
                "RRethy/vim-hexokinase",
                run = "make hexokinase",
                "catppuccin/nvim",
                as = "catppuccin",
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                "nvim-treesitter/nvim-treesitter-textobjects",

                "folke/which-key.nvim",
                "nvim-lualine/lualine.nvim",
                "nvim-telescope/telescope.nvim",
                "sindrets/diffview.nvim",
                "ggandor/lightspeed.nvim", -- jumper
                "terrortylor/nvim-comment",
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons", opt = true,
                "gbprod/yanky.nvim",
        })

        require("which-key").setup({})
        require("yanky").setup({})
	require("telescope").load_extension("yank_history")

	require("mason").setup()
	require("mason-lspconfig").setup()
        require("lsp_signature").setup()

        require("gitsigns").setup()

        require("nvim_comment").setup({
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
                hook = nil,
        })
end)
