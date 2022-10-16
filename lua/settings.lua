vim.g.mapleader = " "
vim.g.maplocalleader = ","

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- global options
o.swapfile = true
o.dir = "/tmp"
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.undodir = "/home/renwickt/.undodir"

-- window-local options
wo.number = true
wo.wrap = true
wo.foldmethod = "marker"

-- buffer-local options
bo.expandtab = true
bo.expandtab = true
bo.undofile = true

-- local catppuccin = require("catppuccin")
require("catppuccin").setup({
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	color_overrides = {},
	custom_highlights = {},
})
vim.cmd([[colorscheme catppuccin]])
g.python3_host_prog = "python3"
